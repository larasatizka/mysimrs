<?php

/******************************************************************************
 *                                                                            *
 *  * Copyright (c) 2024.                                                     *
 *  * Develop By: Alexsander Hendra Wijaya                                    *
 *  * Github: https://github.com/alexistdev                                   *
 *  * Phone : 0823-7140-8678                                                  *
 *  * Email : Alexistdev@gmail.com                                            *
 *                                                                            *
 ******************************************************************************/

namespace App\Http\Controllers\Dokter;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dokter\PeriksaRequest;
use App\Models\Karyawans;
use App\Models\Pasien;
use App\Models\Rekam;
use App\Models\User;


use App\Services\Pendaftaran\PendaftaranService;
use app\Services\Pendaftaran\RekamRepositoryInterface;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mockery\Exception;

class DataRekamController extends Controller
{
    protected User $users;
    protected int $totalSelesai = 0;

    protected PendaftaranService $pendaftaranService;
    protected int $dokterID;

    public function __construct(PendaftaranService $pendaftaranService)
    {
        $this->middleware(function ($request, $next) {
            $this->users = Auth::user();
            $this->dokterID = Karyawans::with('dokter')->where('user_id', $this->users->id)->first()->dokter->id;
            return $next($request);
        });
        $this->pendaftaranService = $pendaftaranService;
    }

    public function index()
    {
        $rekam = Rekam::with('pasien', 'antrian')->today()->get()->sortBy('antrian');
        $this->totalSelesai =  $rekam->where('status','2')->count();
        // $dataPasien= $rekam->whereIn('status',['0','1']);
        $dataPasien= $rekam;
        return view('dokter.pemeriksaan', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'pemeriksaan',
            'secondMenu' => 'pemeriksaan',
            'dataRekam' => $dataPasien,
            'totalSelesai' => $this->totalSelesai
        ));
    }

    public function detail_pasien($id)
    {
        try {
            $idPasien = base64_decode($id);
            $pasien = Pasien::findOrFail($idPasien);
            $rekam = Rekam::with('pasien')->where('pasien_id', $idPasien)->get();
            $dataRekam = $rekam->first();
            $resep = \DB::table('reseps as rs')
            ->join('obats as ob', 'ob.id', '=', 'rs.obat_id')
            ->join('rekams as rk', 'rk.id', '=', 'rs.rekam_id')
            ->join('pasiens as ps', 'ps.id', '=', 'rk.pasien_id')
            ->where('ps.id', '=', $idPasien)
            ->select('rs.*', 'ob.name as obat')
            ->get();
            return view('apotik.detailpasien', array(
                'title' => "Dashboard Administrator | MyKlinik v.1.0",
                'firstMenu' => 'pemeriksaan',
                'secondMenu' => 'pemeriksaan',
                'dataPasien' => $pasien,
                'dataRekam' => $dataRekam,
                'dataResep' => $resep,
            ));
        } catch (Exception $e) {
            abort(404);
        }

    }

    public function proses($id)
    {
        try {
            $idPasien = base64_decode($id);
            $rekam = Rekam::with('pasien')->where('pasien_id', $idPasien)->get();
            if($rekam->count() > 0){
                $dataPasien = $rekam->first();
                $cekOngoing = $rekam->where('status', '1');

                // if ($cekOngoing->count() > 0) {
                //     $dataPasien =  $cekOngoing->first();
                // }

                // if ($cekOngoing->count() == 0) {
                //     $rekam->first()->pushStatus("1");
                // }

                return view('dokter.detailpemeriksaan', array(
                    'title' => "Dashboard Administrator | MyKlinik v.1.0",
                    'firstMenu' => 'pemeriksaan',
                    'secondMenu' => 'pemeriksaan',
                    'dataPasien' => $dataPasien
                ));
            }
            return redirect(route('dokter.pemeriksaan'))->with(['delete' => "Belum ada Pasien hari ini!"]);
        } catch (Exception $e) {
            abort(404);
        }
    }

    public function selesai_periksa(PeriksaRequest $request)
    {
        $request->validated();
        DB::beginTransaction();
        try {
            $this->pendaftaranService->save_pemeriksaan($request);
            DB::commit();
            return redirect(route('dokter.pemeriksaan'))->with(['success' => "Data berhasil disimpan!"]);
        } catch (Exception $e) {
            DB::rollback();
            return redirect(route('dokter.pemeriksaan'))->withErrors(['error' => $e->getMessage()]);
        }
    }
}

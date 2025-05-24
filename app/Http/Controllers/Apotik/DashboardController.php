<?php

namespace App\Http\Controllers\Apotik;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Obat;
use App\Models\Resep;
use App\Models\Rekam;
use App\Models\Golongan_obat;
use App\Models\Kategori_obat;
use App\Models\Pasien;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    protected $users;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->users = Auth::user();
            return $next($request);
        });
    }

    public function index()
    {
        return view('apotik.dashboard', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'dashboard',
            'secondMenu' => 'dashboard',
        ));
    }

    public function obat()
    {
        $rekam = \DB::table('obats as ob')
        ->join('kategori_obats as kat', 'kat.id', '=', 'ob.kategoriobat_id')
        ->join('golongan_obats as gol', 'gol.id', '=', 'ob.golonganobat_id')
        ->select('ob.*', 'kat.name as kategori', 'gol.name as golongan')
        ->get();
        $dataPasien= $rekam;
        return view('apotik.obat', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'pemeriksaan',
            'secondMenu' => 'pemeriksaan',
            'dataRekam' => $dataPasien,
        ));
    }

    public function obatproses()
    {
        $golongan =Golongan_obat::orderBy('name','asc')->get();
        $kategori =Kategori_obat::orderBy('name','asc')->get();
        return view('apotik.obatproses', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'dashboard',
            'secondMenu' => 'dashboard',
            'dataGolongan' => $golongan,
            'dataKategori' => $kategori,
        ));
    }

    public function obatprosessave(Request $request)
    {
        $pasien = new Obat();
        $pasien->code = $request->code;
        $pasien->name = $request->name;
        $pasien->kategoriobat_id = base64_decode($request->kategoriobat_id);
        $pasien->golonganobat_id = base64_decode($request->golonganobat_id);
        $pasien->price = $request->price;
        $pasien->stock = $request->stock;
        $pasien->kekuatan = $request->kekuatan;
        $pasien->save();

        $rekam = \DB::table('obats as ob')
        ->join('kategori_obats as kat', 'kat.id', '=', 'ob.kategoriobat_id')
        ->join('golongan_obats as gol', 'gol.id', '=', 'ob.golonganobat_id')
        ->select('ob.*', 'kat.name as kategori', 'gol.name as golongan')
        ->get();
        $dataPasien= $rekam;
        return view('apotik.obat', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'pemeriksaan',
            'secondMenu' => 'pemeriksaan',
            'dataRekam' => $dataPasien,
        ));
    }

    public function resep()
    {
        $rekam = Rekam::with('pasien', 'antrian')->today()->get()->sortBy('antrian');
        $this->totalSelesai =  $rekam->where('status','2')->count();
        // $dataPasien= $rekam->whereIn('status',['0','1']);
        $dataPasien= $rekam;
        return view('apotik.resep', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'pemeriksaan',
            'secondMenu' => 'pemeriksaan',
            'dataRekam' => $dataPasien,
            'totalSelesai' => $this->totalSelesai
        ));
    }

    public function resepinput($id)
    {
        $idPasien = base64_decode($id);
        $obat =Obat::orderBy('name','asc')->get();
        $rekam = \DB::table('reseps as rs')
        ->join('obats as ob', 'ob.id', '=', 'rs.obat_id')
        ->where('rs.rekam_id', '=', $idPasien)
        ->select('rs.*', 'ob.name as obat')
        ->get();
        $dataPasien= $rekam;
        return view('apotik.resepinput', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'dashboard',
            'secondMenu' => 'dashboard',
            'dataRekam' => $dataPasien,
            'dataObat' => $obat,
            'idRekam' => $id,
        ));
    }

    public function resepinputsave(Request $request)
    {
        $pasien = new Resep();
        $pasien->rekam_id = base64_decode($request->rekam_id);
        $pasien->obat_id = base64_decode($request->obat_id);
        $pasien->jenisracikan = $request->jenisracikan;
        $pasien->rke = $request->rke;
        $pasien->dosis = $request->dosis;
        $pasien->jumlahracikan = $request->jumlahracikan;
        $pasien->qtyobat = $request->qtyobat;
        $pasien->aturanpakai = $request->aturanpakai;
        $pasien->save();

        $obat =Obat::orderBy('name','asc')->get();

        $rekam = \DB::table('reseps as rs')
        ->join('obats as ob', 'ob.id', '=', 'rs.obat_id')
        ->where('rs.rekam_id', '=', base64_decode($request->rekam_id))
        ->select('rs.*', 'ob.name as obat')
        ->get();
        $dataPasien= $rekam;
        return view('apotik.resepinput', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'pemeriksaan',
            'secondMenu' => 'pemeriksaan',
            'dataRekam' => $dataPasien,

            'dataObat' => $obat,
            'idRekam' => $request->rekam_id,
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
}

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

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\{DashboardController as AdminDashboard,
    KategoriController as AdminKategori,
    GolonganController as AdminGolongan,
    ObatController as AdminObat,
    PoliklinikController as AdminPoli,
    KaryawanController as AdminKaryawan,
    DokterController as AdminDokter};
use App\Http\Controllers\Pendaftaran\{DashboardController as FrontDashboard,
    PendaftaranController as FrontDaftar};
use App\Http\Controllers\Dokter\{DashboardController as DokterDashboard,
    DataRekamController as DokterRekam};
use App\Http\Controllers\Apotik\{DashboardController as ApotikDashboard};
use App\Http\Controllers\Perawat\{DashboardController as PerawatDashboard, DataRekamController as PerawatRekam};


Route::redirect('/', '/login');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::group(['middleware' => ['web', 'auth', 'roles']], function () {
    Route::group(['roles' => 'admin'], function () {
        Route::get('/staff/dashboard', [AdminDashboard::class, 'index'])->name('adm.dashboard');

        Route::get('/staff/kategori', [AdminKategori::class, 'index'])->name('adm.kategori');
        Route::post('/staff/kategori', [AdminKategori::class, 'store'])->name('adm.kategori.save');
        Route::patch('/staff/kategori', [AdminKategori::class, 'update'])->name('adm.kategori.update');
        Route::delete('/staff/kategori', [AdminKategori::class, 'destroy'])->name('adm.kategori.delete');

        Route::get('/staff/golongan', [AdminGolongan::class, 'index'])->name('adm.golongan');
        Route::post('/staff/golongan', [AdminGolongan::class, 'store'])->name('adm.golongan.save');
        Route::patch('/staff/golongan', [AdminGolongan::class, 'update'])->name('adm.golongan.update');
        Route::delete('/staff/golongan', [AdminGolongan::class, 'destroy'])->name('adm.golongan.delete');

        Route::get('/staff/obat', [AdminObat::class, 'index'])->name('adm.obat');
        Route::post('/staff/obat', [AdminObat::class, 'store'])->name('adm.obat.save');
        Route::patch('/staff/obat', [AdminObat::class, 'update'])->name('adm.obat.update');
        Route::delete('/staff/obat', [AdminObat::class, 'destroy'])->name('adm.obat.delete');
        Route::get('/staff/{id}/obat', [AdminObat::class, 'edit'])->name('adm.obat.edit');
        Route::get('/staff/obat/add', [AdminObat::class, 'create'])->name('adm.obat.add');

        Route::get('/staff/poliklinik', [AdminPoli::class, 'index'])->name('adm.poli');
        Route::post('/staff/poliklinik', [AdminPoli::class, 'store'])->name('adm.poli.save');
        Route::patch('/staff/poliklinik', [AdminPoli::class, 'update'])->name('adm.poli.update');
        Route::delete('/staff/poliklinik', [AdminPoli::class, 'destroy'])->name('adm.poli.delete');

        Route::get('/staff/karyawan', [AdminKaryawan::class, 'index'])->name('adm.karyawan');
        Route::get('/staff/karyawan/add', [AdminKaryawan::class, 'create'])->name('adm.karyawan.add');
        Route::get('/staff/{id}/karyawan', [AdminKaryawan::class, 'edit'])->name('adm.karyawan.edit');
        Route::post('/staff/karyawan', [AdminKaryawan::class, 'store'])->name('adm.karyawan.save');
        Route::patch('/staff/karyawan', [AdminKaryawan::class, 'update'])->name('adm.karyawan.update');
        Route::delete('/staff/karyawan', [AdminKaryawan::class, 'destroy'])->name('adm.karyawan.delete');

        Route::get('/staff/dokter', [AdminDokter::class, 'index'])->name('adm.dokter');
        Route::post('/staff/dokter', [AdminDokter::class, 'store'])->name('adm.dokter.save');
        Route::patch('/staff/dokter', [AdminDokter::class, 'update'])->name('adm.dokter.update');
        Route::delete('/staff/dokter', [AdminDokter::class, 'destroy'])->name('adm.dokter.delete');
        Route::get('/staff/{id}/dokter', [AdminDokter::class, 'edit'])->name('adm.dokter.edit');
        Route::get('/staff/dokter/add', [AdminDokter::class, 'create'])->name('adm.dokter.add');


    });

    Route::group(['roles' => 'pendaftaran'], function () {
        Route::get('/front/dashboard', [FrontDashboard::class, 'index'])->name('front.dashboard');
        Route::get('/front/pendaftaran', [FrontDaftar::class, 'index'])->name('front.pendaftaran');
        Route::post('/front/pendaftaran', [FrontDaftar::class, 'store'])->name('front.pendaftaran.save');


        Route::get('/front/ajax/get_data_pasien', [FrontDaftar::class, 'getDataPasien'])->name('front.ajax.getdatapasien');
        Route::get('/front/ajax/get_code', [FrontDaftar::class, 'generateCode'])->name('front.ajax.getCode');
    });

    Route::group(['roles' => 'dokter'], function () {
        Route::get('/dokter/dashboard', [DokterDashboard::class, 'index'])->name('dokter.dashboard');
        Route::get('/dokter/pemeriksaan', [DokterRekam::class, 'index'])->name('dokter.pemeriksaan');
        Route::get('/dokter/pemeriksaan/proses/{id}', [DokterRekam::class, 'proses'])->name('dokter.pemeriksaan.proses');
        Route::post('/dokter/pemeriksaan/proses', [DokterRekam::class, 'selesai_periksa'])->name('dokter.pemeriksaan.selesai');
        Route::get('/dokter/pemeriksaan/pasien/{id}', [DokterRekam::class, 'detail_pasien'])->name('dokter.detailpasien');
    });

    Route::group(['roles' => 'perawat'], function () {
        Route::get('/perawat/dashboard', [PerawatDashboard::class, 'index'])->name('perawat.dashboard');
        Route::get('/perawat/pemeriksaan', [PerawatRekam::class, 'index'])->name('perawat.pemeriksaan');
        Route::get('/perawat/pemeriksaan/proses/{id}', [PerawatRekam::class, 'proses'])->name('perawat.pemeriksaan.proses');
        Route::post('/perawat/pemeriksaan/proses', [PerawatRekam::class, 'selesai_periksa'])->name('perawat.pemeriksaan.selesai');
        Route::get('/perawat/pemeriksaan/pasien/{id}', [DokterRekam::class, 'detail_pasien'])->name('perawat.detailpasien');
    });

    Route::group(['roles' => 'apotik'], function () {
        Route::get('/apoteker/dashboard', [ApotikDashboard::class, 'index'])->name('apoteker.dashboard');
        Route::get('/apoteker/obat', [ApotikDashboard::class, 'obat'])->name('apoteker.obat');
        Route::get('/apoteker/obat/proses', [ApotikDashboard::class, 'obatproses'])->name('apoteker.obat.proses');
        Route::post('/apoteker/obat/proses', [ApotikDashboard::class, 'obatprosessave'])->name('apoteker.obat.obatprosessave');
        Route::get('/apoteker/resep', [ApotikDashboard::class, 'resep'])->name('apoteker.resep');
        Route::get('/apoteker/resep/input/{id}', [ApotikDashboard::class, 'resepinput'])->name('apoteker.resep.input');
        Route::post('/apoteker/resep/input', [ApotikDashboard::class, 'resepinputsave'])->name('apoteker.resep.save');
        Route::get('/apoteker/pemeriksaan/pasien/{id}', [ApotikDashboard::class, 'detail_pasien'])->name('apoteker.detailpasien');

    });
});

require __DIR__.'/auth.php';

<x-admint.admin-template :title="$title" :first-menu="$firstMenu" :second-menu="$secondMenu">
    @push('customCss')
        <!--datatable css-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
        <!--picker-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <style>
            .select option {
                color: whitesmoke !important;
                background: #3b439d !important;
            }
        </style>
    @endpush
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <x-admint.error-message-component/>
            </div>
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between bg-transparent">
                        <h4 class="mb-sm-0">Detail Pasien</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="{{route('dokter.dashboard')}}">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="{{route('dokter.pemeriksaan')}}">Pemeriksaan Pasien</a></li>
                                <li class="breadcrumb-item active">{{$dataPasien->kode_pasien}}</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>

            <div class="profile-foreground position-relative mx-n4 mt-n4">
                <div class="profile-wid-bg bg-transparent border-top">
                    <!-- <img src="assets/images/profile-bg.jpg" alt="" class="profile-wid-img" /> -->
                </div>
            </div>
            <div class="pt-4 mb-4 mb-lg-3 pb-lg-4 profile-wrapper">
                <div class="row g-4">
                    <div class="col-auto">
                        <div class="avatar-lg">
                            <img src="{{asset('template/velzon/assets/images/users/user-dummy-img.jpg')}}" alt="user-img" class="img-thumbnail rounded-circle" />
                        </div>
                    </div>
                    <!--end col-->
                    <div class="col">
                        <div class="p-2">
                            <h3 class="mb-1">{{ucfirst($dataPasien->nama_lengkap ?? "-")}}</h3>
                            <p class="text-muted">Pasien</p>
                            <div class="hstack text-muted gap-1">
                                <div class="me-2"><i class="ri-map-pin-user-line me-1 fs-16 align-bottom text-body"></i>{{ucfirst($dataPasien->tempat_lahir ?? "-")}}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end row-->
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <div class="d-flex profile-wrapper">
                            <!-- Nav tabs -->
                            <ul class="nav nav-pills animation-nav profile-nav gap-2 gap-lg-3 flex-grow-1" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link fs-14 active" data-bs-toggle="tab" href="#overview-tab" role="tab">
                                        <i class="ri-airplay-fill d-inline-block d-md-none"></i> <span class="d-none d-md-inline-block">Rekam Medis</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fs-14" data-bs-toggle="tab" href="#activities" role="tab">
                                        <i class="ri-list-unordered d-inline-block d-md-none"></i> <span class="d-none d-md-inline-block">Resep</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- Tab panes -->
                        <div class="tab-content pt-4 text-muted">
                            <div class="tab-pane active" id="overview-tab" role="tabpanel">
                                <div class="row">
                                    <div class="col-xxl-4">

                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title mb-3">Identitas Pasien</h5>
                                                <div class="table-responsive">
                                                    <table class="table table-borderless mb-0">
                                                        <tbody>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Nama Lengkap:</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->nama_lengkap ?? "-")}}</td>
                                                        </tr>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Telepon :</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->phone ?? "-")}}</td>
                                                        </tr>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Jenis Kelamin :</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->sex ?? "-")}}</td>
                                                        </tr>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Golongan :</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->gol_darah ?? "-")}}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Tempat, Tanggal Lahir :</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->tempat_lahir ?? "-")}}, {{ucfirst($dataPasien->tanggal_lahir ?? "-")}}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th class="ps-0" scope="row">Alamat :</th>
                                                            <td class="text-muted">{{ucfirst($dataPasien->alamat ?? "-")}}
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div><!-- end card body -->
                                        </div><!-- end card -->
                                    </div>
                                    <!--end col-->
                                    <div class="col-xxl-8">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title mb-3">Rekam Medis</h5>
                                                <div class="card">

                                                    <div class="card-body">
                                                        <ul class="list-group">
                                                            <li class="list-group-item">Umur : {{$dataRekam->pasien->age ?? "0"}} Tahun</li>
                                                            <li class="list-group-item">Tekanan Darah : {{$dataRekam->tekanan_darah ?? "0"}}mm/g
                                                            </li>
                                                            <li class="list-group-item">Rate : {{$dataRekam->rate ?? "0"}} </li>
                                                            <li class="list-group-item">Suhu : {{$dataRekam->suhu_badan ?? "0"}} Celcius</li>
                                                            <li class="list-group-item">Tinggi Badan : {{$dataRekam->tinggi_badan ?? "0"}} cm</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card ">

                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <h5 class="float-start">Detail Keluhan:</h5>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <p class="mt-3">{{$dataRekam->keluhan_utama ?? "-"}}</p>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <h5 class="float-start">Diagnosa:</h5>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <p class="mt-3">{{$dataRekam->diagnosis ?? "-"}}</p>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <h5 class="float-start">Deskripsi Tindakan:</h5>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <p class="mt-3">{{$dataRekam->deskripsi_tindakan ?? "-"}}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end card-body-->
                                        </div><!-- end card -->
                                    </div>
                                    <!--end col-->
                                </div>
                                <!--end row-->
                            </div>
                            <div class="tab-pane fade" id="activities" role="tabpanel">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title mb-3">Daftar Obat Diresepkan</h5>
                                        <div class="card-body">
                                            <div class="table-responsive table-card mb-4 mt-5">
                                                <table class="table align-middle table-nowrap mb-0" id="ticketTable">
                                                    <thead>
                                                    <tr>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">Rke</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">JENIS RACIKAN</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">NAMA OBAT</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">DOSIS</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">JUMLAH RACIKAN</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">QTY OBAT</th>
                                                        <th class="sort text-center" data-sort="nama_pasien" style="width: 10%">ATURAN PAKAI</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="list form-check-all" id="ticket-list-data">
                                                    @foreach($dataResep as $row)
                                                    <tr>
                                                            <td class="text-start">{{$row->rke ?? ""}}</td>
                                                            <td class="text-center">{{$row->jenisracikan ?? ""}}</td>
                                                            <td class="text-center">{{$row->obat ?? ""}}</td>
                                                            <td class="text-center">{{$row->dosis ?? ""}}</td>
                                                            <td class="text-center">{{$row->jumlahracikan ?? ""}}</td>
                                                            <td class="text-center">{{$row->qtyobat ?? ""}}</td>
                                                            <td class="text-center">{{$row->aturanpakai ?? ""}}</td>
                                                    </tr>
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end card-body-->
                                </div>
                                <!--end card-->
                            </div>
                            <!--end tab-pane-->
                        </div>
                        <!--end tab-content-->
                    </div>
                </div>
                <!--end col-->
            </div>



        </div>
        <!-- container-fluid -->
    </div>
    @push('customJs')
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!--datatable js-->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
        <!--picker-->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>

        </script>

    @endpush
</x-admint.admin-template>

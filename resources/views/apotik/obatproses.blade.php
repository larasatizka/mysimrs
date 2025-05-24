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
                        <h4 class="mb-sm-0">Tambah Obat</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="{{route('front.dashboard')}}">Dashboard</a></li>
                                <li class="breadcrumb-item active">Tambah Obat</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->
            <form action="{{route('apoteker.obat.obatprosessave')}}" method="post">
                @csrf
                <div class="row">
                    <div class="col-lg-12">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <label for="namaLengkap" class="form-label">KODE OBAT <span
                                                class="text-danger">*</span></label>
                                        <input type="text" name="code"
                                               class="form-control @if($errors->has('code')) is-invalid @endif"
                                               placeholder="KODE OBAT" id="namaLengkap"
                                               value="{{old('code',$dataPasien->code ??"")}}">
                                    </div>
                                    <div class="col-lg-4">
                                        <label for="namaLengkap" class="form-label">NAMA OBAT <span
                                                class="text-danger">*</span></label>
                                        <input type="text" name="name"
                                               class="form-control @if($errors->has('name')) is-invalid @endif"
                                               placeholder="NAMA OBAT" id="namaLengkap"
                                               value="{{old('name',$dataPasien->name ??"")}}">
                                    </div>
                                    <div class="col-lg-4">
                                        <label for="namaLengkap" class="form-label">KEKUATAN <span
                                                class="text-danger">*</span></label>
                                        <input type="text" name="kekuatan"
                                               class="form-control @if($errors->has('kekuatan')) is-invalid @endif"
                                               placeholder="KEKUATAN" id="namaLengkap"
                                               value="{{old('kekuatan',$dataPasien->kekuatan ??"")}}">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-12">
                                        <label for="kategoriobat_id" class="form-label">KATEGORI OBAT</label>
                                        <select name="kategoriobat_id" id="kategoriobat_id" class="form-control select @if($errors->has('kategoriobat_id')) is-invalid @endif">
                                            @foreach($dataKategori as $kat)
                                                <option value="{{base64_encode($kat->id ?? "")}}" @if(base64_encode($kat->id) == old('kategoriobat_id') ) selected @endif>{{$kat->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-lg-12">
                                        <label for="golonganobat_id" class="form-label">GOLONGAN OBAT</label>
                                        <select name="golonganobat_id" id="golonganobat_id" class="form-control select @if($errors->has('golonganobat_id')) is-invalid @endif">
                                            @foreach($dataGolongan as $kat)
                                                <option value="{{base64_encode($kat->id ?? "")}}" @if(base64_encode($kat->id) == old('golonganobat_id') ) selected @endif>{{$kat->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label for="price" class="form-label">HARGA OBAT <span
                                                class="text-danger">*</span></label>
                                        <input type="number" name="price"
                                               class="form-control @if($errors->has('price')) is-invalid @endif"
                                               placeholder="HARGA OBAT" id="price"
                                               value="{{old('price',$dataPasien->price ??"")}}">
                                    </div>
                                    <div class="col-lg-6">
                                        <label for="stock" class="form-label">STOK OBAT <span
                                                class="text-danger">*</span></label>
                                        <input type="number" name="stock"
                                               class="form-control @if($errors->has('stock')) is-invalid @endif"
                                               placeholder="STOK OBAT" id="stock"
                                               value="{{old('stock',$dataPasien->stock ??"")}}">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-lg-10"></div>
                                    <div class="col-lg-2">
                                        <button class="btn btn-sm btn-success" type="submit">SIMPAN</button>
                                        <a href="{{route('apoteker.obat.proses')}}">
                                            <button class="btn btn-sm btn-danger" type="button">RESET</button>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </form>
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
            const modalPasien = document.getElementById('modalPasien');
            const kodePasien = document.getElementById('kodePasien');
            const namaPasien = document.getElementById('namaLengkap');
            const tempatLahir = document.getElementById('tempat_lahir');
            const tanggalLahir = document.getElementById('tanggal_lahir');
            const sex = document.getElementById('sex');
            const agama = document.getElementById('agama');
            const pendidikan = document.getElementById('pendidikan');
            const golonganDarah = document.getElementById('golongan_darah');
            const phone = document.getElementById('phone');
            const pekerjaan = document.getElementById('pekerjaan');
            const alamat = document.getElementById('alamat');
            const tekananDarah = document.getElementById('tekanan_darah');
            const rate = document.getElementById('rate');
            const suhuBadan = document.getElementById('suhu_badan');
            const beratBadan = document.getElementById('berat_badan');
            const tinggiBadan = document.getElementById('tinggi_badan');
            const keluhanUtama = document.getElementById('keluhan_utama');
            const dokterId = document.getElementById('dokter_id');

            function generateNewCode() {
                let urlGenerateCode = '{{route('front.ajax.getCode')}}';
                if (kodePasien.classList.contains("is-invalid")) {
                    kodePasien.classList.remove("is-invalid");
                }
                removeClassArray([kodePasien, namaPasien, tempatLahir,tanggalLahir,tekananDarah,rate,suhuBadan,beratBadan,tinggiBadan,keluhanUtama,dokterId]);
                $.ajax({
                    url: urlGenerateCode,
                    type: 'GET',
                    dataType: 'json',
                    success: function (response) {
                        kodePasien.value = response;
                        clearInput();
                    },
                    error: function (request, error) {
                        console.log(error);
                    }
                });
            }

            function removeClassWithEvent(Object, event) {
                for (let i = 0; i < Object.length; i++) {
                    Object[i].addEventListener(event, function () {
                        removeClass(Object[i]);
                    });
                }
            }

            function removeClassArray(Object) {
                for (let i = 0; i < Object.length; i++) {
                    removeClass(Object[i]);
                }
            }

            function removeClass(Object) {
                if (Object.classList.contains("is-invalid")) {
                    Object.classList.remove("is-invalid");
                }
            }

            function clearInput() {
                namaPasien.value = "";
                tempatLahir.value = "";
                tanggalLahir.value = "";
                sex.value = "L";
                agama.value = "ISLAM";
                pendidikan.value = "SD";
                golonganDarah.value = "A";
                phone.value = "";
                pekerjaan.value = "";
                alamat.value = "";
            }

            setTimeout(function () {
                    $('.alert').fadeOut('slow');
                }, 2000
            );

            $(document).on("click", ".open-selected", function (e) {
                e.preventDefault();
                let fid = $(this).data('id');
                window.location.href = "{{ route('front.pendaftaran')."?pasien="}}" + fid;
            })

            $('.modal').on('hidden.bs.modal', function (e) {
                e.preventDefault();
                let errorInput = $('.errorInput');
                let errorLabel = $('.errorLabel');
                errorInput.removeClass('is-invalid');
                errorLabel.removeClass('text-danger');
            });

            $(document).ready(function () {

                removeClassWithEvent([namaPasien, tempatLahir,tekananDarah,rate,suhuBadan,beratBadan,tinggiBadan,keluhanUtama], 'keypress');
                removeClassWithEvent([tanggalLahir,dokterId], 'change');

                flatpickr(tanggalLahir, {
                    altInput: false,
                    altFormat: "F j, Y",
                    dateFormat: "Y-m-d",
                });

                let base_url = "{{route('front.ajax.getdatapasien')}}";
                let buttonNew = document.getElementById('newPasien');
                buttonNew.addEventListener("click", generateNewCode);

                $('#tablePasien').DataTable({
                    responsive: true,
                    processing: true,
                    serverSide: true,
                    ajax: {
                        type: 'GET',
                        url: base_url,
                        async: true,
                        dataType: 'json',
                    },
                    columns: [
                        {
                            data: 'index',
                            class: 'text-center',
                            defaultContent: '',
                            orderable: false,
                            searchable: false,
                            width: '5%',
                            render: function (data, type, row, meta) {
                                return meta.row + meta.settings._iDisplayStart + 1;
                            }
                        },
                        {data: 'kode_pasien', class: 'text-left', width: '10%'},
                        {data: 'nama_lengkap', class: 'text-left'},
                        {data: 'alamat', class: 'text-left'},
                        {data: 'phone', class: 'text-center', width: '5%'},
                        {data: 'action', class: 'text-center', width: '10%', orderable: false},
                    ],
                    "bDestroy": true
                });
            });
        </script>

    @endpush
</x-admint.admin-template>

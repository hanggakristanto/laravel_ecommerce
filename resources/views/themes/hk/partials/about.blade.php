@include('themes.hk.partials.header')
@include('themes.hk.partials.sidebar')

        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12">
                    @include('themes.hk.partials.h_mobile')
                </div>                
            </div>
            <!-- popular -->
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="row">
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img src="{{ asset('themes/hk/assets/images/logo.svg') }}" class="img-fluid" alt="" /></div>
                                        <div class="tab-pane" id="product_2"><img src="assets/images/ecommerce/2.png" class="img-fluid" alt=""/></div>
                                        <div class="tab-pane" id="product_3"><img src="assets/images/ecommerce/0.png" class="img-fluid" alt=""/></div>
                                        <div class="tab-pane" id="product_4"><img src="assets/images/ecommerce/0.png" class="img-fluid" alt=""/></div>
                                    </div>
                                    <!-- <ul class="preview thumbnail nav nav-tabs">
                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#product_1"><img src="assets/images/ecommerce/1.png" alt=""/></a></li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_2"><img src="assets/images/ecommerce/2.png" alt=""/></a></li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_3"><img src="assets/images/ecommerce/3.png" alt=""/></a></li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_4"><img src="assets/images/ecommerce/4.png" alt=""/></a></li>                                    
                                    </ul>                 -->
                                </div>
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <div class="product details">
                                        <h3 class="product-title mb-0">Moeslimah.com</h3>
                                        <hr>
                                        <p class="product-description">
                                            Merupakan website yang di rancang oleh Mahasantri Darul Quran STMIK Antar Bangsa. Yang bertujuan mengabungkan 3 platfom (Belanja, Donasi dan Jasa Desain) menjadi 1 website,
                                            sehingga memudahkan penguna/masyarakat dalam bertransaksi setiap hari. Fitur unggulan dari website Moeslimah.com yaitu telah terhubung dengan 20 Bank, 
                                            sehingga penguna lebih mudah dalam bertransaksi dimanapun dan kapanpun tanpa harus konfirmasi pembayaran karena, sudah Otomatis oleh sistem yang mengaturnya.
                                        </p>
                                        <p class="vote"><strong>50%</strong> Keuntungan akan di donasikan.</p>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>

@include('themes.hk.partials.footer')
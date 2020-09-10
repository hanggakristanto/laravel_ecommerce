@include('themes.hk.partials.header')
@include('themes.hk.partials.sidebar')

<div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12">
                    @include('themes.hk.partials.h_mobile')
                    @include('themes.hk.partials.slider')
                    
                </div>                
            </div>
            <div class="row clearfix">
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget facebook-widget">
                        <div class="icon"><a href="{{ url('donasi') }}"><i class="zmdi ti-money"></i></a></div>
                        <div class="content">
                            <div class="text"><a href="{{ url('donasi') }}">Donasi</a></div>
                           <!--  <div class="number">123</div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget instagram-widget">
                        <div class="icon"><a href="{{ url('products') }}"><i class="zmdi ti-briefcase"></i></a></div>
                        <div class="content">
                            <div class="text"><a href="{{ url('products') }}">Produk</a></div>
                            <!-- <div class="number">Hijab</div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget linkedin-widget">
                        <div class="icon"><a href="{{ url('desain') }}"><i class="zmdi ti-palette"></i></a></div>
                        <div class="content">
                        <div class="text"><a href="{{ url('desain') }}">Desain</a></div>
                            <!-- <div class="number">Veshion</div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget twitter-widget">
                        <div class="icon"><a href="{{ url('products?category=kecantikan') }}"><i class="zmdi ti-shine"></i></a></div>
                        <div class="content">
                            <div class="text"><a href="{{ url('products?category=kesehatan') }}">Kecantikan</a></div>
                            <!-- <div class="number">Kecantikan</div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget google-widget">
                        <div class="icon"><a href="{{ url('products?category=kesehatan') }}"><i class="zmdi ti-support"></i></a></div>
                        <div class="content">
                            <div class="text"><a href="{{ url('products?category=kesehatan') }}">Kesehatan</a></div>
                            <!-- <div class="number">Kesehatan</div> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-4">
                    <div class="card info-box-2 hover-zoom-effect social-widget instagram-widget">
                        <div class="icon"><a href="{{ url('products') }}"><i class="zmdi ti-layout-grid2"></i></a></div>
                        <div class="content">
                            <div class="text"><a href="{{ url('products') }}">Lainnya</a></div>
                        </div>
                    </div>
                </div>
            </div> 
            
    @include('themes.hk.partials.popular_products')
    @include('themes.hk.products.daftar_products')
    @include('themes.hk.products.desain')
        
    <div class="alert alert-warning footer mt-3 mb-0">
            Copy Right By : <b>MahaSantri</b>
        </div>
@include('themes.hk.partials.footer')
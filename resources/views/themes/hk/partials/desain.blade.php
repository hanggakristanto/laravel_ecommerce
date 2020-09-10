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
                                        <div class="tab-pane active" id="product_1"><img src="{{ asset('themes/hk/assets/images/maintanance.svg') }}" class="img-fluid" alt="" /></div>
                                        <div class="tab-pane" id="product_2"><img src="assets/images/ecommerce/2.png" class="img-fluid" alt=""/></div>
                                        <div class="tab-pane" id="product_3"><img src="assets/images/ecommerce/0.png" class="img-fluid" alt=""/></div>
                                        <div class="tab-pane" id="product_4"><img src="assets/images/ecommerce/0.png" class="img-fluid" alt=""/></div>
                                    </div>
                                </div>
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <div class="product details">
                                        <h3 class="product-title mb-0">Jasa Desain Undangan</h3>
                                        <h5 class="price mt-0">Harga: <span class="col-amber">Rp.50.000</span></h5>
                                        <div class="rating">
                                            <div class="stars">
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star-outline"></span>
                                            </div>
                                            <!-- <span class="m-l-10">41 reviews</span> -->
                                        </div>
                                        <hr>
                                        <p class="product-description">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        <p class="vote"><strong>50%</strong> Keuntungan akan di donasikan</p>
                                        
                                        <div class="action">
                                            <button class="btn btn-info waves-effect" type="button"><i class="zmdi zmdi-favorite"></i></button>
                                            <a href="https://api.whatsapp.com/send?phone=6289638429017&text=Assalamualaikum,%20saya%20ingin%20memesan%20desain." class="btn btn-primary waves-effect" type="button">Pesan Desain?</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="row">
                                <div class="col-xl-3 col-lg-4 col-md-12">
                                    <div class="preview preview-pic tab-content">
                                        <div class="tab-pane active" id="product_1"><img src="{{ asset('themes/hk/assets/images/1.jpg') }}" class="img-fluid" alt="" /></div>
                                    </div>            
                                </div>
                                <div class="col-xl-9 col-lg-8 col-md-12">
                                    <div class="product details">
                                        <h3 class="product-title mb-0">Jasa Desain Barang</h3>
                                        <h5 class="price mt-0">Harga: <span class="col-amber">Rp.50.000 - Rp.200.000</span></h5>
                                        <div class="rating">
                                            <div class="stars">
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star col-amber"></span>
                                                <span class="zmdi zmdi-star-outline"></span>
                                            </div>
                                            <!-- <span class="m-l-10">41 reviews</span> -->
                                        </div>
                                        <hr>
                                        <p class="product-description">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        <p class="vote"><strong>50%</strong> Keuntungan akan di donasikan</p>
                                        
                                        <div class="action">
                                            <button class="btn btn-info waves-effect" type="button"><i class="zmdi zmdi-favorite"></i></button>
                                            <a href="https://api.whatsapp.com/send?phone=6289638429017&text=Assalamualaikum,%20saya%20ingin%20memesan%20desain." class="btn btn-primary waves-effect" type="button">Pesan Desain?</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>


@include('themes.hk.partials.footer')
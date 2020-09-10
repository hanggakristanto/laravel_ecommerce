@include('themes.hk.partials.header')
@include('themes.hk.partials.sidebar')

<div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-12 col-lg-12">
                @include('themes.hk.partials.h_mobile')
            </div>                
        </div>
        
    @if ($products)
        <div class="card">
            <div class="body">
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="alert bg-custom lihsem">
                            <b>Daftar Produk</b>
                            <b class="float-right pr-1"> {{ count($products) }}</span> Produk dari <span>{{ $products->total() }}</b>
                        </div>
                    </div>
                    @forelse ($products as $product)
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-6">
                        <div class="card">
                            <div class="body product_item">
                                <!-- <span class="label new">New!</span> -->
                                
                                <a href="{{ url('product/'. $product->slug) }}">
                                    @if ($product->productImages->first())
                                        <img src="{{ asset('storage/'.$product->productImages->first()->medium) }}" alt="{{ $product->name }}" class="img-fluid cp_img">
                                    @else
                                        <img src="{{ asset('themes/ezone/assets/img/product/fashion-colorful/1.jpg') }}" alt="{{ $product->name }}">
                                    @endif
                                </a>
                                <div class="product_details">
                                    <a href="{{ url('product/'. $product->slug) }}"><b>{{ $product->name }}</b></a>
                                    <ul class="product_price list-unstyled">
                                        <li class="old_price">Rp. {{ number_format($product->priceLabel()) }}</li>
                                        <!-- <li class="new_price">$13.00</li> -->
                                    </ul>                                
                                </div>
                                <div class="action tengah">
                                <a href="" title="Favorit"  product-slug="{{ $product->slug }}" class="btn btn-info waves-effect add-to-fav"><i class="zmdi zmdi-favorite-outline"></i></a>
                                    <a href="{{ url('product/'. $product->slug) }}" product-id="{{ $product->id }}" product-type="{{ $product->type }}" product-slug="{{ $product->slug }}" class="btn btn-primary waves-effect"><b>BELI</b></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @empty
                    <div class="col-md-12 col-lg-12">
                        <div class="alert alert-danger footer">
                            <b>Barang Tidak Ada!</b>
                        </div>
                    </div>
                    @endforelse              
        
                </div>
            <div class="align-center">
            {{ $products->links() }}
            </div>
        </div>
    @endif

        
@include('themes.hk.partials.footer')
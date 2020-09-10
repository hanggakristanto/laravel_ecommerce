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
                                     @php
                                     $i = 1
                                     @endphp
                                     @forelse ($product->productImages as $image)
                                     <div class="tab-pane {{ ($i == 1) ? 'active show' : '' }}" id="pro-details{{ $i }}" role="tabpanel">
                                        @if ($image->large && $image->extra_large)
                                                <a href="{{ asset('storage/'.$image->extra_large) }}">
                                                    <img src="{{ asset('storage/'.$image->large) }}" alt="{{ $product->name }}">
                                                </a>
                                            @else
                                                <a href="{{ asset('themes/ezone/assets/img/product-details/bl1.jpg') }}">
                                                    <img src="{{ asset('themes/ezone/assets/img/product-details/l1.jpg') }}" alt="{{ $product->name }}">
                                                </a>
                                            @endif
                                    </div>
                                     @php
                                     $i++
                                     @endphp
                                     @empty
                                     No image found!
                                     @endforelse
                                 </div>
                                 <ul class="preview thumbnail nav nav-tabs">
                                    	@php
                                       $i = 1
                                       @endphp
                                       @forelse ($product->productImages as $image)
                                    <li class="nav-item">
                                       <a class="{{ ($i == 1) ? 'active' : '' }} mr-12 nav-link" data-toggle="tab" href="#pro-details{{ $i }}">
                                         @if ($image->small)
                                         <img src="{{ asset('storage/'.$image->small) }}" alt="{{ $product->name }}">
                                         @else
                                         <img src="{{ asset('themes/ezone/assets/img/product-details/s1.jpg') }}" alt="{{ $product->name }}">
                                         @endif
                                     </a>
                                 </li>
                                     @php
                                     $i++
                                     @endphp
                                     @empty
                                     No image found!
                                     @endforelse                                   
                             </ul>                
                         </div>
                         <div class="col-xl-9 col-lg-8 col-md-12">
                            <div class="product details">
                                <h3 class="product-title mb-0">{{ $product->name }}</h3>
                                <h5 class="price mt-0">Harga: <span class="col-amber">Rp. {{ number_format($product->priceLabel()) }}</span></h5>
                                <div class="rating">
                                    <div class="stars">
                                        <span class="zmdi zmdi-star col-amber"></span>
                                        <span class="zmdi zmdi-star col-amber"></span>
                                        <span class="zmdi zmdi-star col-amber"></span>
                                        <span class="zmdi zmdi-star col-amber"></span>
                                        <span class="zmdi zmdi-star-outline"></span>
                                    </div>
                                </div>
                                <hr>
                                <p class="product-description">{{ $product->short_description }}</p>
                                {!! Form::open(['url' => 'carts']) !!}
                                {{ Form::hidden('product_id', $product->id) }}
                                @if ($product->type == 'configurable')
                                <p class="sizes">Ukuran :
                                    {!! Form::select('size', $sizes , null, ['class' => 'select', 'placeholder' => '- Please Select -', 'required' => true, 'class' => 'form-control']) !!}
                                </p>
                                <p class="sizes">Warna:
                                    {!! Form::select('color', $colors , null, ['class' => 'select', 'placeholder' => '- Please Select -', 'required' => true, 'class' => 'form-control']) !!}
                                </p>
                                @endif
                                <div class="">
                                        <div class="ml-0">
                                        <span class="mb-3">Jumlah yang ingin di beli :</span><br>
                                        {!! Form::number('qty', 1, ['class' => 'cart-plus-minus-box', 'placeholder' => 'qty', 'min' => 1, 'class' => 'form-control lebar']) !!}
                                    </div>
                                </div>
                                <div class="mt-2">
                                    <button class="btn btn-info waves-effect add-to-fav" title="Favorit"  product-slug="{{ $product->slug }}" ><i class="zmdi zmdi-favorite"></i></button>
                                    <button class="btn btn-primary waves-effect" type="submit"><b>BELI SEKARANG</b></button>
                                </div><br>
                                {!! Form::close() !!}
                                @if ($categories)
                                <div class="">
                                    <span class="m-l-10">Kategori :</span><br>
                                    <ul class="pagination pagination-primary">
                                        @foreach ($product->categories as $category)
                                        <li class=" active"><a class="page-link" href="{{ url('products?category='. $category->slug) }}">{{ $category->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                                @endif
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="body">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#description">Deskripsi</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="description">
                        <p>{{ $product->description }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


@include('themes.hk.partials.footer')
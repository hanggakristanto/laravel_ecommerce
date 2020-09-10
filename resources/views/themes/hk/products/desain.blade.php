<br>
 <div class=" ">
        <div class="row clearfix">
            <div class="col-md-12 col-lg-12">
                @include('themes.hk.partials.h_mobile')
            </div>                
        </div>
	<!-- product area start -->
		<div class="card">
			<div class="body">
				<div class="row clearfix js-sweetalert">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="alert bg-custom lihsem">
							<b>Desain</b> <a href="{{ url('desain') }}" class="float-right">Lihat Semua</a>
							 
						</div>
					</div>
					@foreach ($products as $product)
						@php
							$product = $product->parent ?: $product;	
						@endphp
					<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-6">
						<div class="card">
							<div class="body product_item">
								<span class="label new">Terlaris!</span>
								
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
								<div class="action">
									<bottom href="" title="Favorit" data-type="basic" product-slug="{{ $product->slug }}" class="btn btn-info waves-effect add-to-fav"><i class="zmdi zmdi-favorite-outline"></i></bottom>
									<a href="{{ url('product/'. $product->slug) }}" product-id="{{ $product->id }}" product-type="{{ $product->type }}" product-slug="{{ $product->slug }}" class="btn btn-primary waves-effect">BELI</a>
								</div>
							</div>
						</div>
					</div>
					@endforeach
				</div>
			</div>
		</div>

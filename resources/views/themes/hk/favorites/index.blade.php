@include('themes.hk.partials.header')
 @include('themes.hk.partials.sidebar')
 
 <div class="container-fluid">
 @include('themes.hk.partials.h_mobile')
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12">
		@include('admin.partials.flash')
			<div class="card">
				<div class="body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
								<th>Hapus</th>
								<th>Gambar</th>
								<th>Produk</th>
								<th>Harga</th>
								</tr>
							</thead>
							<tbody>
							@forelse ($favorites as $favorite)
								@php
									$product = $favorite->product;
									$product = isset($product->parent) ?: $product;
									$image = !empty($product->productImages->first()) ? asset('storage/'.$product->productImages->first()->small) : asset('themes/ezone/assets/img/cart/3.jpg')
								@endphp
								<tr>
								<td class="product-remove">
									{!! Form::open(['url' => 'favorites/'. $favorite->id, 'class' => 'delete', 'style' => 'display:inline-block']) !!}
									{!! Form::hidden('_method', 'DELETE') !!}
									<button type="submit" class="btn btn-danger">Hapus</button>
									{!! Form::close() !!}
								</td>
									<td class="product-thumbnail">
										<a href="{{ url('product/'. $product->slug) }}"><img src="{{ $image }}" alt="{{ $product->name }}" style="width:100px"></a>
									</td>
									<td class="product-name"><a href="{{ url('product/'. $product->slug) }}">{{ $product->name }}</a></td>
									<td class="product-price-cart"><span class="amount">{{ number_format($product->priceLabel()) }}</span></td>
								</tr>
								@empty
									<tr>
										<td colspan="4">Belum ada produk favorit</td>
									</tr>
								@endforelse
							</tbody>
						</table>
						{{ $favorites->links() }}
					</div>
				</div>
			</div>
		</div>
	

@include('themes.hk.partials.footer')
@include('themes.hk.partials.header')
 @include('themes.hk.partials.sidebar')
 @include('themes.hk.partials.h_mobile')
 <div class="container-fluid">
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="card">
				<div class="body">
					<b>Tabel Belanja :</b>
					{!! Form::open(['url' => 'carts/update']) !!}
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
								<th>Hapus</th>
								<th>Gambar</th>
								<th>Produk</th>
								<th>Harga</th>
								<th>Jumlah</th>
								<th>Total</th>
								</tr>
							</thead>
							<tbody>
							@forelse ($items as $item)
								@php
									$product = isset($item->associatedModel->parent) ? $item->associatedModel->parent : $item->associatedModel;
									$image = !empty($product->productImages->first()) ? asset('storage/'.$product->productImages->first()->path) : asset('themes/ezone/assets/img/cart/3.jpg')
								@endphp
								<tr>
								
									<td class="product-remove">
									<a href="{{ url('carts/remove/'. $item->id)}}" class="delete btn btn-danger">Hapus</a></td>
									<td><a href="{{ url('product/'. $product->slug) }}"><img src="{{ $image }}" alt="{{ $product->name }}" style="width:100px"></a></td>
									<td><a href="{{ url('product/'. $product->slug) }}">{{ $item->name }}</a></td>
									<td><span class="amount">{{ number_format($item->price) }}</span></td>
									<td>{{-- <input name="" value="{{ $item->quantity }}" type="number" min="1"> --}}
										{!! Form::number('items['. $item->id .'][quantity]', $item->quantity, ['min' => 1, 'required' => true, 'class' => 'form-control lebar']) !!}</td>
									<td>{{ number_format($item->price * $item->quantity)}}</td>
								</tr>
								@empty
									<tr>
										<td colspan="6">Belum ada pembelian!</td>
									</tr>
								@endforelse
							</tbody>
						</table>
						<button class="btn btn-primary btn-round"  name="update_cart" value="Update cart" type="submit"> <i class="zmdi zmdi-favorite-outline6"></i>Perbarui Perubahan</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-lg-6 col-md-6 col-sm-12">
			<div class="card">
				<div class="body">
					<b>Total Harga :</b>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Subtotal</th>
									<th>: {{ number_format(\Cart::getSubTotal()) }}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Total</th>
									<th scope="row">: {{ number_format(\Cart::getTotal()) }}</th>
								</tr>
							</tbody>
						</table>
						<a class="btn btn-primary btn-round" href="{{ url('orders/checkout') }}">Proses Pemesanan</a>
					</div>
					{!! Form::close() !!}
				</div>
			</div>
		</div>
@include('themes.hk.partials.footer')
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
			@include('admin.partials.flash', ['$errors' => $errors])
				<div class="card">
					<div class="body">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<b>ALAMAT :</b>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="row">Nama: {{ $order->shipment->first_name }} {{ $order->shipment->last_name }}</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">Alamat: {{ $order->shipment->address1 }}</th>
											</tr>
											<tr>
												<th scope="row">{{ $order->shipment->address2 }}</th>
											</tr>
											<tr>
												<th scope="row"> Email: {{ $order->shipment->email }}</th>
											</tr>
											<tr>
												<th scope="row">Telpon: {{ $order->shipment->phone }}</th>
											</tr>
											<tr>
												<th scope="row">Kode pos: {{ $order->shipment->postcode }}</th>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<b>DETAIL INVOICE :</b>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>#{{ $order->code }}</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">Tanggal: {{ \General::datetimeFormat($order->order_date) }}</th>
											</tr>
											<tr>
												<th scope="row">Status: {{ $order->status }}</th>
											</tr>
											<tr>
												<th scope="row">Status Pembayaran: {{ $order->payment_status }}</th>
											</tr>
											<tr>
												<th scope="row">Kurir: {{ $order->shipping_service_name }}</th>
											</tr>
										</tbody>
									</table>
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
							<div class="col-lg-12 col-md-12 col-sm-12">
								<b>BARANG YANG DI BELI :</b>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>PRODUK</th>
												<th>JUMLAH</th>
												<th>HARGA</th>
												<th>TOTAL</th>
											</tr>
										</thead>
										<tbody>
										@forelse ($order->orderItems as $item)
											<tr>
												<td>{{ $item->sku }}</td>
												<td>{{ $item->name }}</td>
												<!-- <td>{!! \General::showAttributes($item->attributes) !!}</td> -->
												<td>{{ $item->qty }}</td>
												<td>{{ \General::priceFormat($item->base_price) }}</td>
												<td>{{ \General::priceFormat($item->sub_total) }}</td>
											</tr>
										@empty
											<tr>
												<td colspan="6">Tidak ada pemesanan!</td>
											</tr>
										@endforelse
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card">
					

@include('themes.hk.partials.footer')
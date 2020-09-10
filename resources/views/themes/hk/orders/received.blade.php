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
								<b>SHIPMENT ADDRESS :</b>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>{{ $order->shipment->first_name }} {{ $order->shipment->last_name }}</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>{{ $order->shipment->address1 }}</td>
											</tr>
											<tr>
												<th scope="row">{{ $order->shipment->address2 }}</th>
											</tr>
											<tr>
												<th scope="row"> Email: {{ $order->shipment->email }}</th>
											</tr>
											<tr>
												<th scope="row">Phone: {{ $order->shipment->phone }}</th>
											</tr>
											<tr>
												<th scope="row">Postcode: {{ $order->shipment->postcode }}</th>
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
												<td>{{ \General::datetimeFormat($order->order_date) }}</td>
											</tr>
											<tr>
												<th scope="row">Status: {{ $order->status }}</th>
											</tr>
											<tr>
												<th scope="row">Payment Status: {{ $order->payment_status }}</th>
											</tr>
											<tr>
												<th scope="row">Shipped by: {{ $order->shipping_service_name }}</th>
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
												<th>ITEM</th>
												<th>DESCRIPTION</th>
												<th>QUANTITY</th>
												<th>UNIT COST</th>
												<th>TOTAL</th>
											</tr>
										</thead>
										<tbody>
										@forelse ($order->orderItems as $item)
											<tr>
												<td>{{ $item->sku }}</td>
												<td>{{ $item->name }}</td>
												<td>{!! \General::showAttributes($item->attributes) !!}</td>
												<td>{{ $item->qty }}</td>
												<td>{{ \General::priceFormat($item->base_price) }}</td>
												<td>{{ \General::priceFormat($item->sub_total) }}</td>
											</tr>
										@empty
											<tr>
												<td colspan="6">Order item not found!</td>
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
					<div class="body">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<b>JUMLAH PEMBAYARAN :</b>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Subtotal</th>
												<th>Tax (10%)</th>
												<th>Shipping Cost</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>{{ \General::priceFormat($order->base_total_price) }}</td>
												<td>{{ \General::priceFormat($order->tax_amount) }}</td>
												<td>{{ \General::priceFormat($order->shipping_cost) }}</td>
												<td>{{ \General::priceFormat($order->grand_total) }}</td>
											</tr>
										</tbody>
									</table>
									@if (!$order->isPaid())
									<a href="{{ $order->payment_url }}" class="btn btn-primary btn-round">Proceed to payment</a>
								@endif
								</div>
							</div>
						</div>
					</div>

@include('themes.hk.partials.footer')
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
						<div class="col-lg-12 col-md-12 col-sm-12">
						@include('admin.partials.flash')
							<div class="card">
								<div class="body">
									<h2>Riwayat Pembelian</h2>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>INVOICE</th>
													<th>TOTAL</th>
													<th>STATUS</th>
													<th>PEMBAYARAN</th>
													<th>ACTION</th>
												</tr>
											</thead>
											<tbody>
											@forelse ($orders as $order)
											<tr>    
												<td>
													{{ $order->code }}<br>
													<span style="font-size: 12px; font-weight: normal"> {{\General::datetimeFormat($order->order_date) }}</span>
												</td>
												<td>{{\General::priceFormat($order->grand_total) }}</td>
												<td>{{ $order->status }}</td>
												<td>{{ $order->payment_status }}</td>
												<td>
													<a href="{{ url('orders/'. $order->id) }}" class="btn btn-info btn-sm">details</a>
												</td>
											</tr>
											@empty
												<tr>
													<td colspan="5">No records found</td>
												</tr>
											@endforelse
											</tbody>
										</table>
										{{ $orders->links() }}
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
					</div>

@include('themes.hk.partials.footer')
@include('themes.hk.partials.header')
@include('themes.hk.partials.sidebar')
 @include('themes.hk.partials.h_mobile')

 <div class="container-fluid">
	@include('admin.partials.flash', ['$errors' => $errors])
	{!! Form::model($user, ['url' => 'orders/checkout']) !!}
	<div class="row clearfix"> 
		<!-- Spinners -->
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="card">
				<div class="body">
					<div class="row clearfix">
						<div class="col-md-6">
							<label>Nama Depan :</label>
							<div class="form-group required">                                   
							{!! Form::text('first_name', null, ['required' => true, 'placeholder' => 'Nama Depan', 'class' => 'form-control']) !!} 
							<!-- <input type="text" class="form-control" placeholder="Nama Depan" />                                 -->
							</div>
						</div>
						<div class="col-md-6">
							<label>Nama Belakang :</label>
							<div class="form-group">                                   
							{!! Form::text('last_name', null, ['required' => true, 'placeholder' => 'Nama Depan', 'class' => 'form-control']) !!}                                   
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-12">
							<label>Nama Perusahaan :</label>
							<div class="form-group">                                   
							{!! Form::text('company',null, ['required' => true, 'placeholder' => 'Nama Perusahaan', 'class' => 'form-control']) !!}                                 
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-12">
							<label>Alamat :</label>
							<div class="form-group">                                   
							{!! Form::text('address1', null, ['required' => true, 'placeholder' => 'Nomor rumah dan nama jalan', 'class' => 'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-12">
							<label></label>
							<div class="form-group">                                   
							{!! Form::text('address2', null, ['placeholder' => 'Nama apartemen, yayasan dll ', 'class' => 'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-12">
							<label>Provinsi :</label>
							<div class="form-group">                                   
							{!! Form::select('province_id', $provinces, Auth::user()->province_id, ['id' => 'province-id', 'class' => 'form-control show-tick', 'placeholder' => '- Please Select - ', 'required' => true]) !!}
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-8">
							<label>Kota :</label>
							<div class="form-group">                                   
							{!! Form::select('city_id', $cities, null, ['id' => 'city-id', 'class' => 'form-control show-tick', 'placeholder' => '- Please Select -', 'required' => true])!!}
							</div>
						</div>
						<div class="col-md-4">
							<label>Kode pos :</label>
							<div class="form-group">                                   
							{!! Form::number('postcode', null, ['required' => true, 'placeholder' => 'Kode pos', 'class' => 'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-5">
							<label>Telpon :</label>
							<div class="form-group">                                   
							{!! Form::number('phone', null, ['required' => true, 'placeholder' => 'No telpon / WA', 'class' => 'form-control']) !!}
							</div>
						</div>
						<div class="col-md-7">
							<label>Email :</label>
							<div class="form-group">                                   
							{!! Form::text('email', null, ['placeholder' => 'Email', 'readonly' => true, 'class' => 'form-control']) !!}
							</div>
						</div>
						<div class="col-sm-12">
							<label>Catatan Pesanan</label>
							<div class="form-group">
								<div class="form-line">
									{!! Form::textarea('note', null, ['placeholder' => 'Catatan untuk pengiriman.', 'class' => 'form-control ']) !!}
									
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="different-address">
						<div class="ship-different-title">
							<h3>
								<label>Ship to a different address?</label>
								<input id="box" type="checkbox" name="ship_to"/>
								<button id="tombol">show</button> 
								<div id="box"></div>
							</h3>
						</div>
						<div id="box">
							<div class="row">
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>First Name <span class="required">*</span></label>										
										{!! Form::text('shipping_first_name') !!}
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Last Name <span class="required">*</span></label>										
										{!! Form::text('shipping_last_name') !!}
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Company Name</label>
										{!! Form::text('shipping_company') !!}
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Address <span class="required">*</span></label>
										{!! Form::text('shipping_address1', null, ['placeholder' => 'Home number and street name']) !!}
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										{!! Form::text('shipping_address2', null, ['placeholder' => 'Apartment, suite, unit etc. (optional)']) !!}
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Province<span class="required">*</span></label>
										{!! Form::select('shipping_province_id', $provinces, null, ['id' => 'shipping-province', 'placeholder' => '- Please Select - ']) !!}
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>City<span class="required">*</span></label>
										{!! Form::select('shipping_city_id', [], null, ['id' => 'shipping-city','placeholder' => '- Please Select -'])!!}
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Postcode / Zip <span class="required">*</span></label>										
										{!! Form::number('shipping_postcode', null, ['placeholder' => 'Postcode']) !!}
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Phone  <span class="required">*</span></label>										
										{!! Form::text('shipping_phone', null, ['placeholder' => 'Phone']) !!}
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Email </label>										
										{!! Form::text('shipping_email', null, ['placeholder' => 'Email']) !!}
									</div>
								</div>	
							</div>					
						</div>
						
					</div> -->
				</div>
			</div>
		</div>
		<!-- Tags Input -->
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="card">
				<div class="body">
					<h2>Pembelian</h2>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Produk</th>
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
									<td>
									{{ $item->name }}	<strong class="product-quantity"> × {{ $item->quantity }}</strong>
									</td>
									<td>
									{{ number_format(\Cart::get($item->id)->getPriceSum()) }}
									</td>
								</tr>
								@empty
									<tr>
										<td colspan="2">The cart is empty! </td>
									</tr>
								@endforelse
								<tr>
									<th scope="row">Subtotal</th>
									<td>{{ number_format(\Cart::getSubTotal()) }}</td>
								</tr>
								<tr>
									<th scope="row">TAX</th>
									<td>{{ number_format(\Cart::getCondition('TAX 10%')->getCalculatedValue(\Cart::getSubTotal())) }}</td>
								</tr>
								<tr>
									
									<th>
										<div class="col-md-12">
											<div class="form-group  ml-2">  
												<p>Pilih Harga Kirim ({{ $totalWeight }} kg)</p>                                 
											<select  class="form-control show-tick" id="shipping-cost-option" required name="shipping_service"></select>                                  
											</div>
										</div>
									</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">Total Harga</th>
									<th scope="row">{{ number_format(\Cart::getTotal()) }}</th>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-primary btn-lg" type="submit" value="Place order">Proses Pembayaran</button>
					</div>
				</div>
			</div>
		</div>
		<!-- #END# Tags Input --> 
	{!! Form::close() !!}
@include('themes.hk.partials.footer')
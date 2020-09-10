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
					@include('admin.partials.flash')
                    <div class="card">
                        <div class="body">
						{!! Form::model($user, ['url' => ['profile']]) !!}
									@csrf
							<div class="row clearfix">
								<div class="col-md-6">
									<label>Nama Depan :</label>
									<div class="form-group">
									{!! Form::text('first_name', null, ['class' => 'form-control', 'placeholder' => 'First name', 'required' => true]) !!}
										@error('first_name')
												<strong>{{ $message }}</strong>
										@enderror                                                                     
									</div>
								</div>
								<div class="col-md-6">
									<label>Nama Belakang :</label>
									<div class="form-group">                                   
									{!! Form::text('last_name', null, ['class' => 'form-control', 'placeholder' => 'Last name', 'required' => true]) !!}
											@error('last_name')
											<strong>{{ $message }}</strong>
											@enderror                                 
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-12">
									<label>Company :</label>
									<div class="form-group">     
										{!! Form::text('company', null, ['class' => 'form-control','placeholder' => 'Company']) !!}
											@error('company')
											<strong>{{ $message }}</strong>
											@enderror                                
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-12">
									<label>Home number :</label>
									<div class="form-group">                                   
									{!! Form::text('address1', null, ['class' => 'form-control','required' => true, 'placeholder' => 'Home number and street name']) !!}
											@error('address1')
											<strong>{{ $message }}</strong>
											@enderror
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-12">
									<label>Apartemen :</label>
									<div class="form-group">                                   
									{!! Form::text('address2', null, ['class' => 'form-control','placeholder' => 'Apartment, suite, unit etc. (optional)']) !!}
											@error('address2')
											<strong>{{ $message }}</strong>
											@enderror
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-6">
									<label>Provinsi :</label>
									<div class="form-group">                                   
									{!! Form::select('province_id', $provinces, Auth::user()->province_id, ['class' => 'form-control','id' => 'user-province-id', 'placeholder' => '- Please Select - ', 'required' => true]) !!}
											@error('province_id')
											<strong>{{ $message }}</strong>
											@enderror
									</div>
								</div>
								<div class="col-md-6">
									<label>Kota :</label>
									<div class="form-group">                                   
									{!! Form::select('city_id', $cities, null, ['class' => 'form-control','id' => 'user-city-id', 'placeholder' => '- Please Select -', 'required' => true])!!}
											@error('city_id')
												<span class="invalid-feedback" role="alert">
													<strong>{{ $message }}</strong>
												</span>
											@enderror
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-6">
									<label>Kode Pos :</label>
									<div class="form-group">                                   
									{!! Form::number('postcode', null, ['class' => 'form-control','required' => true, 'placeholder' => 'Postcode']) !!}
											@error('postcode')
												<span class="invalid-feedback" role="alert">
													<strong>{{ $message }}</strong>
												</span>
											@enderror
									</div>
								</div>
								<div class="col-md-6">
									<label>Telpon :</label>
									<div class="form-group">                                   
									{!! Form::text('phone', null, ['class' => 'form-control','required' => true, 'placeholder' => 'Phone']) !!}
											@error('phone')
												<span class="invalid-feedback" role="alert">
													<strong>{{ $message }}</strong>
												</span>
											@enderror
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-md-12">
									<label>Email :</label>
									<div class="form-group">                                   
									{!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Email', 'required' => true]) !!}
											@error('email')
												<span class="invalid-feedback" role="alert">
													<strong>{{ $message }}</strong>
												</span>
											@enderror
									</div>
								</div>
							</div>
							<button class="btn btn-primary btn-round" type="submit"> <i class="zmdi zmdi-favorite-outline6"></i> Update </button>
						</div>
					</div>
					{!! Form::close() !!}
				</div>


@include('themes.hk.partials.footer')
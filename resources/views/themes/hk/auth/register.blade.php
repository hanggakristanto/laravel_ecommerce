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
        <div class="authentication">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-sm-12">
						<form method="POST" action="{{ route('register') }}" class="card auth_form">
						@csrf
							<div class="header">
								<img class="logo" src="{{ asset('themes/hk/assets/images/logo.svg') }}" alt="">
								<h5>Log in</h5>
							</div>
							<div class="body">
								<div class="input-group mb-3">
									<input id="first_name" type="text" class="form-control @error('first_name') is-invalid @enderror" name="first_name" value="{{ old('first_name') }}" required autocomplete="first_name" autofocus placeholder="Nama Depan">
									@error('first_name')
											<span class="invalid-feedback" >
												<strong>{{ $message }}</strong>
											</span>
										@enderror
									<div class="input-group-append">
										<span class="input-group-text"><i class="zmdi zmdi-account-circle"></i></span>
									</div>
								</div>
								<div class="input-group mb-3">
									<input id="last_name" type="text" class="form-control @error('last_name') is-invalid @enderror" name="last_name" value="{{ old('last_name') }}" required autocomplete="last_name" autofocus placeholder="Nama Belakang">
											@error('last_name')
											<span class="invalid-feedback">
												<strong>{{ $message }}</strong>
											</span>
										@enderror
									<div class="input-group-append">                                
										<span class="input-group-text"><i class="zmdi zmdi-account-circle"></i></span>
									</div>                            
								</div>
								<div class="input-group mb-3">
									<input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Email">
										@error('email')
										<span class="invalid-feedback">
											<strong>{{ $message }}</strong>
										</span>
										@enderror
									<div class="input-group-append">                                
										<span class="input-group-text"><i class="zmdi zmdi-email"></i></span>
									</div>                            
								</div>
								<div class="input-group mb-3">
									<input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Password">
										@error('password')
											<span class="invalid-feedback">
												<strong>{{ $message }}</strong>
											</span>
										@enderror
									<div class="input-group-append">                                
										<span class="input-group-text"><i class="zmdi zmdi-lock"></i></span>
									</div>                            
								</div>
								<div class="input-group mb-3">
									<input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Password">                            
									<div class="input-group-append">                                
										<span class="input-group-text"><i class="zmdi zmdi-lock"></i></span>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-block waves-effect waves-light">Daftar</button> 
							</div>
						</form>
					</div>
					<div class="col-lg-8 col-sm-12">
						<div class="card">
							<img src="{{ asset('themes/hk/assets/images/signin.svg') }}" alt="Sign In"/>
						</div>
					</div>
				</div>
			</div>

@include('themes.hk.partials.footer')
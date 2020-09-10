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
						<form method="POST" action="{{ route('login') }}" class="card auth_form">
						@csrf
							<div class="header">
								<img class="logo" src="{{ asset('themes/hk/assets/images/logo.svg') }}" alt="">
								<h5>Masuk</h5>
							</div>
							<div class="body">
								<div class="input-group mb-3">
									<input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus placeholder="{{ __('E-Mail') }}">
									@error('email')
											<span class="invalid-feedback" >
												<strong>{{ $message }}</strong>
											</span>
										@enderror
									<div class="input-group-append">
										<span class="input-group-text"><i class="zmdi zmdi-account-circle"></i></span>
									</div>
								</div>
								<div class="input-group mb-3">
									<input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password" placeholder="{{ __('Password') }}">
									@error('password')
											<span class="invalid-feedback">
												<strong>{{ $message }}</strong>
											</span>
										@enderror
									<div class="input-group-append">                                
										<span class="input-group-text"><i class="zmdi zmdi-lock"></i></span>
									</div>                            
								</div>
								<div class="checkbox">
									<input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
									<label for="remember">{{ __('Ingatkan Saya') }}</label><br>
									<a href="{{ route('password.request') }}">{{ __('Lupa Password?') }}</a>
								</div>
								<button type="submit" class="btn btn-primary btn-block waves-effect waves-light">Masuk</button> 
							</div>
							<div class="signin_with mt-1 mb-3">

							<a href="{{ url('register') }}">Daftar?</a>
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
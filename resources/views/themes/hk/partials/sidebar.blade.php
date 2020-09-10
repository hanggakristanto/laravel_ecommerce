<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar">
    <div class="navbar-brand">
        <button class="btn-menu ls-toggle-btn" type="button"><i class="zmdi zmdi-menu"></i></button>
        <a href="/"><img src="{{ asset('themes/hk/assets/images/l.png') }}" width="25" alt="Aero"><span class="m-l-10">Moeslimah.com</span></a>
    </div>
    <div class="menu">
        <ul class="list">
            @guest
                <div class="user-info">
                    <!-- <a class="image" href="#"><img src="{{ asset('themes/hk/assets/images/p.png') }}" alt="User"></a> -->
                    <div class="detail">
                        <span><a href="{{ url('login') }}">Silahkan Login Dulu!</a></span>
                    </div>
                </div>
                <li><a href="/"><i class="zmdi zmdi-home"></i><span>Beranda</span></a></li>
                <li><a href="{{ url('orders') }}"><i class="zmdi zmdi-assignment"></i><span>Riwayat</span></a></li>
                <li><a href="{{ url('favorites') }}"><i class="zmdi zmdi-favorite"></i><span>Favorit</span></a></li>
                <li><a href="{{ url('ask') }}"><i class="zmdi zmdi-help"></i><span>Bantuan</span></a>
                <li><a href="{{ url('about') }}"><i class="zmdi zmdi-info"></i><span>Tentang Toko</span></a>
                <li><a href="{{ url('login') }}"><i class="zmdi zmdi-power"></i><span>Login</span></a>
            @else
                <li>
                    <div class="user-info">
                        <!-- <a class="image" href="$"><img src="{{ asset('themes/hk/assets/images/p.png') }}" alt="User"></a> -->
                        <div class="detail">
                            <span><a href="{{ url('profile') }}">Hallo, {{ Auth::user()->first_name }}</a></span>
                                                    
                        </div>
                    </div>
                </li>
            <li><a href="/"><i class="zmdi zmdi-home"></i><span>Beranda</span></a></li>
            <li><a href="{{ url('profile') }}"><i class="zmdi zmdi-account"></i><span>Profil</span></a></li>
            <li><a href="{{ url('orders') }}"><i class="zmdi zmdi-assignment"></i><span>Riwayat</span></a></li>
            <li><a href="{{ url('favorites') }}"><i class="zmdi zmdi-favorite"></i><span>Favorit</span></a></li>
            <li><a href="{{ url('ask') }}"><i class="zmdi zmdi-help"></i><span>Bantuan</span></a></li>
            <li><a href="{{ url('about') }}"><i class="zmdi zmdi-info"></i><span>Tentang Toko</span></a></li>
            <li><a href="{{ route('logout') }}"
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
            
                <i class="zmdi zmdi-power"></i><span>{{ __('Keluar') }}</span></a></li>   
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            @endguest         
        </ul>
    </div>
</aside>
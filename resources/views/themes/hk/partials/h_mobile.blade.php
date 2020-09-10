 <!-- hanya tampil di mobile -->
<div class="row">
<div class="col-12">
<nav class="nav_mb">
        <a href="/" class="nav_link">
          <i class="zmdi zmdi-home"></i>
        </a>
        <a href="{{ url('favorites') }}" class="nav_link nav_link-active">
          <i class="zmdi zmdi-favorite"></i>       
        </a>
        <a href="{{ url('carts') }}" class="nav_link">
          <i class="zmdi zmdi-shopping-cart"> {{ \Cart::getTotalQuantity() }}</i>
        </a>
        <a href="{{ url('profile') }}" class="nav_link">
          <i class="zmdi zmdi-account"></i>
        </a>
        <a href="#" class="mobile_m nav_link">
          <i class="zmdi ti-menu"></i>
        </a>
</nav>
</div>
</div>
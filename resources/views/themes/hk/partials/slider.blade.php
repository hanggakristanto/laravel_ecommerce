@if ($slides)
	<div class="mb-3 mt-2 ">
        <div class="body">
            <div id="demo3" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo3" data-slide-to="0" class="active"></li>
                    <li data-target="#demo3" data-slide-to="1" class=""></li>
                    <li data-target="#demo3" data-slide-to="2" class=""></li>
                </ul>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                	@foreach ($slides as $slide)
                    <div class="carousel-item active">
                        <img src="{{ asset('storage/'. $slide->extra_large) }}" data-target="#demo3" class="img-fluid" alt="">
                    </div>
                    @endforeach
                </div>

                <!-- Controls -->
                <a class="carousel-control-prev" href="#demo3" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
                <a class="carousel-control-next" href="#demo3" data-slide="next"><span class="carousel-control-next-icon"></span></a>
            </div>
        </div>
    </div>
@endif
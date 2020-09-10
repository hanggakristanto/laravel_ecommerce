<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">
        <title>{{ config('app.name', 'Muslimah.com') }}</title>
        <!-- Favicon-->
        <link rel="icon" href="{{ asset('themes/hk/assets/img/favicon.png') }}" type="image/x-icon">
        <link rel="stylesheet" href="{{ asset('themes/hk/assets/plugins/bootstrap/css/bootstrap.min.css') }}">
        <!-- Custom Css -->
        
        <link rel="stylesheet" href="{{ asset('themes/hk/assets/css/style.min.css') }}">
        <link rel="stylesheet" href="{{ asset('themes/hk/assets/css/kastem.css') }}">


        <!-- <style>
            .input-group-prepend{
                margin-right: 8px;
            }
        </style> -->
        <!-- CSRF Token -->
		<meta name="csrf-token" content="{{ csrf_token() }}">
    </head>
   <body class="theme-blush">
        <!-- Page Loader -->
        <div class="page-loader-wrapper">
            <div class="loader">
                <!-- <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/loader.svg" width="48" height="48" alt="Aero"></div> -->
                <p>Harap Tunggu Ya...</p>
            </div>
        </div>
        <!-- Overlay For Sidebars -->
        <div class="overlay"></div>
        <div id="search">
            <button id="close" type="button" class="close btn btn-primary btn-icon btn-icon-mini btn-round">x</button>
            <form action="{{ url('products') }}" method="GET">
                <input type="search" name="q" value="{{ isset($q) ? $q : null }}" placeholder="Cari..." />
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>   
        <!-- Main Search -->
<!-- Main Content -->
<section class="content">
    <div class="body_scroll">
        <div class="container-fluid">
            <div class="keatas" style="background-color: white; border-radius: 5px; ">
                <div class="block-header">
                    <div class="row">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-12">
                            <div class="form-group mt-0 mb-0">                            
                                <a href="#search" class="btn btn-primary lbr"><i class="zmdi ti-search"> Cari Sesuatu... </i>
                                </a>                                
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-3 sc2">
                            <a href="{{ url('carts') }}" class="btn btn-primary float-right"><i class="zmdi zmdi-shopping-cart"> {{ \Cart::getTotalQuantity() }}</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

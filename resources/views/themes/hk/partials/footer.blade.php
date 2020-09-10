            </div>
        <!-- <div class="alert alert-warning footer pt-2 pb-2">
            Copy Right By : <b>MahaSantri</b>
        </div> -->
    </div>
</section>
<!-- all js here -->
        <script src="{{ asset('themes/hk/assets/js/jquery-1.12.0.min.js') }}"></script>
        <script src="{{ asset('themes/hk/assets/a/libscripts.bundle.js') }}"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="{{ asset('themes/hk/assets/bundles/vendorscripts.bundle.js') }}"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="{{ asset('themes/hk/assets/bundles/mainscripts.bundle.js') }}"></script>
        <script src="{{ asset('themes/hk/assets/js/app.js') }}"></script>
        <script src="{{ asset('themes/hk/assets/js/main.js') }}"></script>
        <!-- <script>
            $(document).ready(function(){
                $('#tombol').click(function(){
                    $('#box').fadeToggle();
                });
            });
        </script> -->
        <script>
            $(".delete").on("click", function () {
                return confirm("Yakin akan di hapus?");
            });
        </script>
    </body>
</html>

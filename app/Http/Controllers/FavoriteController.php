<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Favorite;
use App\Models\Product;

class FavoriteController extends Controller
{
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();

		$this->middleware('auth');
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$favorites = Favorite::where('user_id', \Auth::user()->id)
			->orderBy('created_at', 'desc')->paginate(10);
		
		$this->data['favorites'] = $favorites;

		return $this->loadTheme('favorites.index', $this->data);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @param \Illuminate\Http\Request $request request params
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		$request->validate(
			[
				'product_slug' => 'required',
			]
		);

		$product = Product::where('slug', $request->get('product_slug'))->firstOrFail();
		
		$favorite = Favorite::where('user_id', \Auth::user()->id)
			->where('product_id', $product->id)
			->first();
		if ($favorite) {
			return response('Produk telah di tambahkan ke Favorit sebelumnya', 422);
		}

		Favorite::create(
			[
				'user_id' => \Auth::user()->id,
				'product_id' => $product->id,
			]
		);

		return response('Produk telah di tambahkan ke Favorit', 200);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param int $id favorite id
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		$favorite = Favorite::findOrFail($id);
		$favorite->delete();

		\Session::flash('success', 'Produk favorit telah di hapus');
		
		return redirect('favorites');
	}
}

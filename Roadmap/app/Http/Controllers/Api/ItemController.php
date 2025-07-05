<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
  
    public function index()
    {
        try {
            $query = Item::with(['category', 'comments'])->withCount('votes')->paginate(5);


            return response()->json([
                'success' => true,
                'data' => $query
            ]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Error loading roadmap items', 'error' => $e->getMessage()], 500);
        }
    }


    public function store(Request $request)
    {

    }


    public function show(string $id)
    {

    }


    public function update(Request $request, string $id)
    {

    }


    public function destroy(string $id)
    {

    }
}

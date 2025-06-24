<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $query = Item::with(['category', 'comments'])->withCount('votes')->orderBy('votes_count', 'desc')->get();

            // if ($request->has('category_id')) {
            //     $query->where('category_id', $request->category_id);
            // }

            // if ($request->has('status')) {
            //     $query->where('status', $request->status);
            // }

            // if ($request->sort === 'popular') {
            //     $query->orderBy('votes_count', 'desc');
            // } else {
            //     $query->latest();
            // }

            return response()->json([
                'success' => true,
                'data' => $query
            ]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Error loading roadmap items', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

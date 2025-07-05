<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteController extends Controller
{
   public function upvote(Request $request, $id)
    {
        try {
            $user = Auth::user();

            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'Unauthorized',
                ], 401);
            }

            $item = Item::findOrFail($id);


            $alreadyVoted = Vote::where('user_id', $user->id)
                                ->where('item_id', $item->id)
                                ->exists();

            if ($alreadyVoted) {
                return response()->json([
                    'success' => false,
                    'message' => 'You have already upvoted this item.',
                ], 409); 
            }


            Vote::create([
                'user_id' => $user->id,
                'item_id' => $item->id,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Upvoted successfully',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Upvote failed',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}



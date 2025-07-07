<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function index($itemId)
    {
        $comments = Comment::with(['user', 'replies.user'])
            ->where('item_id', $itemId)
            ->whereNull('parent_id')
            ->latest()
            ->get();

        return response()->json($comments);
    }

    // Post a comment or a reply
    public function store(Request $request, $itemId)
    {
        $request->validate([
            'comment_text' => 'required|string',
            'parent_id' => 'nullable|exists:comments,id',
        ]);

        $comment = Comment::create([
            'user_id' => Auth::id(),
            'item_id' => $itemId,
            'parent_id' => $request->parent_id,
            'comment_text' => $request->comment_text,
        ]);

        return response()->json([
            'success' => true,
            'comment' => $comment->load('user'),
        ]);
    }

    // Delete a comment or a reply
    public function destroy(Comment $comment)
    {
        if ($comment->user_id !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $comment->delete();

        return response()->json(['success' => true]);
    }
}

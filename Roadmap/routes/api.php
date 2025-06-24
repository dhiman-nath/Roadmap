<?php

// use App\Http\Controllers\Auth\AuthController as AuthAuthController;

use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\VoteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Public Routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


// Route::get('/roadmap-items', [RoadmapItemController::class, 'index']);
//     Route::post('/roadmap-items', [RoadmapItemController::class, 'store']);


// Protected Routes (Need Sanctum token)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/user', [AuthController::class, 'userDetails']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/roadmap-items/{id}/upvote', [VoteController::class, 'upvote']);
    Route::get('/items/{id}/comments', [CommentController::class, 'index']);
    Route::post('/items/{id}/comments', [CommentController::class, 'store']);
    Route::delete('/comments/{comment}', [CommentController::class, 'destroy']);
    Route::resource("itemsList" , ItemController::class);
});

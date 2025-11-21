<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;  // Assume create this

Route::get('/users', [UserController::class, 'index']);  // GET /api/users
Route::post('/users', [UserController::class, 'store']); // POST /api/users
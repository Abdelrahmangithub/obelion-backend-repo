<?php

// The aim of this routes file is to define API routes for the Laravel application.
// These routes handle user-related requests such as listing users and creating a new user.
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;  // Assume create this

Route::get('/users', [UserController::class, 'index']);  // GET /api/users
Route::post('/users', [UserController::class, 'store']); // POST /api/users

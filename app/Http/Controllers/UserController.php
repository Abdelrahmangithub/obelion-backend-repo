<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json(['users' => ['John', 'Jane']]);
    }

    public function store(Request $request): JsonResponse
    {
        return response()->json(['message' => 'User created'], 201);
    }
}
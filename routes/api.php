<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\MuseumApiController;

Route::get('/museums/{page?}', [MuseumApiController::class, 'museums']);
Route::get('/museum/{id}', [MuseumApiController::class, 'museum']);
Route::get('/topic/{id}/{page?}', [MuseumApiController::class, 'topic']);
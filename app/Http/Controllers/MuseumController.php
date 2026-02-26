<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Museum;

class MuseumController extends Controller
{
    public function index()
    {
        $fixedMuseums = Museum::whereIn('id', [1, 2])->get();

        $randomMuseums = Museum::whereNotIn('id', [1, 2])
            ->inRandomOrder()
            ->limit(3)
            ->get();

        //$museums = $fixedMuseums->merge($randomMuseums);

        return view('home', compact('fixedMuseums', 'randomMuseums'));
    }

    public function show($id)
    {
        $museum = Museum::with('topics')->findOrFail($id);

        return view('museum', compact('museum'));
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Museum;
use App\Models\Topic;

class MuseumApiController extends Controller
{
    public function museums($page = 1)
    {
        $query = Museum::with('topics');
        
        $total = $query->count();

        $perPage = 5;
        $museums = $query->skip(($page - 1) * $perPage)
                        ->take($perPage)
                        ->get()
                        ->map(function($museum) {
                            return [
                                'id' => $museum->id,
                                'nombre' => $museum->name,
                                'ciudad' => $museum->city,
                                'tematica' => $museum->topics->pluck('name')->implode(', '), 
                                'fechas_horarios' => $museum->schedule,
                                'visitas_guiadas' => $museum->guided_tours,
                                'precio' => $museum->price,
                                'imagen' => $museum->image,
                            ];
                        });

        if ($museums->isEmpty()) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        return response()->json([
            'current_page' => (int)$page,
            'data' => $museums,
            'per_page' => $perPage,
            'total' => $total,
            'last_page' => ceil($total / $perPage),
        ]);
    }

    public function museum($id)
    {
        $museum = Museum::with('topics')->find($id);

        if (!$museum) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        $result = [
            'id' => $museum->id,
            'nombre' => $museum->name,
            'ciudad' => $museum->city,
            'tematica' => $museum->topics->pluck('name')->implode(', '), 
            'fechas_horarios' => $museum->schedule,
            'visitas_guiadas' => $museum->guided_tours,
            'precio' => $museum->price,
            'imagen' => $museum->image,
        ];

        return response()->json($result);
    }

    public function topic($id, $page = 1)
    {
        $topic = Topic::find($id);

        if (!$topic) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        $query = $topic->museums()->select('museums.id', 'museums.name', 'museums.city');

        $perPage = 5;
        $total = $query->count();
        $museums = $query->skip(($page - 1) * $perPage)
                        ->take($perPage)
                        ->get()
                        ->map(function($museum) {
                            return [
                                'id' => $museum->id,
                                'name' => $museum->name,
                                'city' => $museum->city,
                            ];
                        });

        if ($museums->isEmpty()) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        $response = [
            'current_page' => (int)$page,
            'data' => $museums,
            'per_page' => $perPage,
            'total' => $total,
            'last_page' => ceil($total / $perPage),
        ];

        return response()->json($response);
    }
}

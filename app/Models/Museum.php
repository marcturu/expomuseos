<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Museum extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'city',
        'schedule',
        'guided_tours',
        'price',
        'image'
    ];

    public function topics()
    {
        return $this->belongsToMany(Topic::class);
    }
}

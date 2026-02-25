<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Museum;
use App\Models\Topic;

class MuseumSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $topics = Topic::all(); 

        Museum::factory(40)->create()->each(function ($museum, $index) use ($topics) {
            if ($index < 20) {
                // At least 2 topics for the first 20 museums
                $museum->topics()->attach(
                    $topics->random(rand(2, $topics->count()))->pluck('id')->toArray()
                );
            } else {
                // The rest gets 1 topic
                $museum->topics()->attach(
                    $topics->random(1)->pluck('id')->toArray()
                );
            }
        });
    }
}

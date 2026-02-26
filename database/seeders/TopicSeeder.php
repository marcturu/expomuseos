<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Topic;

class TopicSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $topics = [
            'Fotografía',
            'Diseño industrial',
            'Astronomía',
            'Literatura',
        ];

        foreach ($topics as $topicName) {
            Topic::firstOrCreate(['name' => $topicName]);
        }
    }
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Museum>
 */
class MuseumFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->company . ' Museum', 
            'city' => $this->faker->unique()->city,               
            'schedule' => $this->faker->sentence(6),             
            'guided_tours' => $this->faker->randomElement(['sí', 'no']), 
            'price' => $this->faker->randomFloat(2, 5, 25),      
            'image' => 'images/museums/' . $this->faker->unique()->uuid . '.jpg', 
        ];
    }
}

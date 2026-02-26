<x-app-layout>
    <div class="w-full px-6 py-6">

        <header class="mb-6 border-b border-gray-300">
            <h1 class="text-xl sm:text-2xl lg:text-3xl font-bold text-gray-900">{{ $museum->name }}</h1>
            <p class="text-lg sm:text-xl text-gray-500 mt-2">{{ $museum->city }}</p>
        </header>


        <div class="flex flex-col lg:flex-row gap-6 items-start w-full">
            <div class="w-full lg:w-1/2 overflow-hidden rounded-md shadow-md">
                <img
                    src="{{ asset($museum->image) }}"
                    alt="{{ $museum->name }}"
                    class="w-full h-full object-cover"
                >
            </div>

            <div class="w-full lg:w-1/2 bg-white rounded-2xl shadow-sm p-6 space-y-4">
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Horario</h2>
                    <p class="text-lg text-gray-600">{{ $museum->schedule }}</p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Visitas guiadas</h2>
                    <p class="text-lg text-gray-600">
                        {{ $museum->guided_tours === 'sí' ? 'Sí' : 'No' }}
                    </p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Precio</h2>
                    <p class="text-lg text-gray-600">{{ $museum->price }} €</p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-2">Temáticas</h2>
                    <div class="flex flex-wrap gap-2">
                        @foreach ($museum->topics as $topic)
                            <span class="px-3 py-1 text-md rounded-full bg-indigo-50 text-indigo-700 font-medium">{{ $topic->name }}</span>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-6">
            <a href="{{ url('/') }}"
            class="inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                ← Volver al listado
            </a>
        </div>


    </div>
</x-app-layout>

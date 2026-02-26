<x-app-layout>
    <div class="relative w-full overflow-hidden mt-2">
        <img src="{{ asset('images/museums/expo-museos.jpg') }}" 
             alt="Museos Banner" 
             class="w-full h-auto object-cover brightness-75">
    </div>

    <div class="max-w-7xl mx-auto px-4 mt-6">

        <h2 class="text-xl font-bold text-gray-900 mb-2">Museos destacados</h2>
        <div class="flex flex-wrap -mx-2 mb-4">
            @foreach ($fixedMuseums as $museum)
                <div class="w-full sm:w-1/2 px-2 mb-4">
                    <div class="bg-white rounded shadow overflow-hidden flex flex-col 
                                transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl group">
                        <a href="{{ url('/museum/' . $museum->id) }}" class="block relative w-full aspect-[16/9] overflow-hidden">
                            <img src="{{ asset($museum->image) }}" 
                                 alt="{{ $museum->name }}" 
                                 class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105 group-hover:brightness-110">
                        </a>
                        <div class="p-2">
                            <h3 class="text-xl font-semibold text-gray-900 truncate ml-1 mt-1 
                                       transition-colors duration-300 group-hover:text-indigo-600">
                                <a href="{{ url('/museum/' . $museum->id) }}">{{ $museum->name }}</a>
                            </h3>
                            <p class="text-lg text-gray-600 truncate ml-1">{{ $museum->city }}</p>
                            <p class="mt-1 text-gray-600 font-bold text-lg ml-1">{{ $museum->price }} €</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <h2 class="text-xl font-bold text-gray-900 mt-6 mb-2">Otros museos</h2>
        <div class="flex flex-wrap -mx-2 mb-4">
            @foreach ($randomMuseums as $museum)
                <div class="w-full sm:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-white rounded shadow overflow-hidden flex flex-col 
                                transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl group">
                        <a href="{{ url('/museum/' . $museum->id) }}" class="block relative w-full aspect-[16/9] overflow-hidden">
                            <img src="{{ asset($museum->image) }}" 
                                 alt="{{ $museum->name }}" 
                                 class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105 group-hover:brightness-110">
                        </a>
                        <div class="p-2">
                            <h3 class="text-xl font-semibold text-gray-900 truncate ml-1 mt-1 
                                       transition-colors duration-300 group-hover:text-indigo-600">
                                <a href="{{ url('/museum/' . $museum->id) }}">{{ $museum->name }}</a>
                            </h3>
                            <p class="text-lg text-gray-600 truncate ml-1">{{ $museum->city }}</p>
                            <p class="mt-1 text-gray-600 font-bold text-lg ml-1">{{ $museum->price }} €</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

    </div>
</x-app-layout>

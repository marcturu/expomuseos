<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div style="text-align: center; margin-top: 2rem; margin-bottom: 2rem;">
                    <p style="text-align: center; font-size: 1.25rem; margin-bottom: 1.5rem;">
                        ¡Nos alegramos de volverte a ver, <strong>{{ auth()->user()->name }}</strong>!
                    </p>

                    <div style="display: inline-flex; gap: 1rem; flex-wrap: wrap; justify-content: center;">
                        <a href="{{ route('profile.edit') }}"
                        class="inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                        {{ __('Profile') }}
                        </a>

                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <x-danger-button type="submit"> 
                                {{ __('Log Out') }} 
                            </x-danger-button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
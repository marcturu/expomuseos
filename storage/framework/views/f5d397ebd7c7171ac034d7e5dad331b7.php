<?php if (isset($component)) { $__componentOriginal9ac128a9029c0e4701924bd2d73d7f54 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54 = $attributes; } ?>
<?php $component = App\View\Components\AppLayout::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('app-layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\AppLayout::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <div class="w-full px-6 py-6">

        <header class="mb-6 border-b border-gray-300">
            <h1 class="text-xl sm:text-2xl lg:text-3xl font-bold text-gray-900"><?php echo e($museum->name); ?></h1>
            <p class="text-lg sm:text-xl text-gray-500 mt-2"><?php echo e($museum->city); ?></p>
        </header>


        <div class="flex flex-col lg:flex-row gap-6 items-start w-full">
            <div class="w-full lg:w-1/2 overflow-hidden rounded-md shadow-md">
                <img
                    src="<?php echo e(asset($museum->image)); ?>"
                    alt="<?php echo e($museum->name); ?>"
                    class="w-full h-full object-cover"
                >
            </div>

            <div class="w-full lg:w-1/2 bg-white rounded-2xl shadow-sm p-6 space-y-4">
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Horario</h2>
                    <p class="text-lg text-gray-600"><?php echo e($museum->schedule); ?></p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Visitas guiadas</h2>
                    <p class="text-lg text-gray-600">
                        <?php echo e($museum->guided_tours === 'sí' ? 'Sí' : 'No'); ?>

                    </p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-1">Precio</h2>
                    <p class="text-lg text-gray-600"><?php echo e($museum->price); ?> €</p>
                </div>
                <div class="mb-4">
                    <h2 class="text-xl font-semibold text-gray-800 mb-2">Temáticas</h2>
                    <div class="flex flex-wrap gap-2">
                        <?php $__currentLoopData = $museum->topics; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $topic): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <span class="px-3 py-1 text-md rounded-full bg-indigo-50 text-indigo-700 font-medium"><?php echo e($topic->name); ?></span>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-6">
            <a href="<?php echo e(url('/')); ?>"
            class="inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                ← Volver al listado
            </a>
        </div>


    </div>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54)): ?>
<?php $attributes = $__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54; ?>
<?php unset($__attributesOriginal9ac128a9029c0e4701924bd2d73d7f54); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal9ac128a9029c0e4701924bd2d73d7f54)): ?>
<?php $component = $__componentOriginal9ac128a9029c0e4701924bd2d73d7f54; ?>
<?php unset($__componentOriginal9ac128a9029c0e4701924bd2d73d7f54); ?>
<?php endif; ?>
<?php /**PATH C:\wamp64\www\dbphppec4_museums\resources\views/museum.blade.php ENDPATH**/ ?>
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
    <div class="relative w-full overflow-hidden mt-2">
        <img src="<?php echo e(asset('images/museums/expo-museos.jpg')); ?>" 
             alt="Museos Banner" 
             class="w-full h-auto object-cover brightness-75">
    </div>

    <div class="max-w-7xl mx-auto px-4 mt-6">

        <h2 class="text-xl font-bold text-gray-900 mb-2">Museos destacados</h2>
        <div class="flex flex-wrap -mx-2 mb-4">
            <?php $__currentLoopData = $fixedMuseums; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $museum): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="w-full sm:w-1/2 px-2 mb-4">
                    <div class="bg-white rounded shadow overflow-hidden flex flex-col 
                                transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl group">
                        <a href="<?php echo e(url('/museum/' . $museum->id)); ?>" class="block relative w-full aspect-[16/9] overflow-hidden">
                            <img src="<?php echo e(asset($museum->image)); ?>" 
                                 alt="<?php echo e($museum->name); ?>" 
                                 class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105 group-hover:brightness-110">
                        </a>
                        <div class="p-2">
                            <h3 class="text-xl font-semibold text-gray-900 truncate ml-1 mt-1 
                                       transition-colors duration-300 group-hover:text-indigo-600">
                                <a href="<?php echo e(url('/museum/' . $museum->id)); ?>"><?php echo e($museum->name); ?></a>
                            </h3>
                            <p class="text-lg text-gray-600 truncate ml-1"><?php echo e($museum->city); ?></p>
                            <p class="mt-1 text-gray-600 font-bold text-lg ml-1"><?php echo e($museum->price); ?> €</p>
                        </div>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>

        <h2 class="text-xl font-bold text-gray-900 mt-6 mb-2">Otros museos</h2>
        <div class="flex flex-wrap -mx-2 mb-4">
            <?php $__currentLoopData = $randomMuseums; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $museum): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="w-full sm:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-white rounded shadow overflow-hidden flex flex-col 
                                transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl group">
                        <a href="<?php echo e(url('/museum/' . $museum->id)); ?>" class="block relative w-full aspect-[16/9] overflow-hidden">
                            <img src="<?php echo e(asset($museum->image)); ?>" 
                                 alt="<?php echo e($museum->name); ?>" 
                                 class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105 group-hover:brightness-110">
                        </a>
                        <div class="p-2">
                            <h3 class="text-xl font-semibold text-gray-900 truncate ml-1 mt-1 
                                       transition-colors duration-300 group-hover:text-indigo-600">
                                <a href="<?php echo e(url('/museum/' . $museum->id)); ?>"><?php echo e($museum->name); ?></a>
                            </h3>
                            <p class="text-lg text-gray-600 truncate ml-1"><?php echo e($museum->city); ?></p>
                            <p class="mt-1 text-gray-600 font-bold text-lg ml-1"><?php echo e($museum->price); ?> €</p>
                        </div>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
<?php /**PATH C:\wamp64\www\dbphppec4_museums\resources\views/home.blade.php ENDPATH**/ ?>
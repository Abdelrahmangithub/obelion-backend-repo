<?php
// app/Providers/AppServiceProvider.php (simplified boot)
namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // No routes() here—keep empty or add non-route bootstraps
    }
}
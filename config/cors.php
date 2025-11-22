<?php

// The aim of this configuration file is to set up CORS (Cross-Origin Resource Sharing) settings for a Laravel application.
// This configuration allows the backend to accept requests from a frontend application running on a different origin (http://localhost:3001).
return [
    'paths' => ['api/*'],                               // Any route that starts with api/
    'allowed_methods' => ['*'],                         // Allow all HTTP methods 
    'allowed_origins' => ['http://localhost:3001'],     // Frontend URL ///////////////
    'allowed_headers' => ['*'],                         // Allow all headers
    'exposed_headers' => [],                            // No exposed headers
    'max_age' => 0,                                     // No caching of preflight response
    'supports_credentials' => false,                    // Do not support credentials
];

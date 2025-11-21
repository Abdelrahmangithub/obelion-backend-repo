<?php

return [
    'paths' => ['api/*'],        // Any route that starts with api/
    'allowed_methods' => ['*'],       
    'allowed_origins' => ['http://localhost:3001'],// Frontend URL ///////////////
    'allowed_headers' => ['*'],       
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => false,
];

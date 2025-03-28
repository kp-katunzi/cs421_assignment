<?php
require_once __DIR__ . '/v1/api/UniversityAPI.php';

header('Content-Type: application/json');

$api = new UniversityAPI();
$api->processRequest();

//clone nohup php -S 0.0.0.0:8080 > /dev/null 2>&1 &
//kill pkill -f "php -S 0.0.0.0:8080"

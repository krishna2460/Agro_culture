<?php
// api/index.php — safe wrapper for Vercel PHP runtime
// Ensure includes in the application resolve from project root
chdir(dirname(__DIR__));

// Forward the request to the root index.php
require_once __DIR__ . '/../index.php';


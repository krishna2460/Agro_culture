<?php

    // Load environment variables
    $serverName = getenv('DB_HOST') ?: 'localhost';
    $userName = getenv('DB_USER') ?: 'root';
    $password = getenv('DB_PASS') ?: '';
    $dbName = getenv('DB_NAME') ?: 'agroculture';

    $conn = mysqli_connect($serverName, $userName, $password, $dbName);
    if (!$conn)
    {
        die("Connection failed: " . mysqli_connect_error());
    }

?>

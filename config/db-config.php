<?php
/**
 * Gadget50 - WhatsApp Commerce System
 * Shared Database Configuration
 * Author: MAINUDDIN
 * License: MIT
 */

// Database Credentials
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'gadget50_db');
define('DB_CHARSET', 'utf8mb4');

// Connection options
$dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

// Create PDO connection
try {
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
} catch (PDOException $e) {
    die('Database Connection Error: ' . $e->getMessage());
}

// Site Configuration
define('SITE_NAME', 'Gadget50');
define('SITE_TIMEZONE', 'Asia/Dhaka');
date_default_timezone_set(SITE_TIMEZONE);

// Security
define('BCRYPT_COST', 12);
define('SESSION_TIMEOUT', 1800); // 30 minutes in seconds
define('MAX_LOGIN_ATTEMPTS', 3);
define('BLOCK_DURATION', 172800); // 48 hours in seconds

// WhatsApp
define('WHATSAPP_API', true);

// Paths
define('SHOP_URL', 'https://shop.domain.com');
define('ADMIN_URL', 'https://store.domain.com');
define('ROOT_PATH', dirname(__DIR__));

-- Gadget50 - WhatsApp Commerce System
-- Database Schema
-- Author: MAINUDDIN
-- License: MIT

-- Create Database
CREATE DATABASE IF NOT EXISTS gadget50_db;
USE gadget50_db;

-- =====================
-- PRODUCTS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description LONGTEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    discount_price DECIMAL(10, 2),
    offer_badge VARCHAR(100),
    offer_start DATETIME,
    offer_end DATETIME,
    stock INT NOT NULL DEFAULT 0,
    category VARCHAR(100),
    specs JSON,
    images JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================
-- REVIEWS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    approved BOOLEAN DEFAULT FALSE,
    ip VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_product_id (product_id),
    INDEX idx_approved (approved),
    UNIQUE KEY unique_review (product_id, ip, DATE(created_at))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================
-- SETTINGS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS settings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `key` VARCHAR(100) UNIQUE NOT NULL,
    `value` LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================
-- ADMINS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================
-- LOGIN ATTEMPTS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS login_attempts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ip VARCHAR(45) NOT NULL,
    device_fingerprint VARCHAR(255),
    username VARCHAR(100),
    attempt_count INT DEFAULT 1,
    blocked_until DATETIME,
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_attempt (ip, device_fingerprint),
    INDEX idx_ip (ip),
    INDEX idx_blocked_until (blocked_until)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================
-- INSERT DEFAULT SETTINGS
-- =====================
INSERT INTO settings (`key`, `value`) VALUES
('site_name', 'Gadget50'),
('whatsapp_number', '+8801XXXXXXXXX'),
('delivery_charge', '60'),
('primary_color', '#25D366'),
('secondary_color', '#128C7E'),
('danger_color', '#f44336'),
('warning_color', '#FF9800'),
('logo_url', ''),
('footer_text', 'Made with ❤️ by MAINUDDIN'),
('delivery_time', '3-5 days'),
('currency', '৳')
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

-- =====================
-- INSERT DEFAULT ADMIN
-- =====================
-- Username: admin
-- Password: admin@123 (hashed with bcrypt, cost 12)
-- Change this immediately after first login!
INSERT INTO admins (username, password_hash) VALUES
('admin', '$2y$12$R9h7cIPz0gi.URNNRQ3IQOiPGoz1Ty3VNgtEVVQQi9D3I.7CqLZiG')
ON DUPLICATE KEY UPDATE password_hash = VALUES(password_hash);

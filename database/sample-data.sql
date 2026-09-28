-- Gadget50 - Sample Product Data
-- Author: MAINUDDIN
-- License: MIT

USE gadget50_db;

-- =====================
-- INSERT SAMPLE PRODUCTS
-- =====================
INSERT INTO products (name, slug, description, price, discount_price, offer_badge, offer_start, offer_end, stock, category, specs, images) VALUES

-- Mobile Phones
('iPhone 15 Pro', 'iphone-15-pro', 
'Latest Apple flagship with A17 Pro chip, advanced camera system, and titanium design.',
129999, 119999, 'Flash Sale', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 15, 'Phones',
'{"processor": "A17 Pro", "storage": "256GB", "color": "Space Black", "display": "6.1 inch"}',
'["https://via.placeholder.com/400x400?text=iPhone+15+Pro+1", "https://via.placeholder.com/400x400?text=iPhone+15+Pro+2"]'),

('Samsung Galaxy S24', 'samsung-galaxy-s24',
'Premium Android phone with Snapdragon 8 Gen 3, excellent OLED display, and AI features.',
119999, 99999, 'Eid Offer', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 20, 'Phones',
'{"processor": "Snapdragon 8 Gen 3", "storage": "512GB", "color": "Phantom Black", "display": "6.2 inch"}',
'["https://via.placeholder.com/400x400?text=Galaxy+S24+1", "https://via.placeholder.com/400x400?text=Galaxy+S24+2"]'),

('Xiaomi 14', 'xiaomi-14',
'Mid-range powerhouse with Snapdragon 8 Gen 3 Leading Version and excellent camera.',
69999, 59999, NULL, NULL, NULL, 25, 'Phones',
'{"processor": "Snapdragon 8 Gen 3 Leading", "storage": "256GB", "color": "Black", "display": "6.36 inch"}',
'["https://via.placeholder.com/400x400?text=Xiaomi+14+1", "https://via.placeholder.com/400x400?text=Xiaomi+14+2"]'),

-- Headphones
('Sony WH-1000XM5', 'sony-wh-1000xm5',
'Industry-leading noise canceling headphones with exceptional sound quality and comfort.',
44999, 39999, 'Flash Sale', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 10, 'Headphones',
'{"type": "Over-ear", "noise_canceling": "Yes", "battery_life": "30 hours", "connection": "Bluetooth 5.3"}',
'["https://via.placeholder.com/400x400?text=Sony+XM5+1", "https://via.placeholder.com/400x400?text=Sony+XM5+2"]'),

('Apple AirPods Pro', 'apple-airpods-pro',
'Premium earbuds with active noise cancellation and seamless Apple integration.',
34999, 29999, NULL, NULL, NULL, 18, 'Headphones',
'{"type": "Earbuds", "noise_canceling": "Yes", "battery_life": "6 hours", "connection": "Bluetooth 5.3"}',
'["https://via.placeholder.com/400x400?text=AirPods+Pro+1", "https://via.placeholder.com/400x400?text=AirPods+Pro+2"]'),

('JBL Tune 770NC', 'jbl-tune-770nc',
'Affordable noise-canceling headphones with great sound and long battery life.',
12999, 9999, NULL, NULL, NULL, 30, 'Headphones',
'{"type": "Over-ear", "noise_canceling": "Yes", "battery_life": "44 hours", "connection": "Bluetooth 5.3"}',
'["https://via.placeholder.com/400x400?text=JBL+770+1", "https://via.placeholder.com/400x400?text=JBL+770+2"]'),

-- Tablets
('iPad Pro 12.9', 'ipad-pro-12-9',
'Powerful tablet for creative professionals and power users.',
179999, 159999, NULL, NULL, NULL, 8, 'Tablets',
'{"processor": "M2", "storage": "256GB", "display": "12.9 inch", "ram": "8GB"}',
'["https://via.placeholder.com/400x400?text=iPad+Pro+1", "https://via.placeholder.com/400x400?text=iPad+Pro+2"]'),

('Samsung Galaxy Tab S9', 'samsung-galaxy-tab-s9',
'AMOLED tablet with stunning display and S Pen support.',
89999, 79999, 'Eid Offer', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 12, 'Tablets',
'{"processor": "Snapdragon 8 Gen 2", "storage": "256GB", "display": "11 inch AMOLED", "ram": "8GB"}',
'["https://via.placeholder.com/400x400?text=Tab+S9+1", "https://via.placeholder.com/400x400?text=Tab+S9+2"]'),

-- Smartwatches
('Apple Watch Series 9', 'apple-watch-series-9',
'Advanced health and fitness tracking with Retina display.',
54999, 49999, 'Flash Sale', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 14, 'Smartwatches',
'{"size": "41mm", "display": "Always-On Retina", "battery": "18 hours", "colors": "Multiple"}',
'["https://via.placeholder.com/400x400?text=AWatch+Series+9+1", "https://via.placeholder.com/400x400?text=AWatch+Series+9+2"]'),

('Samsung Galaxy Watch 6', 'samsung-galaxy-watch-6',
'AMOLED smartwatch with excellent battery life.',
29999, 24999, NULL, NULL, NULL, 20, 'Smartwatches',
'{"size": "40mm", "display": "AMOLED", "battery": "2+ days", "os": "Wear OS"}',
'["https://via.placeholder.com/400x400?text=GWatch+6+1", "https://via.placeholder.com/400x400?text=GWatch+6+2"]');

-- =====================
-- INSERT SAMPLE SETTINGS
-- =====================
UPDATE settings SET `value` = '+8801712345678' WHERE `key` = 'whatsapp_number';
UPDATE settings SET `value` = '60' WHERE `key` = 'delivery_charge';
UPDATE settings SET `value` = 'Made with ❤️ by MAINUDDIN' WHERE `key` = 'footer_text';

# Gadget50 — WhatsApp Commerce System

**Author:** MAINUDDIN (মাইন উদ্দিন)  
**License:** MIT  
**Status:** Development

---

## 📋 PROJECT OVERVIEW

A custom e-commerce system with **TWO subdomains** sharing **ONE database**:

- **shop.domain.com** → Public storefront (no login, no account, no payment)
- **store.domain.com** → Super admin dashboard (login + IP block after 3 failed attempts)

Orders are placed via WhatsApp. Customers fill shipping info **ONCE** in cart, click checkout, and WhatsApp opens with a pre-filled message.

**Default Site Name:** Gadget50 (Admin can change later from settings)

---

## 🛠 TECH STACK

| Component | Technology |
|-----------|-----------|
| Backend | PHP 8.3 |
| Database | MySQL |
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| Cart Storage | localStorage |
| Password Hashing | bcrypt (password_hash) |
| Authentication | PHP Sessions |
| Hosting | InfinityFree |
| Frameworks | None (Zero framework) |
| Package Managers | No Composer, No npm |

---

## 🏗 DOMAIN STRUCTURE

```
domain.com
├── / → Main domain (stays empty)
├── shop.domain.com → Public Store
└── store.domain.com → Admin Panel (hidden, noindex)
```

---

## 🛍 PUBLIC STORE (shop.domain.com)

### Pages

#### 1. Product Grid (Home)
- **Sticky Header:** Logo (site name), home link, cart icon with count badge
- **Hero Banner:** Welcome text
- **Product Grid:** 
  - Image, name, price (strikethrough if discounted)
  - Discount badge, offer badge
  - "Add to Cart" button
- **Footer:** Copyright + WhatsApp number

#### 2. Product Detail Page
- **Left Side:** Main image + thumbnail gallery (click thumbnail to change main)
- **Right Side:**
  - Name, price, discount, description
  - Specs table, shipping info box, stock status
  - "Add to Cart" button
  - "Order via WhatsApp" button (single product)
- **Reviews Section:**
  - Approved reviews only
  - Review form: name, rating (1-5 stars), comment
  - Limit: One review per IP per product per 24 hours

#### 3. Shopping Cart
- **Cart Items Table:** Image, name, price, qty (+/-), total, delete button
- **Totals:** Subtotal, delivery charge, grand total
- **Shipping Form (Filled ONCE):**
  - Name (required)
  - Phone (required)
  - Full Address (required, multi-line)
  - Note (optional)
- **"Confirm Order via WhatsApp" Button**
  - Opens WhatsApp with pre-filled message

### WhatsApp Checkout Message Format

```
مرحبا! 👋
I have a new order:

📦 ORDER DETAILS
━━━━━━━━━━━━━━
Customer: [Name]
Phone: [Phone]
Address: [Full Address]
Note: [Note if any]

📋 ITEMS:
1. [Product Name] × [Qty] = ৳[Total]
   🔗 [Product Link]
2. [Product Name] × [Qty] = ৳[Total]
   🔗 [Product Link]

💰 TOTAL CALCULATION:
Subtotal: ৳[Amount]
Delivery: ৳[Amount]
GRAND TOTAL: ৳[Grand Total]

Thanks! 🎉
```

### Customer CANNOT
- ❌ Create account
- ❌ Login
- ❌ Pay online
- ❌ Confirm order directly (only via WhatsApp)
- ❌ Access admin panel

---

## 🔐 ADMIN PANEL (store.domain.com)

### Security Features (CRITICAL)

- **First Screen = Login Only** (no public content)
- **Separate Admins Table** (not customers)
- **Authentication:** Username + password (bcrypt hash)
- **IP + Device Fingerprint Blocking:**
  - After 3 failed login attempts → Block for 48 hours
  - Store: IP, device fingerprint, cookie, user agent, timestamp
  - Show remaining attempts on 2nd failure
  - Show block message with time remaining on 3rd failure
- **robots.txt + noindex header** (hidden from search)
- **HTTPS Mandatory**
- **Session Timeout:** 30 minutes inactive
- **Optional:** 2FA support

### Dashboard Menu

1. **Dashboard Home**
   - Today's stats, total products, pending reviews, active offers
   - Recent activity log

2. **Product Management**
   - Add product: name, slug, description, price, discount price, offer badge, offer start/end date, stock, category, specs (dynamic key-value), multiple images
   - Edit product
   - Delete product
   - Update stock

3. **Discounts & Offers**
   - Set % or flat discount
   - Offer badge text (Flash Sale, Eid Offer, etc.)
   - Start and end date
   - Select which products get the offer

4. **Review Moderation**
   - View pending reviews
   - Approve / Delete

5. **WhatsApp Settings**
   - Business WhatsApp number
   - Auto-message template

6. **Shipping Settings**
   - Delivery charge
   - Area-based charge
   - Delivery time

7. **Site Settings**
   - Site name (default: Gadget50 — changeable)
   - Logo upload
   - Color scheme
   - Footer text

8. **Logout**

---

## 📊 DATABASE SCHEMA

### Tables

#### `products`
```sql
id, name, slug, description, price, discount_price,
offer_badge, offer_start, offer_end, stock, category,
specs (JSON), images (JSON), created_at
```

#### `reviews`
```sql
id, product_id, name, rating, comment,
approved, ip, created_at
```

#### `settings`
```sql
key, value
```
Default keys: `site_name`, `whatsapp_number`, `delivery_charge`, `logo`, `primary_color`, `secondary_color`

#### `admins`
```sql
id, username, password_hash, created_at
```

#### `login_attempts`
```sql
id, ip, device_fingerprint, username,
attempt_count, blocked_until, created_at
```

---

## 🎨 DESIGN GUIDELINES

- **Style:** Modern, clean, minimal (Shopify-like)
- **Colors:**
  - Primary: #25D366 (WhatsApp Green)
  - Secondary: #128C7E (WhatsApp Dark)
  - Danger: #f44336 (Red)
  - Warning: #FF9800 (Orange)
- **Font:** SolaimanLipi / Noto Sans Bengali
- **Responsive:**
  - Desktop: 4 columns
  - Tablet: 3 columns
  - Mobile: 2 columns
- **Cards:** Rounded corners, soft shadow, hover lift effect
- **Buttons:** Rounded, full-width on mobile

---

## 👥 CUSTOMER JOURNEY

1. Customer visits shop.domain.com
2. Browses product grid
3. Clicks a product → views images, description, reviews
4. Adds to cart
5. Continues shopping OR goes to cart
6. Adjusts quantities or removes items
7. Fills shipping form **ONCE** (name, phone, address, note)
8. Clicks "Confirm Order via WhatsApp"
9. WhatsApp opens with pre-filled message
10. Clicks Send
11. Order arrives at business WhatsApp
12. Business confirms order
13. Delivery process starts

**NO second time address asking. NO login. NO account.**

---

## 📁 FOLDER STRUCTURE

```
gadget50-ecommerce/
├── shop/                    # Public Store
│   ├── index.php
│   ├── product-detail.php
│   ├── cart.php
│   ├── api/
│   ├── assets/
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   └── config.php
│
├── store/                   # Admin Dashboard
│   ├── index.php           # Login page
│   ├── dashboard.php
│   ├── products.php
│   ├── offers.php
│   ├── reviews.php
│   ├── settings.php
│   ├── api/
│   ├── assets/
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   ├── config.php
│   └── logout.php
│
├── database/                # Database Files
│   ├── schema.sql           # Full database schema
│   └── sample-data.sql      # Sample products & data
│
├── config/
│   ├── db-config.php        # Shared DB credentials
│   └── constants.php
│
├── .htaccess                # URL rewriting
└── README.md
```

---

## ⚙️ INSTALLATION & SETUP

### Prerequisites
- PHP 8.3+
- MySQL 5.7+
- InfinityFree hosting (or any cPanel hosting)
- Modern browser with JavaScript enabled

### Step 1: Upload Files

1. Create 2 subdomains:
   - `shop.domain.com`
   - `store.domain.com`

2. Upload shop files to `shop.domain.com/htdocs/`
3. Upload store files to `store.domain.com/htdocs/`

### Step 2: Database Setup

1. Create MySQL database
2. Import `database/schema.sql`
3. Import `database/sample-data.sql` (optional, for demo data)

### Step 3: Configuration

1. Update database credentials in `config/db-config.php`:
```php
define('DB_HOST', 'your-host');
define('DB_USER', 'your-user');
define('DB_PASS', 'your-password');
define('DB_NAME', 'your-database');
```

2. Both shop and store use the same config file

### Step 4: Admin Setup

1. Login to admin panel: `store.domain.com`
2. Default credentials (change immediately):
   - Username: `admin`
   - Password: `admin@123`
3. Go to Settings and update:
   - Site name (default: Gadget50)
   - WhatsApp number
   - Logo
   - Colors
   - Delivery charge

### Step 5: Testing

1. Visit `shop.domain.com` on mobile & desktop
2. Add products to cart
3. Test checkout message on WhatsApp
4. Login to admin and test all features
5. Check IP blocking after 3 failed attempts

---

## ✅ SUCCESS CRITERIA

- ✅ Customer browses, adds to cart, fills address once, sends WhatsApp order with all details
- ✅ Admin logs in securely, manages products, offers, reviews, settings
- ✅ After 3 failed logins, IP + device blocked for 48 hours
- ✅ Everything works on InfinityFree
- ✅ Everything responsive on mobile devices
- ✅ Default site name: Gadget50 (changeable by admin)

---

## 📝 RULES FOR DEVELOPMENT

### DO NOT ❌
- Use any framework (no Laravel, CodeIgniter, React, Vue)
- Use Composer or npm
- Add online payment gateway
- Add customer accounts or customer login
- Expose SQL queries
- Store passwords in plain text

### DO ✅
- Share ONE database between shop and store
- Use prepared statements everywhere (prevent SQL injection)
- Hash passwords with bcrypt (`password_hash()`)
- Implement IP + device fingerprint blocking
- Make everything mobile-responsive
- Write clean code with English comments
- Use Bengali for all UI text
- Keep default site name: Gadget50
- Use proper error handling
- Validate all user inputs

---

## 🚀 DEPLOYMENT CHECKLIST

- [ ] Create subdomains on hosting
- [ ] Upload all files
- [ ] Create MySQL database
- [ ] Import database schema
- [ ] Update `config/db-config.php`
- [ ] Change default admin password
- [ ] Set WhatsApp business number in admin settings
- [ ] Configure HTTPS
- [ ] Test on mobile & desktop
- [ ] Check admin IP blocking feature
- [ ] Verify WhatsApp checkout messages
- [ ] Add sample products
- [ ] Test cart & checkout
- [ ] Review responsive design

---

## 📞 SUPPORT

For issues, questions, or contributions, please open an issue in this repository.

---

## 📄 LICENSE

This project is licensed under the **MIT License**. See the LICENSE file for details.

**Copyright © 2025 MAINUDDIN. All rights reserved.**

---

## 🌟 Features Summary

| Feature | Status |
|---------|--------|
| Public Store | ✅ |
| Product Management | ✅ |
| Shopping Cart (localStorage) | ✅ |
| WhatsApp Integration | ✅ |
| Admin Dashboard | ✅ |
| IP Blocking (48hr after 3 failed attempts) | ✅ |
| Review Moderation | ✅ |
| Discount & Offers | ✅ |
| Responsive Design | ✅ |
| Zero Framework Approach | ✅ |
| MySQL Database | ✅ |
| Bcrypt Password Hashing | ✅ |
| Session Management | ✅ |

---

**Created with ❤️ by MAINUDDIN**  
*Making e-commerce simple and WhatsApp-friendly.*

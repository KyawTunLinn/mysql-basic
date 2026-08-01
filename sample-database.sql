-- ============================================
-- MySQL Beginner Course — Sample Database
-- ============================================
-- This script creates a practice database called "shop"
-- Run this in MySQL to create tables and add sample data
-- ============================================

-- Create and use the database
CREATE DATABASE IF NOT EXISTS shop;
USE shop;

-- ============================================
-- Table 1: customers
-- ============================================
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Table 2: products
-- ============================================
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Table 3: orders
-- ============================================
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- ============================================
-- Table 4: order_items
-- ============================================
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ============================================
-- Insert Sample Data: Customers
-- ============================================
INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('John',   'Smith',       'john@email.com',      '555-0101', 'New York'),
('Sarah',  'Johnson',     'sarah@email.com',     '555-0102', 'Los Angeles'),
('Mike',   'Williams',    'mike@email.com',      '555-0103', 'Chicago'),
('Emily',  'Brown',       'emily@email.com',     '555-0104', 'Houston'),
('David',  'Davis',       'david@email.com',     '555-0105', 'Phoenix'),
('Lisa',   'Wilson',      'lisa@email.com',      '555-0106', 'Philadelphia'),
('James',  'Moore',       'james@email.com',     '555-0107', 'San Antonio'),
('Anna',   'Taylor',      'anna@email.com',      '555-0108', 'San Diego'),
('Tom',    'Anderson',    'tom@email.com',       '555-0109', 'Dallas'),
('Kate',   'Thomas',      'kate@email.com',      '555-0110', 'San Jose');

-- ============================================
-- Insert Sample Data: Products
-- ============================================
INSERT INTO products (name, description, price, stock, category) VALUES
('Laptop Pro 15"',     'High-performance laptop with 16GB RAM',           1299.99,  25,  'Electronics'),
('Wireless Mouse',     'Ergonomic wireless mouse with USB receiver',       29.99,   150, 'Electronics'),
('USB-C Hub',          '7-in-1 USB-C hub with HDMI and ethernet',          49.99,   80,  'Electronics'),
('Running Shoes',      'Lightweight running shoes for daily training',     89.99,   60,  'Sports'),
('Yoga Mat',           'Non-slip yoga mat, 6mm thick',                     24.99,   100, 'Sports'),
('Water Bottle',       'Stainless steel, keeps drinks cold 24 hours',      19.99,   200, 'Sports'),
('Novel - Mystery',    'Bestselling mystery thriller novel',               14.99,   75,  'Books'),
('Cookbook',           'Easy recipes for beginners',                       22.99,   50,  'Books'),
('Coffee Maker',       'Programmable coffee maker, 12-cup capacity',       79.99,   35,  'Home'),
('Desk Lamp',          'LED desk lamp with adjustable brightness',         34.99,   90,  'Home'),
('Backpack',           'Water-resistant backpack, fits 15" laptop',        59.99,   70,  'Accessories'),
('Sunglasses',         'UV protection polarized sunglasses',               39.99,   110, 'Accessories');

-- ============================================
-- Insert Sample Data: Orders
-- ============================================
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-01-15', 'delivered',  1329.98),
(2, '2025-01-18', 'delivered',   114.98),
(3, '2025-02-01', 'shipped',    1374.97),
(4, '2025-02-10', 'pending',      44.98),
(5, '2025-02-14', 'delivered',    94.98),
(1, '2025-03-01', 'shipped',     209.97),
(6, '2025-03-05', 'pending',      34.99),
(7, '2025-03-10', 'delivered',   139.98),
(8, '2025-03-15', 'processing',  104.98),
(9, '2025-03-20', 'pending',      59.99),
(10,'2025-03-22', 'delivered',   134.98),
(2, '2025-04-01', 'shipped',     899.94),
(3, '2025-04-05', 'pending',      24.99),
(4, '2025-04-10', 'delivered',   1379.98),
(5, '2025-04-15', 'processing',  119.97);

-- ============================================
-- Insert Sample Data: Order Items
-- ============================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
-- Order 1: John bought a Laptop + Mouse
(1, 1, 1, 1299.99),
(1, 2, 1,   29.99),
-- Order 2: Sarah bought Running Shoes + Water Bottle
(2, 4, 1,   89.99),
(2, 6, 1,   19.99),
-- Order 3: Mike bought Laptop + USB-C Hub + Yoga Mat
(3, 1, 1, 1299.99),
(3, 3, 1,   49.99),
(3, 5, 1,   24.99),
-- Order 4: Emily bought Novel + Cookbook
(4, 7, 1,   14.99),
(4, 8, 1,   22.99),
-- Order 5: David bought Coffee Maker + Desk Lamp
(5, 9, 1,   79.99),
(5, 10, 1,  34.99),
-- Order 6: John bought Sunglasses + Backpack + Mouse
(6, 12, 2,  39.99),
(6, 11, 1,  59.99),
(6, 2, 1,  29.99),
-- Order 7: Lisa bought Desk Lamp
(7, 10, 1,  34.99),
-- Order 8: James bought Running Shoes + Yoga Mat + Water Bottle
(8, 4, 1,   89.99),
(8, 5, 1,   24.99),
(8, 6, 1,   19.99),
-- Order 9: Anna bought Coffee Maker
(9, 9, 1,   79.99),
(9, 6, 1,   19.99),
-- Order 10: Tom bought Novel + Cookbook + Sunglasses
(10, 7, 1,  14.99),
(10, 8, 1,  22.99),
(10, 12, 1, 39.99),
-- Order 11: Kate bought Running Shoes + Coffee Maker
(11, 4, 1,  89.99),
(11, 9, 1,  79.99),
-- Order 12: Sarah bought 2x Laptops
(12, 1, 2, 1299.99),
(12, 2, 2,   29.99),
-- Order 13: Mike bought Yoga Mat
(13, 5, 1,   24.99),
-- Order 14: Emily bought Laptop + Sunglasses
(14, 1, 1, 1299.99),
(14, 12, 1,  39.99),
-- Order 15: David bought 3x Water Bottles + Backpack
(15, 6, 3,   19.99),
(15, 11, 1,  59.99);

-- ============================================
-- Done! Your shop database is ready.
-- Try these queries:
-- SELECT * FROM customers;
-- SELECT * FROM products;
-- SELECT * FROM orders;
-- SELECT * FROM order_items;
-- ============================================

# Sample Database (စမ်းသပ်ရန် ဒေတာဘေ့စ်)

ဤသင်ခန်းစာများတွင် လက်တွေ့ စမ်းသပ်လေ့ကျင့်ရန်အတွက် အသုံးပြုနိုင်သော **Sample Database SQL Script** ဖြစ်ပါတယ်။

---

##  အသုံးပြုနည်း (How to Use)

1. အောက်ပါ SQL ကုဒ်များကို ကူးယူပါ (Copy) သို့မဟုတ် `sample-database.sql` ဖိုင်ကို Download လုပ်ပါ။
2. **MySQL Workbench** သို့မဟုတ် **Terminal CLI** တွင် Run ပါ။

```sql
-- Create database if not exists
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

-- 1. Create customers table
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) DEFAULT 'Yangon',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 3. Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- Insert Sample Data into customers
INSERT INTO customers (first_name, last_name, email, city) VALUES
('U', 'Ba', 'uba@gmail.com', 'Yangon'),
('Daw', 'Hla', 'hla@gmail.com', 'Mandalay'),
('Aung', 'Kyaw', 'aungkyaw@gmail.com', 'Yangon'),
('Kyaw', 'Zin', 'kyawzin@gmail.com', 'Naypyitaw'),
('Mya', 'Mya', 'myamya@gmail.com', 'Mandalay');

-- Insert Sample Data into products
INSERT INTO products (name, category, price, stock_quantity) VALUES
('Laptop Pro 15', 'Electronics', 1299.00, 15),
('Wireless Mouse', 'Electronics', 25.50, 50),
('Mechanical Keyboard', 'Electronics', 89.00, 30),
('Coffee Mug', 'Accessories', 12.00, 100),
('USB-C Cable', 'Electronics', 15.00, 80);

-- Insert Sample Data into orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2026-07-01', 1324.50),
(2, '2026-07-05', 25.50),
(1, '2026-07-10', 89.00),
(3, '2026-07-15', 1299.00),
(4, '2026-07-20', 27.00);
```

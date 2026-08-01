# MySQL Quick Reference Cheat Sheet

A one-page guide for the most common MySQL commands. Keep this open while you practice!

---

## Connecting to MySQL

```bash
# Connect via command line
mysql -u root -p

# Connect to a specific database
mysql -u root -p shop

# Run a single command without entering interactive mode
mysql -u root -p -e "SHOW DATABASES;"

# Exit MySQL
EXIT;
# or
QUIT;
```

---

## Database Commands

```sql
-- Show all databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE my_database;

-- Use (switch to) a database
USE shop;

-- Delete a database
DROP DATABASE my_database;
```

---

## Table Commands

```sql
-- Show all tables in current database
SHOW TABLES;

-- Show table structure
DESCRIBE table_name;
-- or shorter:
DESC table_name;

-- Create a table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT
);

-- Delete a table
DROP TABLE table_name;

-- Rename a table
RENAME TABLE old_name TO new_name;

-- Add a column
ALTER TABLE students ADD phone VARCHAR(20);

-- Drop a column
ALTER TABLE students DROP COLUMN phone;
```

---

## INSERT — Adding Data

```sql
-- Insert one row
INSERT INTO customers (first_name, last_name, email)
VALUES ('John', 'Smith', 'john@email.com');

-- Insert multiple rows
INSERT INTO products (name, price, category) VALUES
('Laptop', 999.99, 'Electronics'),
('Mouse', 29.99, 'Electronics'),
('Desk', 199.99, 'Furniture');
```

---

## SELECT — Reading Data

```sql
-- Select all columns
SELECT * FROM customers;

-- Select specific columns
SELECT first_name, email FROM customers;

-- With alias (rename column in output)
SELECT first_name AS name, email AS contact FROM customers;

-- Remove duplicates
SELECT DISTINCT city FROM customers;

-- Count rows
SELECT COUNT(*) FROM customers;

-- Do calculations
SELECT name, price, price * 1.1 AS price_with_tax FROM products;

-- Combine text
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customers;
```

---

## WHERE — Filtering Data

```sql
-- Equal
SELECT * FROM products WHERE price = 29.99;

-- Greater / Less than
SELECT * FROM products WHERE price > 50;
SELECT * FROM products WHERE price <= 30;

-- Range
SELECT * FROM products WHERE price BETWEEN 20 AND 60;

-- List of values
SELECT * FROM customers WHERE city IN ('New York', 'Chicago', 'Houston');

-- Pattern matching (LIKE)
SELECT * FROM customers WHERE email LIKE 'j%';      -- starts with j
SELECT * FROM products WHERE name LIKE '%Pro%';      -- contains Pro
SELECT * FROM customers WHERE city LIKE '%as';       -- ends with as

-- Conditions
SELECT * FROM products WHERE price > 20 AND category = 'Electronics';
SELECT * FROM products WHERE category = 'Books' OR category = 'Sports';

-- NULL check
SELECT * FROM customers WHERE phone IS NULL;
SELECT * FROM customers WHERE phone IS NOT NULL;
```

---

## ORDER BY and LIMIT

```sql
-- Sort ascending (A-Z, small to large)
SELECT * FROM products ORDER BY price ASC;

-- Sort descending (Z-A, large to small)
SELECT * FROM products ORDER BY price DESC;

-- Sort by multiple columns
SELECT * FROM customers ORDER BY city, last_name;

-- Limit results
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- Skip + limit (pagination)
SELECT * FROM products LIMIT 10 OFFSET 20;
-- or: LIMIT 20, 10
```

---

## UPDATE — Changing Data

```sql
-- Update one row
UPDATE customers SET email = 'new@email.com' WHERE id = 1;

-- Update multiple columns
UPDATE customers SET phone = '555-0000', city = 'Boston' WHERE id = 1;

-- Update using calculation
UPDATE products SET price = price * 1.10;

-- ⚠️ Always use WHERE! Without it, ALL rows are updated!
```

---

## DELETE — Removing Data

```sql
-- Delete specific rows
DELETE FROM customers WHERE id = 1;

-- Delete based on condition
DELETE FROM order_items WHERE quantity < 2;

-- ⚠️ Always use WHERE! Without it, ALL rows are deleted!
```

---

## JOINs — Combining Tables

```sql
-- INNER JOIN (only matching rows)
SELECT o.id, c.first_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

-- LEFT JOIN (all from left + matches)
SELECT c.first_name, o.id
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- Join three tables
SELECT c.first_name, p.name, oi.quantity
FROM order_items oi
INNER JOIN orders o ON oi.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON oi.product_id = p.id;
```

---

## Aggregations — Summarizing Data

```sql
-- Count
SELECT COUNT(*) FROM orders;

-- Sum
SELECT SUM(total_amount) FROM orders;

-- Average
SELECT AVG(total_amount) FROM orders;

-- Min / Max
SELECT MIN(price), MAX(price) FROM products;

-- Group by
SELECT category, COUNT(*) AS count
FROM products
GROUP BY category;

-- Filter groups
SELECT category, COUNT(*) AS count
FROM products
GROUP BY category
HAVING COUNT(*) > 2;

-- Combined
SELECT c.first_name, COUNT(o.id) AS orders, SUM(o.total_amount) AS total
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name
ORDER BY total DESC;
```

---

## Backup and Restore

```bash
# Backup a database
mysqldump -u root -p shop > shop-backup.sql

# Backup all databases
mysqldump -u root -p --all-databases > all-backup.sql

# Restore a database
mysql -u root -p shop < shop-backup.sql

# Restore into a new database
mysql -u root -p -e "CREATE DATABASE shop_new;"
mysql -u root -p shop_new < shop-backup.sql

# Run a SQL file inside MySQL
SOURCE /path/to/file.sql;
```

---

## Useful Functions

```sql
-- Text functions
CONCAT(first_name, ' ', last_name)          -- Join text
LOWER(email)                                  -- Convert to lowercase
UPPER(name)                                   -- Convert to uppercase
LENGTH(city)                                  -- Count characters
SUBSTRING(name, 1, 3)                        -- Extract part of text

-- Date functions
NOW()                                         -- Current date and time
CURDATE()                                     -- Current date
DATE_FORMAT(order_date, '%Y-%m')             -- Format: 2025-01
YEAR(created_at)                              -- Extract year
DATEDIFF(end_date, start_date)               -- Days between dates

-- Math functions
ROUND(price, 2)                               -- Round to 2 decimals
CEIL(price)                                    -- Round up
FLOOR(price)                                   -- Round down
ABS(-10)                                       -- Absolute value

-- Conditional
IF(status = 'active', 'Yes', 'No')           -- If/else in SQL
COALESCE(phone, 'N/A')                       -- Use 'N/A' if phone is NULL
```

---

## Common Mistakes to Avoid

| Mistake | Fix |
|---------|-----|
| Forgetting `;` at end of query | Always add semicolon |
| Forgetting `WHERE` in UPDATE/DELETE | Always test with SELECT first |
| Using `= NULL` instead of `IS NULL` | Use `IS NULL` or `IS NOT NULL` |
| Mixing up WHERE and HAVING | WHERE filters rows, HAVING filters groups |
| Not quoting text values | Use single quotes: `'text'` |
| Wrong date format | Use YYYY-MM-DD: `'2025-01-15'` |

---

## Keyboard Shortcuts

| Shortcut | Workbench | Command Line |
|----------|-----------|--------------|
| Run query | `Ctrl + Enter` | Press Enter (after `;`) |
| Save file | `Ctrl + S` | — |
| Open file | `Ctrl + O` | `SOURCE file.sql;` |
| Autocomplete | `Ctrl + Space` | `Tab` |
| Comment line | `Ctrl + /` | — |
| Previous command | — | `↑` arrow |

# Lesson 13 — Aggregations and GROUP BY

In this lesson, you will learn how to summarize data using counting, summing, averaging, and grouping.

**Prerequisites:** JOINs (Lesson 12), basic SELECT queries

---

## Aggregate Functions

These functions combine multiple rows into a single result:

| Function | What It Does | Example |
|----------|-------------|---------|
| `COUNT()` | Count rows | `COUNT(*)` = total rows |
| `SUM()` | Add up values | `SUM(price)` = total of all prices |
| `AVG()` | Calculate average | `AVG(price)` = average price |
| `MIN()` | Find smallest value | `MIN(price)` = cheapest product |
| `MAX()` | Find largest value | `MAX(price)` = most expensive product |

---

## Step 1: Basic Counting

How many customers do we have?

```sql
SELECT COUNT(*) AS total_customers FROM customers;
```

How many products in each category?

```sql
SELECT category, COUNT(*) AS product_count 
FROM products 
GROUP BY category;
```

Output:

| category | product_count |
|----------|--------------|
| Electronics | 3 |
| Sports | 3 |
| Books | 2 |
| Home | 2 |
| Accessories | 2 |

---

## Step 2: GROUP BY Explained

`GROUP BY` groups rows that have the same value together. Think of it like putting items into buckets:

```
Products by Category:
├─ Electronics (3 items)
├─ Sports (3 items)
├─ Books (2 items)
├─ Home (2 items)
└─ Accessories (2 items)
```

### Format

```sql
SELECT column, COUNT(*)
FROM table_name
GROUP BY column;
```

### Examples

Count orders per customer:

```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;
```

Count orders per status:

```sql
SELECT status, COUNT(*) AS count
FROM orders
GROUP BY status;
```

---

## Step 3: SUM — Adding Values

Total revenue from all orders:

```sql
SELECT SUM(total_amount) AS total_revenue FROM orders;
```

Revenue per customer:

```sql
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;
```

---

## Step 4: AVG — Finding Averages

Average order amount:

```sql
SELECT AVG(total_amount) AS average_order FROM orders;
```

Average price by category:

```sql
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category;
```

Note: `ROUND(number, 2)` rounds to 2 decimal places.

---

## Step 5: MIN and MAX

Cheapest and most expensive products:

```sql
SELECT MIN(price) AS cheapest, MAX(price) AS most_expensive FROM products;
```

Cheapest product in each category:

```sql
SELECT category, MIN(price) AS cheapest_price
FROM products
GROUP BY category;
```

---

## Step 6: HAVING — Filter Groups

`WHERE` filters individual rows. `HAVING` filters groups AFTER they are grouped.

Find categories with more than 2 products:

```sql
SELECT category, COUNT(*) AS count
FROM products
GROUP BY category
HAVING COUNT(*) > 2;
```

⚠️ You cannot use `WHERE` for aggregate conditions. Always use `HAVING`.

Wrong:
```sql
-- This does NOT work!
SELECT category, COUNT(*) FROM products
WHERE COUNT(*) > 2
GROUP BY category;
```

Right:
```sql
-- Use HAVING instead
SELECT category, COUNT(*) FROM products
GROUP BY category
HAVING COUNT(*) > 2;
```

---

## Step 7: Putting It All Together

Complete sales summary:

```sql
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.id) AS number_of_orders,
    SUM(o.total_amount) AS total_spent,
    ROUND(AVG(o.total_amount), 2) AS average_order,
    MIN(o.order_date) AS first_order,
    MAX(o.order_date) AS last_order
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;
```

This shows one row per customer with their full shopping history summarized.

---

## Exercise

Using the `shop` database:

1. Count total number of orders
2. Find the average order amount
3. Show total revenue per customer (name + total spent)
4. Show how many orders are in each status (pending, shipped, delivered...)
5. Find categories where the average product price is above $50
6. Find customers who have placed more than 2 orders
7. Show the cheapest and most expensive product in each category

---

## Quick Reference

| Function | Purpose |
|----------|---------|
| `COUNT(*)` | Count rows |
| `SUM(col)` | Add up values |
| `AVG(col)` | Calculate average |
| `MIN(col)` | Find smallest value |
| `MAX(col)` | Find largest value |
| `GROUP BY col` | Group rows by column value |
| `HAVING condition` | Filter groups (after GROUP BY) |
| `ROUND(num, 2)` | Round to 2 decimal places |

---

## Next Step

Your final lesson: how to back up and restore your database.

→ [Lesson 14: Backup and Restore](14-backup-restore.md)

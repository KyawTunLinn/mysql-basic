# Lesson 12 — JOINs Made Simple

JOINs combine data from two or more tables. This is one of the most powerful features of databases.

**Prerequisites:** Filtering and sorting (Lessons 10–11), understanding of primary/foreign keys (Lesson 6)

---

## What Is a JOIN?

A JOIN combines data from two or more tables into one result. Think of it like this:

You have a list of **orders**, and each order has a `customer_id`. But the customer's name is stored in the **customers** table, not in orders. A JOIN connects these two tables so you can see the order details together with the customer's name.

Here is a simple example using the shop database tables:

**customers table:**
| id | first_name | last_name |
|----|------------|-----------|
| 1 | John | Smith |
| 2 | Sarah | Johnson |

**orders table:**
| id | customer_id | order_date | total_amount |
|----|-------------|------------|--------------|
| 101 | 1 | 2025-01-15 | 1329.98 |
| 102 | 2 | 2025-01-18 | 114.98 |

A JOIN on `customer_id` connects them:

| order_id | first_name | last_name | total_amount |
|----------|------------|-----------|--------------|
| 101 | John | Smith | 1329.98 |
| 102 | Sarah | Johnson | 114.98 |

---

## The INNER JOIN (Most Common)

Shows only rows that have matching data in BOTH tables.

### Format

```sql
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column;
```

### Example

Show each order with the customer's name:

```sql
SELECT orders.id AS order_id, 
       customers.first_name, 
       customers.last_name,
       orders.order_date,
       orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;
```

This matches each order to its customer using: `orders.customer_id = customers.id`

### Understanding Table Aliases

Instead of writing long table names, use short aliases:

```sql
SELECT o.id, c.first_name, c.last_name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;
```

- `orders o` means "orders, and I will call it o"
- `customers c` means "customers, and I will call it c"

Much cleaner!

---

## Visual Explanation of JOIN Types

```
Table A          Table B
+---+---+        +---+---+
| 1 | A |        | 1 | X |
| 2 | B |   JOIN | 2 | Y |
| 3 | C |        | 4 | Z |
+---+---+        +---+---+

INNER JOIN →    LEFT JOIN →     RIGHT JOIN →
+---+---+       +---+---+       +---+---+
| 1 | AX|       | 1 | AX|       | 1 | AX|
| 2 | BY|       | 2 | BY|       | 2 | BY|
+---+---+       | 3 | C-|       | 4 |-Z |
                +---+---+       +---+---+
(Matches only)  (All A + matches) (All B + matches)
```

---

## LEFT JOIN — All From Left Table

Shows ALL rows from the left table, even if there is no match in the right table. Unmatched rows show NULL.

### Example

Show all customers, including those who have NOT placed any orders:

```sql
SELECT c.first_name, c.last_name, o.id AS order_id
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;
```

Customers without orders will show `NULL` in the `order_id` column.

---

## Finding "Orphaned" Records

Use LEFT JOIN to find records that have no match:

```sql
-- Customers who have NOT placed any orders
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
```

---

## JOINing Three Tables

You can chain multiple JOINs:

Show order details with customer name and product name:

```sql
SELECT o.id AS order_id,
       c.first_name,
       p.name AS product_name,
       oi.quantity,
       oi.unit_price,
       oi.quantity * oi.unit_price AS line_total
FROM order_items oi
INNER JOIN orders o ON oi.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON oi.product_id = p.id;
```

This connects: order_items → orders → customers → products

---

## Practical Examples

### Example 1: Order Summary

Show each order with customer name and status:

```sql
SELECT o.id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       o.order_date, 
       o.status, 
       o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;
```

### Example 2: What Did Each Customer Buy?

```sql
SELECT c.first_name, c.last_name, p.name AS product, oi.quantity
FROM order_items oi
INNER JOIN orders o ON oi.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON oi.product_id = p.id
ORDER BY c.last_name, p.name;
```

### Example 3: Total Spent Per Customer

```sql
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;
```

We cover GROUP BY in the next lesson. For now, just see how JOIN works!

---

## Exercise

Using the `shop` database:

1. Show all orders with customer first names (use INNER JOIN)
2. Show all customers and their order IDs (use LEFT JOIN — some may be NULL)
3. Find customers who have never placed an order (LEFT JOIN + WHERE IS NULL)
4. Show order items with both customer name AND product name (join 3 tables)
5. List all products that have NEVER been ordered

---

## Quick Reference

| JOIN Type | What It Shows |
|-----------|--------------|
| `INNER JOIN` | Only matching rows from both tables |
| `LEFT JOIN` | All rows from left table + matching rows from right |
| `RIGHT JOIN` | All rows from right table + matching rows from left |
| `ON` | Specifies which columns connect the tables |

---

## Next Step

Now let's learn how to summarize and count your joined data.

→ [Lesson 13: Aggregations and GROUP BY](13-aggregations.md)

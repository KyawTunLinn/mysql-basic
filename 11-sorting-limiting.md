# Lesson 11 — Sorting and Limiting Results

In this lesson, you will learn how to order your results and show only a specific number of rows.

**Prerequisites:** Filtering with WHERE (Lesson 10)

---

## ORDER BY — Sort Your Results

### Basic Format

```sql
SELECT * FROM table_name
ORDER BY column_name ASC;   -- ASC = ascending (default)
ORDER BY column_name DESC;  -- DESC = descending
```

### Example: Sort by Price

Cheapest products first:

```sql
SELECT name, price FROM products ORDER BY price ASC;
```

Most expensive first:

```sql
SELECT name, price FROM products ORDER BY price DESC;
```

### Example: Sort by Name

Customers sorted alphabetically:

```sql
SELECT first_name, last_name FROM customers ORDER BY last_name ASC;
```

### Example: Sort by Multiple Columns

Sort by city first, then by first name within each city:

```sql
SELECT first_name, city FROM customers 
ORDER BY city ASC, first_name ASC;
```

---

## LIMIT — Show Fewer Rows

### Basic Format

```sql
SELECT * FROM table_name
LIMIT number;
```

### Examples

Show only the top 3 most expensive products:

```sql
SELECT name, price FROM products 
ORDER BY price DESC 
LIMIT 3;
```

Show the first 5 customers:

```sql
SELECT * FROM customers LIMIT 5;
```

Show rows 6 to 10 (skip first 5, show next 5):

```sql
SELECT * FROM customers LIMIT 5 OFFSET 5;
```

Or shorter syntax:

```sql
SELECT * FROM customers LIMIT 5, 5;
```

(first number = skip, second number = show)

---

## Combining WHERE, ORDER BY, and LIMIT

You can use all three together! The order matters:

```sql
SELECT name, price FROM products 
WHERE price > 20
ORDER BY price DESC 
LIMIT 5;
```

This means:
1. **WHERE**: Filter to products over $20
2. **ORDER BY**: Sort from most expensive
3. **LIMIT**: Show only top 5

The result: The 5 most expensive products that cost more than $20.

---

## Common Patterns

| What You Want | Query |
|---------------|-------|
| Newest records first | `ORDER BY created_at DESC LIMIT 10` |
| Most expensive item | `ORDER BY price DESC LIMIT 1` |
| Cheapest 5 items | `ORDER BY price ASC LIMIT 5` |
| Alphabetical list | `ORDER BY name ASC` |
| Last 10 orders | `ORDER BY order_date DESC LIMIT 10` |

---

## Exercise

Using the `shop` database:

1. Show the 3 cheapest products
2. Show the 5 most expensive products with their categories
3. Show customers sorted by last name (A-Z)
4. Show pending orders sorted by date (newest first), limit to 5
5. Find the top 3 customers who spent the most (join orders later in Lesson 12)

---

## Quick Reference

| Keyword | Purpose |
|---------|---------|
| `ORDER BY col ASC` | Sort ascending (A-Z, small to large) |
| `ORDER BY col DESC` | Sort descending (Z-A, large to small) |
| `LIMIT 5` | Show only 5 rows |
| `LIMIT 5 OFFSET 10` | Skip 10 rows, then show 5 |

---

## Next Step

Now let's combine data from multiple tables using JOINs.

→ [Lesson 12: JOINs Made Simple](12-joins.md)

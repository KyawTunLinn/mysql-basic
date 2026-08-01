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

```
┌─────────────── ORDER BY SORTING ─────────────┐
│                                              │
│  Like arranging books on a shelf:            │
│                                              │
│  Unsorted:           ASC (A→Z):              │
│  ┌────────────────┐   ┌────────────────┐    │
│  │ 📕 Laptop      │   │ 📘 Cap         │    │
│  │ 📘 Jeans       │ → │ 📘 Jeans       │    │
│  │ 📗 Cap         │   │ 📕 Sneakers    │    │
│  │ 📙 Sneakers    │   │ 📗 T-Shirt     │    │
│  │ 📗 T-Shirt     │   │ 🔴 Winter Jkt  │    │
│  └────────────────┘   └────────────────┘    │
│                                              │
│                    DESC (Z→A):               │
│  ┌────────────────┐                           │
│  │ 🔴 Winter Jkt  │ ← most expensive first   │
│  │ 📕 Sneakers    │                          │
│  │ 📘 Jeans       │                          │
│  │ 📗 T-Shirt     │                          │
│  │ 📘 Cap         │ ← cheapest last          │
│  └────────────────┘                           │
│                                              │
│  Numbers sort same way:                      │
│  5, 10, 3 → ASC: 3, 5, 10                    │
│  5, 10, 3 → DESC: 10, 5, 3                   │
└──────────────────────────────────────────────┘
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

```
┌─────────────── LIMIT — Take Top N ───────────┐
│                                              │
│  Show only a few rows from many:             │
│                                              │
│  All products (sorted by price DESC):        │
│  ┌────────────────────────────────────┐      │
│  │ 1. Laptop Pro    $1299.99          │      │
│  │ 2. Smart Watch   $399.99           │      │
│  │ 3. Headphones    $149.99     ◀─┐   │      │
│  │ 4. Mouse         $29.99      │  │   │      │
│  │ 5. Keyboard        $79.99    │  │   │      │
│  │ 6. Phone Case      $19.99    │  │   │      │
│  │ 7. USB Cable       $9.99     │  │   │      │
│  │ 8. Screen Protector  $5.99   │  │   │      │
│  └────────────────────────────────────┘  │  │   │      │
│                              LIMIT 3     │  │   │      │
│                               takes top 3│  │   │      │
│                                          ▼  ▼   ▼      │
│  Result:                                   ┌──────────┐ │
│  ┌────────────────┐                         │ Laptop   │ │
│  │ 1. Laptop Pro  │                         │ Smart W. │ │
│  │ 2. Smart Watch │                         │ Headph.  │ │
│  │ 3. Headphones  │                         └──────────┘ │
│  └────────────────┘                                    │
└────────────────────────────────────────────────────────┘
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

```
┌─────────── OFFSET — Skip Then Take ──────────┐
│                                              │
│  Pagination: skip N rows, then take M rows   │
│                                              │
│  All customers (sorted alphabetically):      │
│  ┌──────────────────────────────────────┐    │
│  │ 1. Alice        ◄── SKIP THESE     │    │
│  │ 2. Bob          ◄── OFFSET 5       │    │
│  │ 3. Charlie      ◄── (skip first 5) │    │
│  │ 4. Diana        ◄                  │    │
│  │ 5. Edward       ◄                  │    │
│  │ 6. Fiona        ◄── TAKE THESE     │    │
│  │ 7. George       ◄── LIMIT 5        │    │
│  │ 8. Hannah       ◄                  │    │
│  │ 9. Ivan         ◄                  │    │
│  │10. Julia        ◄                  │    │
│  │11. Karen        ◄                  │    │
│  └──────────────────────────────────────┘    │
│                                              │
│  Page 1: LIMIT 5 OFFSET 0  → rows 1-5        │
│  Page 2: LIMIT 5 OFFSET 5  → rows 6-10       │
│  Page 3: LIMIT 5 OFFSET 10 → rows 11-15      │
│                                              │
│  Common pattern for web pagination:          │
│  page = (pageNumber - 1) * limit             │
│  SELECT ... LIMIT 10 OFFSET 0   -- page 1    │
│  SELECT ... LIMIT 10 OFFSET 10  -- page 2    │
└──────────────────────────────────────────────┘
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

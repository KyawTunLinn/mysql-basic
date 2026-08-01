# Lesson 8 — Reading Data with SELECT

In this lesson, you will master the SELECT statement — the most important SQL command for reading data.

**Prerequisites:** Tables with data (Lessons 6–7), can connect via Workbench or command line

---

## The SELECT Statement

`SELECT` is how you ask MySQL questions about your data. It is like searching in a spreadsheet.

### Basic Format

```sql
SELECT columns FROM table;
```

---

## Step 1: Select All Columns

```sql
SELECT * FROM customers;
```

The `*` means "all columns." This shows every column and every row.

⚠️ **Tip:** In real work, avoid using `*`. Always specify only the columns you need. It is faster and cleaner.

---

## Step 2: Select Specific Columns

```sql
SELECT first_name, last_name, email FROM customers;
```

Output:

| first_name | last_name | email |
|------------|-----------|-------|
| John | Smith | john@email.com |
| Sarah | Johnson | sarah@email.com |
| ... | ... | ... |

---

## Step 3: Give Columns Nicknames (Aliases)

You can rename columns in your results using `AS`:

```sql
SELECT first_name AS name, email AS contact FROM customers;
```

Output:

| name | contact |
|------|---------|
| John | john@email.com |
| Sarah | sarah@email.com |

This makes the output easier to read.

---

## Step 4: Do Calculations in Your Query

You can perform math directly in your SELECT:

```sql
SELECT name, price, stock, price * stock AS total_value FROM products;
```

This adds a new calculated column called `total_value` that multiplies price by stock.

Output:

| name | price | stock | total_value |
|------|-------|-------|-------------|
| Laptop Pro 15" | 1299.99 | 25 | 32499.75 |
| Wireless Mouse | 29.99 | 150 | 4498.50 |
| ... | ... | ... | ... |

Other calculations:

```sql
-- Add tax
SELECT name, price, price * 1.1 AS price_with_tax FROM products;

-- Calculate order value
SELECT quantity, unit_price, quantity * unit_price AS line_total FROM order_items;
```

---

## Step 5: Combine Text

Use `CONCAT()` to join text from multiple columns:

```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name, city FROM customers;
```

Output:

| full_name | city |
|-----------|------|
| John Smith | New York |
| Sarah Johnson | Los Angeles |

---

## Step 6: Remove Duplicates with DISTINCT

If some values repeat, use `DISTINCT` to show only unique values:

```sql
SELECT DISTINCT city FROM customers;
```

Output (only unique cities):

| city |
|------|
| New York |
| Los Angeles |
| Chicago |
| Houston |
| Phoenix |
| Philadelphia |
| San Antonio |
| San Diego |
| Dallas |
| San Jose |

Another example:

```sql
SELECT DISTINCT category FROM products;
```

---

## Step 7: Check How Many Rows Exist

```sql
SELECT COUNT(*) FROM customers;
```

This returns: `10` (the total number of customers).

Count with conditions:

```sql
SELECT COUNT(*) FROM products WHERE category = 'Electronics';
```

---

## Step 8: Working with NULL Values

NULL means "no value" or "empty." Some columns might be NULL.

To find rows with NULL values:

```sql
SELECT * FROM customers WHERE phone IS NULL;
```

To find rows that have a value:

```sql
SELECT * FROM customers WHERE phone IS NOT NULL;
```

⚠️ You cannot use `= NULL` or `!= NULL`. Always use `IS NULL` or `IS NOT NULL`.

---

## Exercise

Using the `shop` database:

1. Show all product names and prices
2. Show customer full names (first + last combined)
3. Show product names with a 10% discount: `name, price, price * 0.9 AS discounted_price`
4. List all unique categories in products
5. Count how many products are in the "Electronics" category
6. Show all customers who do not have a phone number (phone IS NULL)

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `SELECT * FROM table` | Get all columns and rows |
| `SELECT col1, col2 FROM table` | Get specific columns |
| `SELECT col AS nickname` | Rename a column in results |
| `SELECT DISTINCT col` | Get unique values only |
| `SELECT COUNT(*) FROM table` | Count total rows |
| `col1 * col2 AS result` | Do calculations |
| `CONCAT(a, b)` | Join text together |
| `IS NULL` / `IS NOT NULL` | Check for empty values |

---

## Next Step

You can read data. Now let's learn how to change and remove it.

→ [Lesson 9: Updating and Deleting](09-update-delete.md)

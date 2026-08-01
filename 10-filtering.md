# Lesson 10 — Filtering Data (WHERE Clause)

In this lesson, you will learn how to find specific data using the WHERE clause. This is one of the most useful skills in SQL.

**Prerequisites:** Basic SELECT queries (Lessons 5, 8)

---

## The WHERE Clause

The `WHERE` clause filters your results. It says: "Only show me rows that match this condition."

```
┌─────────── WHERE CLAUSE AS A FILTER ────────┐
│                                             │
│   All Rows              Filter (WHERE)      │
│   go in here          checks each row       │
│                                             │
│  ┌──────────┐     ┌──────────────┐    ┌───┐│
│  │ id=1 TRUE│────▶│ 1 > 5? NO ✘ │───▶│   ││
│  │ id=2 TRUE│────▶│ 2 > 5? NO ✘ │───▶│   ││
│  │ id=3 TRUE│────▶│ 3 > 5? NO ✘ │───▶│   ││
│  │ id=4 TRUE│────▶│ 4 > 5? NO ✘ │───▶│   ││
│  │ id=5 TRUE│────▶│ 5 > 5? NO ✘ │───▶│   ││
│  │ id=6 TRUE│────▶│ 6 > 5? YES✔ │───▶│ ✔ ││ ← passes through
│  │ id=7 TRUE│────▶│ 7 > 5? YES✔ │───▶│ ✔ ││ ← passes through
│  │ id=8 TRUE│────▶│ 8 > 5? YES✔ │───▶│ ✔ ││ ← passes through
│  │ id=9 TRUE│────▶│ 9 > 5? YES✔ │───▶│ ✔ ││ ← passes through
│  │ id=10TRUE│────▶│10 > 5? YES✔ │───▶│ ✔ ││ ← passes through
│  └──────────┘     └──────────────┘    └───┘│
│                                             │
│  Result: only matching rows come out!        │
│  ┌──────────┐                               │
│  │ id=6     │                               │
│  │ id=7     │                               │
│  │ id=8     │                               │
│  │ id=9     │                               │
│  │ id=10    │                               │
│  └──────────┘                               │
└─────────────────────────────────────────────┘
```

### Basic Format

```sql
SELECT * FROM table_name
WHERE condition;
```

---

## Step 1: Simple Equality (=)

Find customers named John:

```sql
SELECT * FROM customers WHERE first_name = 'John';
```

Find products priced at exactly $29.99:

```sql
SELECT * FROM products WHERE price = 29.99;
```

---

## Step 2: Greater Than and Less Than

Find expensive products (over $50):

```sql
SELECT name, price FROM products WHERE price > 50;
```

Find cheap products ($30 or less):

```sql
SELECT name, price FROM products WHERE price <= 30;
```

Other comparison operators:

| Operator | Meaning | Example |
|----------|---------|---------|
| `=` | Equal to | `WHERE price = 29.99` |
| `>` | Greater than | `WHERE price > 50` |
| `<` | Less than | `WHERE age < 18` |
| `>=` | Greater than or equal | `WHERE stock >= 10` |
| `<=` | Less than or equal | `WHERE price <= 20` |
| `!=` or `<>` | Not equal | `WHERE status != 'cancelled'` |

---

## Step 3: Multiple Conditions with AND

Show products that cost between $20 and $60:

```sql
SELECT name, price FROM products 
WHERE price > 20 AND price < 60;
```

Both conditions must be true.

Example with customers:

```sql
SELECT first_name, city FROM customers 
WHERE city = 'New York' AND first_name = 'John';
```

---

## Step 4: Multiple Options with OR

Show customers from New York OR Los Angeles:

```sql
SELECT first_name, city FROM customers 
WHERE city = 'New York' OR city = 'Los Angeles';
```

Either condition can be true.

---

## Step 5: Combine AND and OR

Be careful! Use parentheses to group conditions:

```sql
-- Products over $50 OR from Electronics category
SELECT name, price, category FROM products 
WHERE price > 50 OR category = 'Electronics';

-- Products in Clothing that cost between $15 and $60
SELECT name, price FROM products 
WHERE category = 'Clothing' AND price BETWEEN 15 AND 60;
```

⚠️ **Rule:** AND is evaluated before OR. Always use parentheses `()` to be clear!

---

## Step 6: The BETWEEN Operator

Find values within a range:

```sql
-- Products priced between $20 and $50
SELECT name, price FROM products 
WHERE price BETWEEN 20 AND 50;
```

This is the same as:

```sql
WHERE price >= 20 AND price <= 50
```

For dates:

```sql
-- Orders placed in February 2025
SELECT * FROM orders 
WHERE order_date BETWEEN '2025-02-01' AND '2025-02-28';
```

---

## Step 7: The IN Operator

Match any value in a list:

```sql
-- Customers from specific cities
SELECT first_name, city FROM customers 
WHERE city IN ('New York', 'Chicago', 'Houston');
```

This is shorter than:

```sql
WHERE city = 'New York' OR city = 'Chicago' OR city = 'Houston'
```

---

## Step 8: The LIKE Operator (Pattern Matching)

Search for text patterns using `%` (matches any characters):

```sql
-- Customers whose email starts with "j"
SELECT first_name, email FROM customers 
WHERE email LIKE 'j%';

-- Customers whose city ends with "as"
SELECT first_name, city FROM customers 
WHERE city LIKE '%as';

-- Products with "Pro" anywhere in the name
SELECT name FROM products WHERE name LIKE '%Pro%';

-- Emails ending with "@email.com"
SELECT email FROM customers WHERE email LIKE '%@email.com';
```

| Pattern | Matches |
|---------|---------|
| `'J%'` | Starts with J (John, Jane) |
| `'%n'` | Ends with n (John, Brian) |
| `'%er%'` | Contains "er" anywhere |
| `'_ohn'` | 4 letters ending in "ohn" (John) |
| `'%@gmail.com'` | Gmail addresses |

```
┌─────────── LIKE PATTERN MATCHING ────────────┐
│                                              │
│  % = matches ANY number of characters        │
│  _ = matches EXACTLY ONE character           │
│                                              │
│  'J%'                                          │
│  ┌───────┐                                     │
│  │ J ___ │ ← starts with J, anything after    │
│  └───────┘   John, Jane, Jessica              │
│                                              │
│  '%as'                                         │
│  ┌───────┐                                     │
│  │ ___ as│ ← ends with "as", anything before  │
│  └───────┘   Dallas, Las Vegas                │
│                                              │
│  '%Pro%'                                       │
│  ┌───────┐                                     │
│  │ _Pro_ │ ← contains "Pro" anywhere          │
│  └───────┘   Laptop Pro, Pro Tool, Pro Max    │
│                                              │
│  '_ohn'                                        │
│  ┌───────┐                                     │
│  │ ? o h n │ ← exactly 4 chars, ends in ohn   │
│  └───────┘   John, John (not Johnson!)        │
│                                              │
│  '%@email.com'                                 │
│  ┌────────────┐                                │
│  │ _____@...  │ ← any email ending with ...    │
│  └────────────┘   a@email.com, hello@email.com│
└──────────────────────────────────────────────┘
```

---

## Step 9: Handling NULL Values

Some columns might be empty (NULL). To check for NULL:

```sql
-- Customers without a phone number
SELECT first_name, last_name FROM customers 
WHERE phone IS NULL;

-- Customers WITH a phone number
SELECT first_name, phone FROM customers 
WHERE phone IS NOT NULL;
```

---

## Exercise

Using the `shop` database:

1. Find all products cheaper than $30
2. Find all products between $20 and $60
3. Find customers from New York OR Los Angeles
4. Find products in "Electronics" OR "Sports" category
5. Find orders with status 'pending' OR 'processing'
6. Find product names containing the word "Pro"
7. Find customers whose first name starts with "S"
8. Find orders placed in March 2025 using BETWEEN

---

## Quick Reference

| Keyword | Purpose | Example |
|---------|---------|---------|
| `WHERE col = val` | Exact match | `WHERE city = 'NYC'` |
| `WHERE col > val` | Comparison | `WHERE price > 50` |
| `WHERE col BETWEEN a AND b` | Range | `WHERE price BETWEEN 10 AND 50` |
| `WHERE col IN (a, b)` | List of values | `WHERE city IN ('NYC', 'LA')` |
| `WHERE col LIKE '%text%'` | Pattern search | `WHERE name LIKE '%Pro%'` |
| `AND` | Both conditions true | `WHERE a = 1 AND b = 2` |
| `OR` | Either condition true | `WHERE a = 1 OR b = 2` |
| `IS NULL` | Check for empty | `WHERE phone IS NULL` |

---

## Next Step

You can filter data. Now let's learn how to sort and limit the results.

→ [Lesson 11: Sorting and Limiting](11-sorting-limiting.md)

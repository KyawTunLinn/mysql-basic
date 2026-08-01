# Lesson 5 — Your First Queries

In this lesson, you will run your first real SQL queries. We will use the sample database that helps you practice.

**Estimated time: 20 minutes**

**Prerequisites:** MySQL Server installed (Lesson 2), Workbench OR command line working (Lessons 3–4)

---

## Step 1: Load the Sample Database

First, create and fill the practice database.

### Using Command Line:

```bash
mysql -u root -p < sample-database.sql
```

Or inside MySQL:

```sql
SOURCE /full/path/to/sample-database.sql;
```
(Replace `/full/path/to/` with the actual path on your computer)

### Using Workbench:

1. Open Workbench and connect to your server
2. Click **File → Open SQL Script**
3. Select `sample-database.sql`
4. Click the **lightning bolt** icon (⚡) or press `Ctrl + Enter`
5. Wait for "0 rows affected" messages — this means it worked!

---

## Step 2: Choose Your Database

After loading the sample data, tell MySQL which database to use:

```sql
USE shop;
```

You should see: `Database changed`

Now all your commands will work on the `shop` database.

---

## Step 3: See What Databases You Have

```sql
SHOW DATABASES;
```

You will see a list including `shop`, `mysql`, `performance_schema`, etc.

---

## Step 4: See What Tables Exist

```sql
SHOW TABLES;
```

You should see:
```
+----------------+
| Tables_in_shop |
+----------------+
| customers      |
| order_items    |
| orders         |
| products       |
+----------------+
```

The `shop` database has 4 tables:
- **customers** — information about people who buy things
- **products** — items available for sale
- **orders** — records of purchases
- **order_items** — what products are in each order

### How the Tables Connect

```
┌──────────────┐       ┌──────────────┐
│  customers   │       │   products   │
│──────────────│       │──────────────│
│ id (PK)      │       │ id (PK)      │
│ first_name   │       │ name         │
│ last_name    │       │ price        │
│ email        │       │ category     │
└──────┬───────┘       └──────────────┘
       │                          │
       │ customer_id (FK)         │ product_id (FK)
       ▼                          ▼
┌──────────────┐       ┌──────────────────┐
│    orders    │       │    order_items   │
│──────────────│       │──────────────────│
│ id (PK)      │◄──────│ order_id (FK)    │
│ customer_id  │       │ product_id (FK)  │
│ order_date   │       │ quantity         │
│ status       │       │ unit_price       │
│ total_amount │       └──────────────────┘
└──────────────┘

PK = Primary Key (unique identifier)
FK = Foreign Key (link to another table)
```

In simple words:
- Each **order** belongs to one **customer** (via customer_id)
- Each **order_item** links one **order** to one **product**
- An **order** can have many **order_items** (one order, multiple products)

---

## Step 5: Look at Table Structure

Before viewing data, let's see what columns each table has:

```sql
DESCRIBE customers;
```

You will see something like:

| Field | Type | Null | Key | Default | Extra |
|-------|------|------|-----|---------|-------|
| id | int | NO | PRI | NULL | auto_increment |
| first_name | varchar(50) | NO | | NULL | |
| last_name | varchar(50) | NO | | NULL | |
| email | varchar(100) | YES | UNI | NULL | |
| phone | varchar(20) | YES | | NULL | |
| city | varchar(50) | YES | | NULL | |
| created_at | timestamp | YES | | CURRENT_TIMESTAMP | |

This tells you:
- **Field** = column name
- **Type** = what kind of data (text, number, date, etc.)
- **Null** = can this column be empty? (NO = must have a value)
- **Key** = is this a special key? (PRI = primary key, UNI = unique)

Try this for other tables too:

```sql
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;
```

---

## Step 6: Understanding the Basic Query Format

Before running queries, learn the basic SELECT pattern:

```sql
SELECT   [which columns]
FROM     [which table]
[optional extra rules];
```

- `SELECT` = tell MySQL which columns you want
- `FROM` = tell MySQL which table to read from
- `*` = means "all columns"

Simple examples:

```sql
-- Get all columns from products
SELECT * FROM products;

-- Get only name and price from products
SELECT name, price FROM products;

-- Get first name and email from customers
SELECT first_name, email FROM customers;
```

Now let's run your first real query!

---

## Step 7: Your Very First Query — SELECT ALL

The most basic query is `SELECT * FROM table_name`. The `*` means "everything."

```sql
SELECT * FROM customers LIMIT 5;
```

This shows: "Give me all columns from the customers table, but only 5 rows."

You will see output like:

| id | first_name | last_name | email | phone | city | created_at |
|----|------------|-----------|-------|-------|------|------------|
| 1 | John | Smith | john@email.com | 555-0101 | New York | 2025-... |
| 2 | Sarah | Johnson | sarah@email.com | 555-0102 | Los Angeles | 2025-... |
| ... | ... | ... | ... | ... | ... | ... |

**Why `LIMIT 5`?** Without LIMIT, you would see all 10 rows. LIMIT helps you see just a few rows at a time so the output is not overwhelming.

---

## Step 8: Select Specific Columns

You do not always need all columns. You can choose which ones you want:

```sql
SELECT first_name, last_name, city FROM customers;
```

Output:

| first_name | last_name | city |
|------------|-----------|------|
| John | Smith | New York |
| Sarah | Johnson | Los Angeles |
| Mike | Williams | Chicago |
| ... | ... | ... |

---

## Common Problems and Fixes

| Problem | Why It Happens | Fix |
|---------|---------------|-----|
| `ERROR 1049: Unknown database 'shop'` | You forgot to run sample-database.sql first | Run `mysql -u root -p < sample-database.sql` again |
| `ERROR 1064: Syntax error` | Missing semicolon or misspelled keyword | Check for `;` at the end, and spell SELECT/FROM correctly |
| `ERROR 1146: Table 'shop.customers' doesn't exist` | Database loaded but not selected | Run `USE shop;` first |
| Output is too long / hard to read | No LIMIT used | Add `LIMIT 10` to your query |
| Workbench shows red error text | SQL has a syntax mistake | Look for missing commas, quotes, or semicolons |

---

## Exercise

Try these queries yourself (use Workbench or command line):

1. Show all products: `SELECT * FROM products;`
2. Show only product names: `SELECT name FROM products;`
3. Show customer names and cities: `SELECT first_name, last_name, city FROM customers;`
4. Show order IDs and dates: `SELECT id, order_date, status FROM orders;`
5. Show first 3 order items: `SELECT * FROM order_items LIMIT 3;`

---

## Quick Reference

| Symbol | Meaning |
|--------|---------|
| `SELECT` | Tell MySQL what columns you want |
| `*` | Means "all columns" |
| `FROM` | Tell MySQL which table to get data from |
| `LIMIT 5` | Show only 5 rows |
| `,` | Separate multiple column names |

---

## Next Step

Now you know how to view data. Let's learn how to create your own tables from scratch.

→ [Lesson 6: Creating Tables](06-create-tables.md)

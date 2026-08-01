# Lesson 7 — Inserting Data (INSERT)

In this lesson, you will learn how to add rows of data into your tables.

**Prerequisites:** Tables created (Lesson 6), can connect via Workbench or command line

---

## The INSERT Command

To add data, use `INSERT INTO`:

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

### Simple Example

```sql
INSERT INTO students (first_name, last_name, email, birth_date)
VALUES ('Alice', 'Wong', 'alice@email.com', '2000-05-15');
```

This adds one student to your table. Notice:

```
┌─────────────────── INSERT ───────────────────────┐
│                                                   │
│  BEFORE:                    AFTER:                │
│  ┌─────────────────────┐   ┌─────────────────────┐
│  │ id │ name  │ email  │   │ id │ name  │ email  │
│  ├─────────────────────┤   ├─────────────────────┤
│  │  1 │ Alice │ a@e.c  │   │  1 │ Alice │ a@e.c  │
│  │  2 │ Bob   │ b@e.c  │   │  2 │ Bob   │ b@e.c  │
│  └─────────────────────┘   │  3 │ Carol │ c@e.c  │ ← NEW ROW
│                             └─────────────────────┘
│                                                   │
│         ▼ INSERT adds a new row at the bottom ▼    │
└───────────────────────────────────────────────────┘
```

Notice:
- We did NOT include `id` — because it is `AUTO_INCREMENT`, MySQL fills it automatically
- Text values go inside single quotes: `'Alice'`
- Dates go inside single quotes in `YYYY-MM-DD` format

---

## Step 1: Set Up Your Practice Database

Use the sample database we created earlier:

```sql
USE shop;
```

Or create your own school database (from Lesson 6).

---

## Step 2: Insert One Row

```sql
INSERT INTO customers (first_name, last_name, email, phone, city)
VALUES ('Rachel', 'Green', 'rachel@email.com', '555-0200', 'Boston');
```

Check if it worked:

```sql
SELECT * FROM customers WHERE first_name = 'Rachel';
```

You should see Rachel's row with a new id number.

---

## Step 3: Insert Multiple Rows at Once

You can add many rows in one command:

```sql
INSERT INTO products (name, description, price, stock, category) VALUES
('T-Shirt',           'Cotton t-shirt, comfortable fit',       19.99,  100, 'Clothing'),
('Jeans',             'Classic blue jeans',                    49.99,   75, 'Clothing'),
('Sneakers',          'Casual sneakers for everyday wear',     69.99,   50, 'Footwear'),
('Winter Jacket',     'Warm jacket for cold weather',         129.99,   30, 'Clothing'),
('Cap',               'Baseball cap with adjustable strap',    14.99,  120, 'Accessories');
```

```
┌─────────────── MULTI-ROW INSERT ───────────────┐
│                                                 │
│  One INSERT statement adds multiple rows:       │
│                                                 │
│  INSERT INTO products VALUES                   │
│  ├── ('T-Shirt',  $19.99, 100, 'Clothing')     │
│  ├── ('Jeans',    $49.99,  75, 'Clothing')     │
│  ├── ('Sneakers', $69.99,  50, 'Footwear')     │
│  ├── ('Jacket',  $129.99,  30, 'Clothing')     │
│  └── ('Cap',     $14.99, 120, 'Accessories')   │
│                                                 │
│  Result:                                        │
│  ┌──────┬──────────┬───────┬───────┬──────────┐│
│  │ id   │ name     │ price │ stock │ category ││
│  ├──────┼──────────┼───────┼───────┼──────────┤│
│  │  12  │ T-Shirt  │ 19.99 │  100  │ Clothing ││
│  │  13  │ Jeans    │ 49.99 │   75  │ Clothing ││
│  │  14  │ Sneakers │ 69.99 │   50  │ Footwear ││
│  │  15  │ Jacket   │129.99 │   30  │ Clothing ││
│  │  16  │ Cap      │ 14.99 │  120  │ Access.  ││
│  └──────┴──────────┴───────┴───────┴──────────┘│
│                                                 │
│  Note: Each row separated by commas             │
│        Same column order as table definition    │
└─────────────────────────────────────────────────┘
```

---

## Step 4: Insert Without Specifying Columns

If you insert values for **all columns** in order, you can skip the column names:

```sql
INSERT INTO customers VALUES
(11, 'Chris', 'Evans', 'chris@email.com', '555-0201', 'Seattle');
```

⚠️ **Warning:** This is risky! If someone changes the table structure later, your insert might break. It is safer to always specify column names (Step 2 approach).

---

## Step 5: Common Mistakes When Inserting

| Mistake | Wrong | Right |
|---------|-------|-------|
| Missing quotes around text | `VALUES (John)` | `VALUES ('John')` |
| Wrong date format | `VALUES ('15/05/2000')` | `VALUES ('2000-05-15')` |
| Forgetting comma between values | `VALUES ('Alice' 'Bob')` | `VALUES ('Alice', 'Bob')` |
| Forgetting comma between rows | `VALUES (1), (2) (3)` | `VALUES (1), (2), (3)` |
| Not enough values | `INSERT INTO users (name) VALUES ('A', 'B')` | `INSERT INTO users (name, age) VALUES ('A', 'B')` |

---

## Step 6: Insert Using Workbench (Visual Way)

1. In the Schema Panel (left), expand your database and right-click the table
2. Choose **"Select Rows — Limit 1000"**
3. You will see a spreadsheet-like view
4. Click the empty row at the bottom and type your values
5. Click **"Apply"** (button at top right)

This is great for adding a few rows quickly without typing SQL.

---

## Exercise

Using the `shop` database or your own database:

1. Insert 3 new customers into the customers table
2. Insert 5 new products into the products table
3. Verify by running: `SELECT COUNT(*) FROM customers;` (should show 13)
4. Verify by running: `SELECT COUNT(*) FROM products;` (should show 17)

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `INSERT INTO table VALUES (...)` | Add one row |
| `INSERT INTO table (col1, col2) VALUES (...), (...)` | Add multiple rows |
| `SELECT * FROM table` | View all data |
| `SELECT COUNT(*) FROM table` | Count total rows |

---

## Next Step

You can add data. Now let's learn how to read it properly with SELECT queries.

→ [Lesson 8: Reading Data with SELECT](08-select-data.md)

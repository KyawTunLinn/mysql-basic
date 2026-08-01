# Lesson 9 — Updating and Deleting Data

In this lesson, you will learn how to change existing data and remove rows. **Be careful** — these actions can permanently affect your data!

**Prerequisites:** Can read data with SELECT (Lesson 8)

---

## ⚠️ Important Safety Rule

Before updating or deleting, **always** do a SELECT first to check which rows will be affected:

```sql
-- Step 1: Check what WILL be changed
SELECT * FROM customers WHERE city = 'Chicago';

-- Step 2: If it looks right, do the update/delete
UPDATE customers SET city = 'New Chicago' WHERE city = 'Chicago';
```

---

## The UPDATE Command

### Basic Format

```sql
UPDATE table_name
SET column1 = new_value, column2 = new_value
WHERE condition;
```

### Example: Change One Field

```sql
UPDATE customers
SET email = 'john.new@email.com'
WHERE id = 1;
```

This changes John's email to the new one. Without the `WHERE` clause, ALL customers would get the new email!

### Example: Change Multiple Fields

```sql
UPDATE customers
SET phone = '555-9999', city = 'Miami'
WHERE id = 3;
```

### Example: Update Using Calculation

```sql
-- Give all products a 10% price increase
UPDATE products
SET price = price * 1.10;
```

⚠️ Again, without WHERE this affects ALL rows! Always double-check.

---

## The DELETE Command

### Basic Format

```sql
DELETE FROM table_name
WHERE condition;
```

Notice: `DELETE FROM` (not just `DELETE`). This is the correct syntax.

### Example: Delete One Row

```sql
DELETE FROM customers
WHERE id = 10;
```

This removes only customer with id 10.

### Example: Delete Multiple Rows

```sql
DELETE FROM order_items
WHERE quantity < 2;
```

This deletes all order items where quantity is less than 2.

---

## 🚨 Common Mistakes That Destroy Data

| Mistake | What Happens | How to Avoid |
|---------|-------------|--------------|
| Forgetting WHERE clause | Updates or deletes ALL rows! | Always write SELECT first to test your condition |
| Wrong condition | Deletes wrong rows | Double-check your WHERE condition before running |
| Using DROP TABLE by accident | Deletes entire table | Be careful with DROP commands |

### Safe Way to Test Before Deleting

```sql
-- First, see what WILL be deleted
SELECT * FROM customers WHERE city = 'Chicago';

-- If the results look correct, run the DELETE
DELETE FROM customers WHERE city = 'Chicago';
```

---

## Using Workbench to Update/Delete Safely

Workbench has a visual way that is safer for beginners:

1. Right-click a table → **"Select Rows — Limit 1000"**
2. You see all data in a spreadsheet view
3. Click on a cell to edit it directly
4. To delete a row: right-click the row → **"Delete Row"**
5. Click **"Apply"** at the top to save changes

This shows you exactly what you are changing before applying.

---

## Exercise

Using the `shop` database:

1. Update Sarah's city to "San Francisco": `UPDATE customers SET city = 'San Francisco' WHERE first_name = 'Sarah';`
2. Verify the change: `SELECT * FROM customers WHERE first_name = 'Sarah';`
3. Increase all Electronics prices by 5%: `UPDATE products SET price = price * 1.05 WHERE category = 'Electronics';`
4. Verify: `SELECT name, price FROM products WHERE category = 'Electronics';`
5. Insert a test row, then delete it:
   ```sql
   INSERT INTO customers (first_name, last_name, email) VALUES ('Test', 'User', 'test@email.com');
   SELECT * FROM customers WHERE first_name = 'Test';
   DELETE FROM customers WHERE first_name = 'Test';
   ```

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `UPDATE table SET col = val WHERE ...` | Change existing data |
| `DELETE FROM table WHERE ...` | Remove rows |
| `SELECT * FROM table WHERE ...` | Always test before UPDATE/DELETE |
| `WHERE id = X` | Target one specific row |

---

## Next Step

Now let's learn how to filter your data to find exactly what you need.

→ [Lesson 10: Filtering Data](10-filtering.md)

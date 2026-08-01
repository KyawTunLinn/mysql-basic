# Lesson 6 — Creating Tables

In this lesson, you will learn how to create your own tables. A table is like a spreadsheet with rows and columns.

**Estimated time: 30 minutes**

**Prerequisites:** MySQL Server installed (Lesson 2), can connect via Workbench or command line (Lessons 3–4)

---

## What Is a Table?

A table stores related information in an organized way. Think of it like a form:

```
Table: customers
+----+--------------+------------+---------------------+
| id | first_name   | last_name  | email               |
+----+--------------+------------+---------------------+
| 1  | John         | Smith      | john@email.com      |
| 2  | Sarah        | Johnson    | sarah@email.com     |
+----+--------------+------------+---------------------+
 ↑    ↑            ↑            ↑
id   first_name  last_name    email
(column) (column)  (column)   (column)
```

---

## Step 1: Create a New Database

First, let's create a database for our practice:

```sql
CREATE DATABASE school;
USE school;
```

---

## Step 2: The CREATE TABLE Command

The basic format:

```sql
CREATE TABLE table_name (
    column1_name data_type rules,
    column2_name data_type rules,
    column3_name data_type rules
);
```

Let's break this down piece by piece:

- `CREATE TABLE` — tells MySQL you want to make a new table
- `table_name` — the name you give your table
- Inside parentheses `()` — list all your columns
- Each column has: **name**, **data type**, and optional **rules**

---

## Step 3: Your First Table

Let's create a simple students table:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    age INT,
    enroll_date DATE
);
```

### What Does Each Part Mean?

| Part | Explanation |
|------|-------------|
| `INT` | Integer (whole number like 1, 2, 3...) |
| `PRIMARY KEY` | This column uniquely identifies each row. No two rows can have the same id |
| `AUTO_INCREMENT` | MySQL automatically gives each new row the next number (1, 2, 3...) |
| `VARCHAR(50)` | Variable-length text, up to 50 characters |
| `NOT NULL` | This column must have a value. You cannot leave it empty |
| `DATE` | Stores dates like '2025-01-15' |

---

## Step 4: Check If Your Table Was Created

```sql
SHOW TABLES;
```

You should see `students` in the list.

To see the table structure:

```sql
DESCRIBE students;
```

---

## Step 5: More Column Types You Should Know

| Type | What It Stores | Example |
|------|---------------|---------|
| `INT` | Whole numbers | 1, 42, 1000 |
| `BIGINT` | Very large whole numbers | 999999999999 |
| `DECIMAL(10,2)` | Exact decimal numbers (for money) | 29.99, 100.00 |
| `VARCHAR(255)` | Text up to 255 characters | "Hello World" |
| `TEXT` | Long text (no fixed limit) | Book descriptions, essays |
| `DATE` | Date only | 2025-01-15 |
| `DATETIME` | Date and time | 2025-01-15 14:30:00 |
| `TIMESTAMP` | Date/time that updates automatically | Used for created_at, updated_at |
| `BOOLEAN` or `TINYINT(1)` | True or false | 1 (true) or 0 (false) |

---

## Step 6: Adding Common Rules

You can add rules to control what data goes into a column:

```sql
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Common Rules Explained

| Rule | What It Does |
|------|--------------|
| `PRIMARY KEY` | Uniquely identifies each row (must be unique, cannot be null) |
| `NOT NULL` | Value is required |
| `DEFAULT value` | Use this value if none is provided |
| `AUTO_INCREMENT` | Automatically increases by 1 for each new row |
| `UNIQUE` | No two rows can have the same value in this column |

---

## Step 7: Creating Multiple Related Tables

Real databases have multiple tables that connect to each other. Let's create a full school system:

```sql
-- Students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    birth_date DATE,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Teachers table
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    subject VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    max_students INT DEFAULT 30,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

-- Enrollments table (connects students to courses)
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade DECIMAL(5, 2),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
```

### What Is a Foreign Key?

A **foreign key** creates a link between two tables:
- `FOREIGN KEY (teacher_id) REFERENCES teachers(id)` means: "The teacher_id in courses must match an existing id in the teachers table."
- This prevents you from adding a course with a teacher that does not exist.

---

## Step 8: Verify All Tables

```sql
SHOW TABLES;
```

You should see:
```
+------------------+
| Tables_in_school |
+------------------+
| courses          |
| enrollments      |
| students         |
| teachers         |
+------------------+
```

Check each table structure:

```sql
DESCRIBE students;
DESCRIBE teachers;
DESCRIBE courses;
DESCRIBE enrollments;
```

---

## Step 9: Delete a Table (If You Made a Mistake)

```sql
DROP TABLE table_name;
```

⚠️ **Warning:** This permanently deletes the table and all its data! There is no undo.

To delete the entire database:

```sql
DROP DATABASE school;
```

---

## Exercise

Create these tables in a new database called `library`:

1. **books** — id, title, author, isbn (unique), published_year, available (boolean)
2. **members** — id, name, email (unique), phone, join_date
3. **borrowings** — id, book_id, member_id, borrow_date, return_date, returned (boolean)

Make sure to use foreign keys to connect the tables properly.

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `CREATE TABLE name (...)` | Create a new table |
| `SHOW TABLES` | List all tables in current database |
| `DESCRIBE table_name` | Show table structure |
| `DROP TABLE name` | Delete a table |

---

## Next Step

Your tables are ready. Now let's add data to them!

→ [Lesson 7: Inserting Data](07-insert-data.md)

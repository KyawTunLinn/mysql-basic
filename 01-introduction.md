# Lesson 1 — Introduction to MySQL

## What Is MySQL?

MySQL is a **database program**. It stores information in an organized way so you can find, add, update, or delete data quickly.

### Visual Analogy: Database = Filing Cabinet

```
┌───────────────────────────────────────────┐
│          MySQL Server (Your Computer)      │
│                                           │
│  ┌─────────────────────────────────────┐  │
│  │   📁 Database: "shop"               │  │
│  │  ┌─────────────┐  ┌─────────────┐   │  │
│  │  │ 🗄️ Table:   │  │ 🗄️ Table:   │   │  │
│  │  │ customers   │  │  products   │   │  │
│  │  │─────────────│  │─────────────│   │  │
│  │  │ id: 1       │  │ id: 1       │   │  │
│  │  │ name: John  │  │ name: Laptop│   │  │
│  │  │ email: ...  │  │ price: $999 │   │  │
│  │  ├─────────────│  ├─────────────│   │  │
│  │  │ id: 2       │  │ id: 2       │   │  │
│  │  │ name: Sarah │  │ name: Mouse │   │  │
│  │  │ email: ...  │  │ price: $29  │   │  │
│  │  └─────────────┘  └─────────────┘   │  │
│  │                                     │  │
│  │  ┌─────────────┐  ┌─────────────┐   │  │
│  │  │ 🗄️ Table:   │  │ 🗄️ Table:   │   │  │
│  │  │  orders     │  │ order_items │   │  │
│  │  │─────────────│  │─────────────│   │  │
│  │  │ id: 101     │  │ id: 1       │   │  │
│  │  │ cust_id: 1  │  │ order_id:1  │   │  │
│  │  │ total:$1K   │  │ prod_id: 1  │   │  │
│  │  └─────────────┘  └─────────────┘   │  │
│  └─────────────────────────────────────┘  │
└───────────────────────────────────────────┘
```

Key terms mapped to the analogy:

| Term | Real World | In MySQL |
|------|-----------|----------|
| **Database** | Whole filing cabinet | Collection of related tables (`shop`) |
| **Table** | One drawer | Organized list (`customers`, `products`) |
| **Row** | One piece of paper | One record (one customer, one product) |
| **Column** | A field on the paper | One type of info (`name`, `price`, `email`) |

## Why Learn MySQL?

MySQL is one of the most popular databases in the world. You will find it used by:

- **Websites** — Facebook, Twitter, YouTube, and many more use MySQL to store user data
- **Apps** — Mobile apps use databases to save your settings and history
- **Businesses** — Companies track sales, inventory, and customers with databases
- **You** — Learning MySQL helps you get jobs in web development, data analysis, and IT

## Simple Real-Life Examples

| Situation | What MySQL Stores |
|-----------|-------------------|
| Online shop | Products, prices, customer orders |
| School system | Students, grades, class schedules |
| Hospital | Patient records, appointments, medicines |
| Blog platform | Posts, comments, user accounts |

## Key Terms You Need to Know

| Term | Simple Meaning |
|------|----------------|
| **Database** | A collection of related tables |
| **Table** | A list of items (like a spreadsheet) |
| **Row** | One single item/record in a table |
| **Column** | One type of information (like "name" or "email") |
| **SQL** | The language used to talk to MySQL (pronounced "sequel") |
| **Query** | A question you ask MySQL to get data back |
| **Server** | The MySQL program running on your computer that handles requests |

## Two Ways to Use MySQL

```
┌──────────────────────┐    ┌──────────────────────┐
│  MySQL Workbench     │    │   Command Line       │
│  (Visual / Point &   │    │   (Type Commands)    │
│    Click)            │    │                      │
│                      │    │                      │
│  ┌────────────────┐  │    │  $ mysql -u root -p │
│  │ ╔════════════╗ │  │    │  > USE shop;        │
│  │ ║ Database: 🗄️║ │  │    │  > SELECT *         │
│  │ ║ Table: cust │  │    │    FROM customers;   │
│  │ ╚════════════╝ │  │    │                      │
│  │ [▶ Run] [✓]   │  │    │  +----+------------+ │
│  └────────────────┘  │    │  | id | first_name | │
│                      │    │  | 1  | John       | │
│  ✅ Easy for beginners│   │  | 2  | Sarah      | │
│  ❌ Slower for big   │   │  +----+------------+ │
│     operations       │   │                      │
└──────────────────────┘    └──────────────────────┘
```

1. **MySQL Workbench** — A visual program with buttons and menus. Good for beginners.
2. **Command Line** — Type commands directly. More powerful once you learn it.

This course teaches **both**.

## What Is SQL?

SQL stands for **Structured Query Language**. It is the language you use to:
- Create databases and tables
- Add, change, and delete data
- Ask questions (query) your data

Example of a simple SQL query:

```sql
SELECT * FROM users;
```

### How MySQL Reads Your Query

```
  "Show me everything"     "from this table"
         ↓                       ↓
   ┌─────────┐              ┌──────────┐
   │ SELECT  │              │  FROM    │
   │   *     │              │  users   │
   └─────────┘              └──────────┘
        │                          │
        ▼                          ▼
   ┌─────────────────────────────────┐
   │         MySQL Engine            │
   │                                 │
   │  🔍 Search → Filter → Return    │
   │                                 │
   │  +----+----------+-------+      │
   │  | id | name     | email |      │
   │  +----+----------+-------+      │
   │  | 1  | John     | ...   |      │
   │  | 2  | Sarah    | ...   |      │
   │  +----+----------+-------+      │
   └─────────────────────────────────┘
```

This means: "Show me everything in the users table."

Simple, right?

## What This Course Covers

By the end of this course, you will be able to:
- Install MySQL on your computer
- Create databases and tables
- Add, read, update, and delete data
- Search and filter your data
- Combine data from multiple tables
- Back up your database

## Next Step

Now that you know what MySQL is, let's install it on your computer.

→ [Lesson 2: Installing MySQL Server](02-installation.md)

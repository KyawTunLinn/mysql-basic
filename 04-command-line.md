# Lesson 4 — MySQL Command Line Basics

The command line (also called terminal or console) is where you type SQL commands directly. Many developers prefer this method because it is fast and powerful.

### Visual: How Command Line Works

```
┌─────────────────────────────────────────────────────┐
│                  Your Terminal Window                 │
│                                                     │
│  user@computer:~$ mysql -u root -p                   │
│  Enter password: ********                            │
│                                                      │
│  Welcome to the MySQL monitor!                       │
│  mysql> USE shop;                                    │
│  Database changed                                    │
│                                                      │
│  mysql> SELECT * FROM customers LIMIT 3;             │
│  +----+--------------+-----------+------------------+│
│  | id | first_name   | last_name | email            ││
│  +----+--------------+-----------+------------------+│
│  | 1  | John         | Smith     | john@email.com   ││
│  | 2  | Sarah        | Johnson   | sarah@email.com  ││
│  | 3  | Mike         | Williams  | mike@email.com   ││
│  +----+--------------+-----------+------------------+│
│  3 rows in set (0.01 sec)                            │
│                                                      │
│  mysql> EXIT;                                        │
│  Bye                                                 │
│                                                     │
│  user@computer:~$                                    │
└─────────────────────────────────────────────────────┘
```

**Estimated time: 30 minutes**

---

## What Is the Command Line?

The command line is a text-based interface where you type commands instead of clicking buttons. Think of it like talking directly to MySQL.

| Tool | How You Use It | Best For |
|------|----------------|----------|
| Workbench | Click buttons and menus | Beginners, visual browsing |
| Command Line | Type text commands | Speed, automation, servers |

You will learn **both**, so you can choose what works best for you.

---

## Step 1: Open Your Terminal

### On Windows:
1. Press `Windows Key + R`
2. Type `cmd` and press Enter
3. Or search "Command Prompt" in the Start menu

### On Mac:
1. Press `Cmd + Space` to open Spotlight
2. Type "Terminal" and press Enter

### On Linux:
1. Press `Ctrl + Alt + T`
2. Or search "Terminal" in your application menu

You should see a black or dark window with a blinking cursor like this:

```
C:\Users\yourname>     (Windows)
user@computer:~$        (Mac/Linux)
```

This blinking cursor means: **type your command here**.

---

## Step 2: Connect to MySQL

Type this command and press Enter:

```bash
mysql -u root -p
```

Explanation:
- `mysql` — tells the computer to open MySQL
- `-u root` — log in as the "root" user (the administrator)
- `-p` — means "please ask for a password"

### How the Connection Works

```
┌──────────────┐     ┌──────────────────┐     ┌─────────────┐
│  Terminal    │     │   MySQL Client   │     │ MySQL Server│
│              │     │                  │     │             │
│  $ mysql -u  │────▶│  Sends login     │────▶│  Checks     │
│        root  │     │  + SQL commands  │     │  password   │
│              │◀────│                  │◀────│  & returns  │
│  mysql>      │     │  Receives data   │     │  results    │
└──────────────┘     └──────────────────┘     └─────────────┘
```

You will see: `Enter password:`

Type your root password (you will not see the characters as you type — this is normal for security). Then press Enter.

If the password is correct, you will see:

```
Welcome to the MySQL monitor...
mysql>
```

**Congratulations!** You are now inside MySQL through the command line. The `mysql>` prompt means MySQL is waiting for your commands.

---

## Step 3: Your First Command

At the `mysql>` prompt, type:

```sql
SELECT 'Hello, MySQL!';
```

Press Enter. You should see:

```
+------------------+
| Hello, MySQL!    |
+------------------+
| Hello, MySQL!    |
+------------------+
1 row in set (0.00 sec)
```

You just ran your first SQL query from the command line!

---

## Step 4: Useful Commands at the mysql> Prompt

### See All Databases

```sql
SHOW DATABASES;
```

### See Current Database

```sql
SELECT DATABASE();
```

### See Table Structure

```sql
DESCRIBE table_name;
```
Or shorter:
```sql
DESC table_name;
```

### Get Help

```sql
HELP;
```
Then type the topic you want help with, like `HELP SELECT;`

---

## Step 5: Important Rules for Command Line

### Every SQL Statement Ends With Semicolon

```sql
SELECT * FROM users;   -- Correct ✓
SELECT * FROM users    -- Wrong ✗ (missing semicolon)
```

The semicolon (`;`) tells MySQL: "This command is finished, please run it."

```
Without semicolon:          With semicolon:
mysql> SELECT *             mysql> SELECT * FROM users;
       FROM users;                  +----+----------+
       ->                          | id | name     |
       -> FROM users;               +----+----------+
       -> ;                         | 1  | John     |
       ->                          | 2  | Sarah    |
       ->                          +----+----------+
       -> 2 rows in set
```

When you forget the `;`, MySQL shows `->` to tell you it is waiting for more input.

### Multi-Line Commands

You can spread a command across multiple lines. MySQL knows you are not done until you type `;`:

```sql
SELECT first_name,
       last_name,
       email
FROM users;
```

### Exit MySQL

To leave the MySQL command line:

```sql
EXIT;
```
or
```sql
QUIT;
```

Both work the same way. You will return to your normal terminal.

---

## Step 6: Running a Single Command (Without Entering Interactive Mode)

If you just want to run one quick command without entering the MySQL prompt:

```bash
mysql -u root -p -e "SHOW DATABASES;"
```

The `-e` flag means "execute this command and exit."

---

## Step 7: Running a SQL File From Command Line

If you have a file with many SQL commands (like `setup.sql`):

```bash
mysql -u root -p my_database < setup.sql
```

This runs all commands in the file against `my_database`.

Or you can do it inside MySQL:

```sql
SOURCE /path/to/setup.sql;
```

---

## Step 8: Common Command Line Tips

### Auto-Complete

While typing a command, press `Tab` to autocomplete table names or column names.

### Command History

- Press `↑` (up arrow) to see previous commands
- Press `↓` (down arrow) to go back down
- This saves you from retyping long commands!

### Clear Screen

```sql
-- Type this to clear the output on screen
system clear          (Mac/Linux)
system cls            (Windows)
```

### Copy and Paste

- **Windows**: Right-click to paste, or use `Ctrl + Shift + V`
- **Mac**: `Cmd + Shift + V`
- **Linux**: `Ctrl + Shift + V`

---

## Step 9: Connecting Without Password Prompt

If you do not want to type your password every time, you can add it to the command:

```bash
mysql -u root -pyourpassword
```

Note: There is **no space** between `-p` and the password.

⚠️ **Warning**: This is not secure because anyone can see your password by looking at the process list. Only use this on your personal computer for practice.

---

## Exercise

Try these tasks in your terminal:

1. Open your terminal/command prompt
2. Connect to MySQL: `mysql -u root -p`
3. Run: `SHOW DATABASES;`
4. Run: `SELECT VERSION();` (this shows your MySQL version)
5. Run: `STATUS;` (this shows connection details)
6. Exit MySQL: `EXIT;`

---

## Next Step

Now you can connect using both Workbench and the command line. Let's run your very first real queries!

→ [Lesson 5: Your First Queries](05-first-queries.md)

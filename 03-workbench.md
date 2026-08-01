# Lesson 3 — MySQL Workbench Guide

MySQL Workbench is a visual program that lets you work with databases using clicks and menus instead of typing commands. This is the **best tool for beginners**.

**Estimated time: 30 minutes**

---

## Step 1: Open MySQL Workbench

### On Windows:
- Search "MySQL Workbench" in the Start menu and click it

### On Mac:
- Open Finder → Applications → MySQL Workbench

### On Linux:
- Search "MySQL Workbench" in your application menu

---

## Step 2: Create a Connection

When you first open Workbench, you will see a blank screen with **"MySQL Connections"** section.

### Create Your First Connection:

1. Click the **+** icon next to **"MySQL Connections"** (or double-click "Local instance MySQL80")
2. A setup window will appear

### Fill in these settings:

| Setting | What to Enter |
|---------|---------------|
| **Connection Name** | `Local MySQL` (or any name you like) |
| **Hostname** | `localhost` (this means your own computer) |
| **Port** | `3306` (default port, leave as is) |
| **Username** | `root` |
| **Password** | The password you set during installation |

3. Click **"Test Connection"** — if it says "Connection succeeded", you are good!
4. Click **"OK"** to save

---

## Step 3: Connect to the Server

1. Double-click your connection name in the main screen
2. Enter your root password when prompted
3. You will see the Workbench dashboard — congratulations, you are connected!

---

## Step 4: Explore the Workbench Interface

Here is what you will see:

```
+--------------------------------------------------+
|  Schema Panel (left side)                        |
|  - InnoDB Schema (system database)              |
|  - mysql (system database)                      |
|  - performance_schema                           |
|  - sys                                          |
+---------------------------+----------------------+
|                            |                     |
|   SQL Editor (center)     |  Query Output       |
|   Type your SQL here      |  Results appear     |
|                            |  here               |
+---------------------------+----------------------+
```

### Key Areas:

| Area | What It Does |
|------|--------------|
| **Schema Panel** (left) | Shows all your databases. Like folders in File Explorer |
| **SQL Editor** (center) | Where you type SQL commands. Like a text editor |
| **Query Output** (bottom/right) | Shows results of your queries. Like a table view |
| **Toolbar** (top) | Buttons to run queries, save files, etc. |

---

## Step 5: Your First Action in Workbench

Let's look at what databases exist on your server:

1. Click the **lightning bolt** icon (⚡) or press `Ctrl + Enter` to run a query
2. Type this in the SQL Editor:

```sql
SHOW DATABASES;
```

3. Click the **lightning bolt** icon to run it
4. Look at the bottom panel — you will see a list of databases!

You should see something like:
- `information_schema`
- `mysql`
- `performance_schema`
- `sys`

These are system databases created by MySQL automatically. We will create our own soon!

---

## Step 6: Create Your First Database

1. Type this in the SQL Editor:

```sql
CREATE DATABASE my_first_db;
```

2. Press `Ctrl + Enter` to run it
3. In the left Schema Panel, **right-click** anywhere and choose **"Refresh All"**
4. You should now see `my_first_db` appear in the list!

### Alternative Way (using the GUI):

1. Right-click anywhere in the Schema Panel
2. Choose **"Create Schema..."**
3. Type `my_first_db` as the name
4. Click **Apply**, then **Apply** again
5. Click **Finish**

Both methods do the same thing!

---

## Step 7: Browse Tables Visually

Once you have tables in your database, you can view them without typing SQL:

1. In the Schema Panel, click the arrow next to your database name to expand it
2. You will see sections: **Tables**, **Views**, **Functions**, etc.
3. **Double-click a table name** to see its data in a spreadsheet-like view
4. You can **add, edit, or delete rows** directly from this view

---

## Step 8: Save Your Queries

1. Click **File → Save Script As...**
2. Choose a folder and give your script a name (e.g., `my-first-query.sql`)
3. Next time, open it with **File → Open Script**

---

## Step 9: Useful Workbench Shortcuts

| Shortcut | What It Does |
|----------|--------------|
| `Ctrl + Enter` | Run current query |
| `Ctrl + Shift + Enter` | Run all queries in the editor |
| `Ctrl + S` | Save the script |
| `Ctrl + O` | Open a script file |
| `Ctrl + R` | Refresh schema panel |
| `Ctrl + /` | Comment/uncomment a line |
| `Shift + Space` | Show autocomplete suggestions |

---

## Step 10: Tips for Using Workbench

- **Use autocomplete** — Start typing a table or column name, then press `Ctrl + Space` to see suggestions
- **Color coding** — MySQL keywords (SELECT, FROM, WHERE) turn blue automatically. This helps you read queries
- **Tab completion** — Type part of a word and press `Tab` to complete it
- **Multiple tabs** — You can open multiple query tabs at once
- **Dark mode** — Go to Edit → Preferences → Appearance to change colors

---

## Exercise

Try these tasks in Workbench:

1. Create a database called `school_db`
2. Run `SHOW DATABASES;` to confirm it was created
3. Close Workbench and reopen it
4. Reconnect to your server
5. Refresh the schema panel to see your database

---

## Next Step

Now you know Workbench! Let's also learn the command line (terminal) way, which many professionals prefer.

→ [Lesson 4: Command Line Basics](04-command-line.md)

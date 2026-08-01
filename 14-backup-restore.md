# Lesson 14 — Backup and Restore

In this lesson, you will learn how to save your database (backup) and bring it back (restore). This is essential for protecting your data.

**Prerequisites:** Can connect via command line (Lesson 4), database has data (Lessons 5–13)

---

## Why Back Up?

- Prevent data loss from accidents or system failures
- Create a safety net before making big changes
- Share your database with others
- Move data between servers

---

## Method 1: mysqldump (Recommended for Beginners)

`mysqldump` creates a text file containing all your SQL commands to recreate the database.

### Backup a Single Database

```bash
mysqldump -u root -p shop > shop-backup.sql
```

This saves everything (table structures + data) into `shop-backup.sql`.

### Backup All Databases

```bash
mysqldump -u root -p --all-databases > all-databases-backup.sql
```

### Backup Only the Table Structure (No Data)

```bash
mysqldump -u root -p --no-data shop > shop-structure.sql
```

### Backup Only the Data (No Structure)

```bash
mysqldump -u root -p --no-create-info shop > shop-data.sql
```

---

## Restoring From a Backup

### Restore Using Command Line

```bash
mysql -u root -p shop < shop-backup.sql
```

This reads the backup file and recreates everything in the `shop` database.

### Restore Into a New Database

```bash
# First create a new empty database
mysql -u root -p -e "CREATE DATABASE shop_restore;"

# Then restore into it
mysql -u root -p shop_restore < shop-backup.sql
```

---

## Method 2: Workbench Export/Import

### Export (Backup) in Workbench:

1. Right-click your database in the Schema Panel
2. Choose **"Export Wizard"**
3. Follow the steps:
   - Select tables to export
   - Choose output format (SQL recommended)
   - Save the file
4. Click **Start Export**

### Import (Restore) in Workbench:

1. Right-click your database → **"Import Wizard"**
2. Choose the `.sql` backup file
3. Follow the steps
4. Click **Start Import**

---

## Method 3: Schedule Automatic Backups

For daily automatic backups, create a schedule:

### On Linux/Mac (using cron):

```bash
# Run backup every day at 2 AM
0 2 * * * mysqldump -u root -pyourpassword shop > /backups/shop-$(date +\%Y\%m\%d).sql
```

### On Windows (using Task Scheduler):

1. Open Task Scheduler
2. Create a basic task
3. Set it to run daily
4. Action: Start a program
5. Program: `mysqldump.exe`
6. Arguments: `-u root -p password shop > C:\backups\shop-%DATE%.sql`

---

## Important Tips

| Tip | Reason |
|-----|--------|
| Always test your backup | A backup that cannot be restored is useless |
| Keep multiple backups | Delete old ones to save space |
| Store backups outside your computer | Use cloud storage or external drive |
| Compress large backups | Use gzip: `mysqldump ... \| gzip > backup.sql.gz` |
| Include date in filename | Makes it easy to find the right backup |

---

## Exercise

1. Create a backup of the `shop` database using mysqldump
2. Verify the backup file was created and has content
3. Delete the `shop` database: `DROP DATABASE shop;`
4. Restore from your backup
5. Verify all tables and data are back
6. Try exporting via Workbench Export Wizard and importing back

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `mysqldump -u root -p dbname > file.sql` | Backup a database |
| `mysql -u root -p dbname < file.sql` | Restore from backup |
| Workbench → Export Wizard | Visual backup method |
| Workbench → Import Wizard | Visual restore method |

---

## 🎉 Congratulations!

You have completed the MySQL Beginner Course! You now know:

- How to install MySQL Server
- How to use MySQL Workbench (visual tool)
- How to use the command line
- How to create databases and tables
- How to add, read, update, and delete data
- How to filter, sort, and combine data
- How to summarize data with aggregations
- How to back up and restore your database

## What's Next?

Here are some topics to explore further:

- **JOINs with more tables** — Practice combining 3+ tables
- **Views** — Save complex queries as virtual tables
- **Stored Procedures** — Write reusable SQL code
- **Indexes** — Make your queries faster
- **User Management** — Create users with specific permissions

Keep practicing and building databases. The more you use MySQL, the better you become!

---

## Useful Resources

- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [MySQL Cheat Sheet](mysql-cheat-sheet.md) — Keep this handy!
- [Sample Database](sample-database.sql) — Practice anytime

Happy querying! 🚀

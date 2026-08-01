# Lesson 2 — Installing MySQL Server

In this lesson, you will install MySQL on your computer. Choose your operating system below.

**Estimated time: 30 minutes**

---

## Want to Try First Without Installing?

If you want to practice SQL before installing anything, try these free online tools:

| Website | What It Does |
|---------|--------------|
| [SQLFiddle](http://sqlfiddle.com/) | Write and run SQL in your browser |
| [DB Fiddle](https://www.db-fiddle.com/) | Create tables and run queries online |
| [MySQL Sandbox](https://mysqlsandbox.net/) | Free online MySQL environment |

These are great for learning SQL syntax. But for the full experience (Workbench, real databases), follow the installation steps below.

---

## Option A: Install on Windows

### Step 1: Download MySQL Installer

1. Go to https://dev.mysql.com/downloads/installer/
2. Click **"Download"** on **"MySQL Installer for Windows"** (mysql-installer-web-community.exe)
3. If asked to log in, click **"No thanks, just start my download."**

### Step 2: Run the Installer

1. Double-click the downloaded file `mysql-installer-web-community.exe`
2. Choose **"Developer Default"** setup type
3. Click **Next**
4. It will download needed files (this may take a few minutes)

### Step 3: Set Your Password

1. When it asks for a password, create a **strong password** for the root user
2. Write this password down somewhere safe! You will need it later
3. Click **Next** through the remaining screens (accept defaults)

### Step 4: Finish Installation

1. Click **Execute** to apply changes
2. Wait for all steps to turn green (check mark)
3. Click **Finish**

### Step 5: Verify Installation

1. Open **Command Prompt** (search "cmd" in Windows search bar)
2. Type this command and press Enter:

```
mysql --version
```

3. If you see a version number (like `mysql  Ver 8.0.xxx`), MySQL is installed correctly!

---

## Option B: Install on Mac (using Homebrew)

### Step 1: Install Homebrew (if not already installed)

Open **Terminal** (search "Terminal" in Spotlight) and paste:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions. If prompted, enter your Mac password.

> **Tip:** On newer Macs (Apple Silicon M1/M2/M3), Homebrew installs to `/opt/homebrew`. The commands below still work.

### Step 2: Install MySQL

In Terminal, type:

```bash
brew install mysql
```

### Step 3: Start MySQL

```bash
brew services start mysql
```

### Step 4: Secure Installation

```bash
mysql_secure_installation
```

Follow the prompts:
- Press Enter for no password authentication plugin (or choose Y if prompted)
- Set a root password (write it down!)
- Say **Y** to all security questions

### Step 5: Verify Installation

```bash
mysql --version
```

You should see the MySQL version number.

---

## Option C: Install on Linux (Ubuntu/Debian)

### Step 1: Update Package List

Open **Terminal** and type:

```bash
sudo apt update
```

### Step 2: Install MySQL Server

```bash
sudo apt install mysql-server
```

Press `Y` when asked to confirm.

### Step 3: Start MySQL Service

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

### Step 4: Secure Installation

```bash
sudo mysql_secure_installation
```

Follow the prompts — set a root password and say **Y** to all security questions.

### Step 5: Verify Installation

```bash
mysql --version
```

---

## Option D: Install Using Docker (All Operating Systems)

If you have Docker installed, this is the fastest option:

```bash
docker run --name mysql-beginner -e MYSQL_ROOT_PASSWORD=mysecret123 -p 3306:3306 -d mysql:8
```

Explanation:
- `--name mysql-beginner` — gives the container a name
- `-e MYSQL_ROOT_PASSWORD=mysecret123` — sets the root password (change this!)
- `-p 3306:3306` — connects port 3306 from your computer to the container
- `-d` — runs in background

To stop: `docker stop mysql-beginner`
To start again: `docker start mysql-beginner`

---

## Common Problems and Fixes

| Problem | Solution |
|---------|----------|
| "mysql: command not found" | MySQL may not be in your system PATH. Try using the full path or reinstall |
| "Access denied for user 'root'" | You typed the wrong password. Check if Caps Lock is on |
| MySQL service won't start (Linux/Mac) | Try: `sudo systemctl status mysql` to see error details |
| Port 3306 already in use | Another program uses this port. Stop the other program or change MySQL port |

---

## What Is the Root Password?

The **root password** is like the master key to your database. You will need it whenever you connect to MySQL. 

**Important:** Write it down and keep it safe!

---

## Next Step

Now that MySQL is installed, let's learn how to use MySQL Workbench — a visual tool that makes working with databases easy.

→ [Lesson 3: MySQL Workbench Guide](03-workbench.md)

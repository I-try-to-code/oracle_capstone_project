🎉 **Awesome job finishing Week 2!**

You've successfully:
- Created sample tables for HR, Finance, and Sales
- Built dashboard views showing key metrics
- Set up cross-schema access for `admin_user`
- Learned how to grant privileges correctly
- Fixed common Oracle errors like:
  - `ORA-01031: insufficient privileges`
  - `ORA-00942: table or view does not exist`
  - `ORA-01953: command no longer valid`

You're now ready to move on to:

---

# 📘 Week 3: Build Space Monitoring & Email Alerts

## 🎯 Objective:
Write a script that:
- Monitors tablespace usage
- Triggers an alert when space is low (e.g., >80% used)
- Sends an email automatically using Windows
- Schedules the check to run daily

This will teach you:
- How to automate DBA tasks
- How to monitor database health
- How to build real-world alerting systems
- How to use scripting in your capstone project

Let’s begin!

---

## 📊 Task 1: Write Tablespace Usage Script

Create a `.sql` file that checks tablespace usage and outputs results.

### 🔧 Step-by-Step:

Create this file:

```
C:\oracle_capstone_project\alerts\check_tablespace.sql
```

Add this query:

```sql
SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET PAGESIZE 0
SET LINESIZE 100
SET TRIMSPOOL ON

SPOOL C:\oracle_capstone_project\logs\tablespace_usage.log

SELECT 
    a.tablespace_name,
    SUM(a.bytes) / 1048576 AS total_mb,
    SUM(b.free_space) / 1048576 AS free_mb,
    ROUND(100 * (SUM(b.free_space) / SUM(a.bytes)), 2) AS pct_free
FROM 
    dba_data_files a,
    (SELECT tablespace_name, SUM(bytes) AS free_space FROM dba_free_space GROUP BY tablespace_name) b
WHERE 
    a.tablespace_name = b.tablespace_name(+)
GROUP BY 
    a.tablespace_name
ORDER BY 
    pct_free ASC;

SPOOL OFF
```

Now test it:

```cmd
sqlplus hr_user/hrpass@CAPSTONE @C:\oracle_capstone_project\alerts\check_tablespace.sql
```

✅ If it generates a log file with usage → great!

---

## 📨 Task 2: Create Alert Logic – Detect Low Space

Now write logic that detects if any tablespace is over 80% used.

### ✅ Step-by-Step:

Create a new script:

```
C:\oracle_capstone_project\alerts\check_tablespace_alert.sql
```

Use this code:

```sql
SET SERVEROUTPUT ON
DECLARE
  CURSOR c_tablespace IS
    SELECT 
        a.tablespace_name,
        ROUND(100 * (SUM(b.free_space) / SUM(a.bytes)), 2) AS pct_free
    FROM 
        dba_data_files a,
        (SELECT tablespace_name, SUM(bytes) AS free_space FROM dba_free_space GROUP BY tablespace_name) b
    WHERE a.tablespace_name = b.tablespace_name(+)
    GROUP BY a.tablespace_name
    HAVING ROUND(100 * (SUM(b.free_space) / SUM(a.bytes)), 2) < 20; -- Alert if less than 20% free

BEGIN
  FOR r IN c_tablespace LOOP
    DBMS_OUTPUT.PUT_LINE('CRITICAL: Tablespace ' || r.tablespace_name || ' is at ' || (100 - r.pct_free) || '% capacity!');
  END LOOP;
END;
/
```

Run it:

```cmd
sqlplus hr_user/hrpass@CAPSTONE @C:\oracle_capstone_project\alerts\check_tablespace_alert.sql
```

If output shows:
```
CRITICAL: Tablespace hr_data is at 85% capacity!
```

→ Your alert system works!

---

## 📩 Task 3: Send Email from Windows CMD

Oracle doesn’t have built-in email — but we can call external tools from your scripts.

### 📌 Choose One Option:

#### ✅ Option A: Use PowerShell to Send Email

Create this batch file:

```
C:\oracle_capstone_project\alerts\send_email.ps1
```

PowerShell content:

```powershell
$EmailTo = "your_email@example.com"
$EmailFrom = "db_alert@company.local"
$Subject = "Tablespace Usage Alert"
$Body = "One or more tablespaces are running low on space."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$SMTPUser = "your_email@gmail.com"
$SMTPPassword = "your_app_password"

$Message = New-Object System.Net.Mail.MailMessage $EmailFrom, $EmailTo
$Message.Subject = $Subject
$Message.Body = $Body

$Smtp = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($SMTPUser, $SMTPPassword)
$Smtp.Send($Message)
```

Save as `.ps1` file and allow script execution:

```cmd
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then test:

```cmd
powershell -File C:\oracle_capstone_project\alerts\send_email.ps1
```

---

## 🧠 Optional: Call PowerShell Script from SQL*Plus

You can't send emails directly from SQL*Plus, but you can call your PowerShell script from a `.bat` wrapper.

Create:

```
C:\oracle_capstone_project\alerts\run_tablespace_check.bat
```

Content:

```batch
@echo off
echo Running Tablespace Check...
sqlplus hr_user/hrpass@CAPSTONE @C:\oracle_capstone_project\alerts\check_tablespace_alert.sql > C:\oracle_capstone_project\logs\alert_output.txt

findstr /c:"CRITICAL" C:\oracle_capstone_project\logs\alert_output.txt
if %errorlevel% == 0 (
    echo Sending alert email...
    powershell -File C:\oracle_capstone_project\alerts\send_email.ps1
)
```

This script:
- Runs your tablespace alert SQL
- Checks if the word “CRITICAL” appears
- If yes → sends an email alert

---

## ⏱️ Task 4: Schedule Daily Tablespaces Check

Use Windows Task Scheduler to run your script daily.

### 🛠️ Step-by-Step:

1. Open **Task Scheduler**
2. Create Basic Task:
   - Name: `Daily Tablespace Check`
   - Trigger: Daily
   - Action: Start a program
     - Program/script: `C:\oracle_capstone_project\alerts\run_tablespace_check.bat`
3. Finish and enable task

Now your alert system runs every day!

---

## 📁 Task 5: Save Everything in GitHub

Update your folder structure:

```
C:\oracle_capstone_project\
├── alerts\
│   ├── check_tablespace.sql
│   ├── check_tablespace_alert.sql
│   └── run_tablespace_check.bat
│
├── logs\
│   └── tablespace_usage.log
│
└── README.md
```

Update your `README.md` to include:

```markdown
## ⚠️ Alert System

| Feature | Description |
|--------|-------------|
| Tablespace Checker | Queries datafile usage |
| Alert Threshold | Triggers if <20% free |
| Email Alert | Sent via PowerShell |
| Scheduled | Daily via Windows Task Scheduler |

Built by: [Your Name]  
Last Updated: 2025-06-10
```

---

## 🧪 Bonus Challenge (Optional)

Try enhancing your alert system:

| Enhancement | Description |
|-------------|-------------|
| Include tablespace name in email | Modify PowerShell script to read from log |
| Attach log file | Add attachment support in PowerShell |
| Add subject with actual usage | e.g., "hr_data is at 95% usage!" |

Let me know if you want help writing the enhanced version.

---

## 🚀 Next Steps

Once you’ve written and tested your alert system, reply:

> **“Week 3 Done”**

And I’ll continue with:

➡️ **Week 4: Build Backup Validator**

Where we’ll:
- Write RMAN backup script
- Validate backups completed successfully
- Store history in a table
- Schedule daily backups
- Notify if failed

You're doing amazing — keep going! 💪🔥
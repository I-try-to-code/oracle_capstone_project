# 📄 Oracle DBA Capstone Project – README.md

🎯 **My Journey Learning Oracle Database Administration (DBA)**

I'm learning Oracle DBA from scratch using **Oracle 19c XE on Windows**, and I've built a real-world lab environment that simulates a multi-department database system.

This project demonstrates:
- Installation & configuration
- User management
- Tablespace design
- Dashboards
- Monitoring
- Backup validation
- Alerting
- Automation with scripts

It's a complete hands-on journey from installation to advanced DBA tasks — all done by me step-by-step.

---

## ✅ Weeks Completed

### 🔹 Week 1: Build New Database Structure
- Created new Oracle database: `CAPSTONE`
- Set up separate tablespaces for each department:
  - `HR_DATA` for HR
  - `FINANCE_DATA` for Finance
  - `SALES_DATA` for Sales
- Created users: `hr_user`, `finance_user`, `sales_user`
- Added `admin_user` with read-only access to dashboards
- Secured with custom profile (`department_profile`)
- Folder structure created for easy management

---

### 🔹 Week 2: Department Dashboards
- Built sample tables per department
- Created views showing key metrics:
  - HR dashboard: total employees, salary stats
  - Finance dashboard: account balances
  - Sales dashboard: order values
- Built centralized admin dashboard combining data
- Tested cross-schema access and grants
- Made sure non-DBA users can run their own dashboards

---

### 🔹 Week 3: Tablespace Monitoring & Alerts
- Wrote tablespace usage script for DBA and regular users
- Created PL/SQL alert logic to detect low space (<20% free)
- Sent alerts via PowerShell email script
- Scheduled daily checks using Windows Task Scheduler
- Used `USER_SEGMENTS` and `DBA_DATA_FILES` for monitoring

---

### 🔹 Week 4: RMAN Backup & Validation System
- Wrote RMAN backup script (`rman_full_backup_cmd.sql`)
- Created `.bat` wrapper to run backups manually or scheduled
- Enabled **ARCHIVELOG mode** for full recoverability
- Configured archive log destination
- Captured output to log file: 
```
C:\oracle_capstone_project\logs\rman_backup_current.log
```
- Built validator script (`check_backup_result.bat`) that:
- Checks for `"channel c1: backup set complete"` to confirm success
- Logs result to:
  ```
  C:\oracle_capstone_project\logs\backup_status.log
  ```
- Enhanced PowerShell email alert script:
- Includes last lines from backup log
- Sends alert if backup failed
- Scheduled nightly backup using **Windows Task Scheduler**

---

## 🧩 Technologies Used

| Tool                   | Purpose                       |
|------------------------|-------------------------------|
| Oracle 19c XE          | Core database engine          |
| SQL*Plus               | Query execution and scripting |
| RMAN                   | Backup and recovery tool      |
| PowerShell             | Email alerts                  |
| Windows CMD            | Automation engine             |
| Windows Task Scheduler | Job scheduling                |
| GitHub                 | Version control and portfolio |

---

## 📁 Folder Structure
C:\oracle_capstone_project
│
├── admin/
│ └── grant_access.sql
|
├── alerts/
│ ├── check_tbs_alert.sql
| ├── check_tbs.sql
│ └── send_email.ps1
|
├── archivelogs/
|
├── backups/
│ ├── rman_full_backup.bat
│ ├── rman_full_backup_cmd.sql
│ └── check_backup_result.bat
|
├── dashboards/
│ ├── hr_dashboard.sql
│ ├── finance_dashboard.sql
│ └── sales_dashboard.sql
|
├── logs/
|
├── profiles/
│ └── create_profiles.sql
|
├── tablespaces/
│ └── create_tablespaces.sql
│
├── users/
| ├── create_admin_user.sql
| ├── login.sql
│ └── create_users.sql
│
├──Progress-report.md
|
└── README.md

 
---

## 💼 Skills Demonstrated

| Skill               | Description                                 |
|---------------------|---------------------------------------------|
| Oracle Installation | Installed Oracle 19c XE on Windows          |
| Database Creation   | Created fresh database `CAPSTON`            |
| Tablespace Design   | Separated storage by departmenT             |
| User Management     | Created secure users and roles              |
| Dashboard Building  | Created summary views per schema            |
| Space Monitoring    | Monitored tablespace usage and sent alerts  |
| Backup System       | Built RMAN-based backup solution            |
| Alert Logic         | Detected failures and sent email            |
| Scripting           | Wrote batch and SQL scripts for automation  |
| Scheduling          | Used Task Scheduler for daily jobs          |
| Documentation       | Maintained clear notes and folder structure |

---

## 🚀 What This Proves

This project proves that I:
- Understand Oracle architecture and logical structure
- Can design and manage secure environments
- Know how to monitor performance and space usage
- Have built real-world systems like backup validation and dashboards
- Can automate tasks using Windows and SQL
- Am capable of troubleshooting and fixing issues independently

---






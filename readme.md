# Oracle DBA Capstone Project  
## A Real-World Database Lab Built from Scratch  

🎓 I'm an aspiring student who started with zero knowledge and built this hands-on lab during my internship at Clover Infotech.  

This project simulates a production-like environment with automated backups, monitoring, alerting, and secure multi-schema design — all using **Oracle 19c on Windows**.


---

## 🚀 Overview: 

I designed and implemented a complete Oracle database environment that includes:

✅ **Secure Multi-Department Architecture**  
- HR, Finance, Sales schemas with dedicated tablespaces  
- Custom users (`hr_user`, `finance_user`, etc.)  
- Profiles with password policies and session limits  

✅ **Centralized Admin Access (No DBA)**  
- `admin_user` can view dashboards across departments without full privileges  
- Secure cross-schema access using `GRANT SELECT`  

✅ **Automated Tablespace Monitoring**  
- Script checks space usage in real time  
- Alerts when >80% used  
- Logs results to file  

✅ **RMAN Backup & Validation System**  
- Full RMAN backup script (`BACKUP DATABASE PLUS ARCHIVELOG`)  
- Runs nightly via Windows Task Scheduler  
- Validates success/failure by parsing logs  
- Sends email alerts if backup fails (PowerShell integration)  

✅ **Self-Monitoring & Automation**  
- Batch files for RMAN, validation, and alerts  
- PowerShell scripts for email notifications  
- Folder structure organized by feature and week  

---

## 🔧 Technologies Used

| Tool | Purpose |
|------|--------|
| Oracle 19c XE | Core database engine |
| SQL*Plus / RMAN | Query execution and backup |
| Windows CMD & .bat | Scripting and automation |
| PowerShell | Email alerts |
| Windows Task Scheduler | Job scheduling |
| GitHub | Version control and documentation |

---

## 📁 Project Structure

oracle-dba-lab/
├── tablespaces/ # TBS creation scripts
├── users/ # User & profile setup
├── dashboards/ # Department views
├── admin/ # Cross-schema access
├── alerts/ # Space monitoring + email
├── backups/ # RMAN scripts + validator
├── logs/ # Output logs
└── README.md # This file

## 💼 Skills Demonstrated

| Skill | How It's Shown |
|-------|----------------|
| Oracle Installation | Installed 19c XE, configured services |
| Instance Management | Started/stopped DB manually |
| Storage Management | Created tablespaces, managed datafiles |
| User & Security | Roles, profiles, least-privilege access |
| Backup & Recovery | RMAN full backup + restore simulation |
| Automation | Batch + PowerShell + Task Scheduler |
| Monitoring | Tablespace checker with alert logic |
| Scripting | SQL, PL/SQL, CMD, PowerShell |
| Documentation | Organized repo with clear README |

# Oracle Multi-Tenant Learning Lab – Capstone DBA Project

🎯 Simulating a real-world Oracle database environment for multiple departments in a new database called `CAPSTON`.

📁 This repo tracks my Oracle DBA journey from scratch.

## 🏢 Departments

| Dept    | Tablespace   | User         |            Profile |
|---------|--------------|--------------|--------------------|
| HR      | hr_data      | hr_user      | department_profile |
| Finance | finance_data | finance_user | department_profile |
| Sales   | sales_data   | sales_user   | department_profile |
| Admin   |     ----     | admin_user   | department_profile |

Admin user has read-only access to all department schemas.


## Week 2: Department Dashboards & Schema Separation

🎯 This week, I created **sample schemas** for HR, Finance, and Sales departments in my new Oracle database (`CAPSTONE`) and built **department-specific dashboards** using **views**.  
I also set up **cross-schema access** so the Admin user can view reports without full DBA rights.

---

## 🏢 Departments Simulated

| Dept    | Tablespace     | User           | Profile                |
|---------|----------------|----------------|----------------------|
| HR      | `hr_data`      | `hr_user`      | `department_profile` |
| Finance | `finance_data` | `finance_user` | `department_profile` |
| Sales   | `sales_data`   | `sales_user`   | `department_profile` |
| Admin   | `USERS`        | `admin_user`   | `department_profile` |

Admin user has **read-only access** to all department dashboards — no `DBA` or `SYSDBA` privileges.

---

## 📊 Dashboard Features Built

### 🔹 HR Dashboard (`hr_dashboard`)
### 🔹 Finance Dashboard (`finance_dashboard`)
### 🔹 Sales Dashboard (`sales_dashboard`)

---

## 👥 Admin Access & View Grants

Created `admin_user` and granted access to all dashboard views:

---

## 🧭 Centralized Admin Dashboard

Built a combined dashboard for managers/auditors:

Now `admin_user` can get a single report across departments.

---

## 📁 Folder Structure

```
C:\oracle_capstone_project\
│
├── dashboards/
│   ├── hr_tables.sql          # Creates HR table + sample data
│   ├── finance_tables.sql     # Creates Finance table + sample data
│   ├── sales_tables.sql       # Creates Sales table + sample data
│   ├── create_hr_dashboard.sql
│   ├── create_finance_dashboard.sql
│   └── create_sales_dashboard.sql
│
├── logs/
│   └── tablespace_usage.log   # For future alerts
│
├── users/
│   └── grant_view_privileges.sql
│
├── admin/
│   └── grant_dashboard_access.sql
│
└── README.md
```

---


| Skill | Description                                                          |
|-------|----------------------------------------------------------------------|
| Creating department tables   | Used realistic schemas for HR, Finance, Sales |
| Writing dashboard views      | Created summary metrics per department        |
| Managing cross-schema access | Used `GRANT SELECT ON view TO admin_user`     |
| Securing access              | Avoided giving DBA or SYSDBA                  |
| Scripting best practices     | Organized SQL files by function               |
| Testing queries manually     | Ran dashboard views from SQL*Plus             |

---

| Feature            | Description                      |
|--------------------|----------------------------------|
| Tablespace Checker | Queries datafile usage           |
| Alert Threshold    | Triggers if <20% free            |
| Email Alert        | Sent via PowerShell              |
| Scheduled          | Daily via Windows Task Scheduler |

---

Last Updated: 2025-06-16


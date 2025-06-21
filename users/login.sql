
🧠 Key Concept: User Permissions
Admin (admin_user) :
    Can see all dashboards and tablespaces
    Has read-only access to all department views
    Can monitor space usage across all departments

Department Users (hr_user, finance_user, etc.) :
    Can only see their own tables and views
    Cannot access other department data without proper grants


Login codes for each department afer pening sqlplusb

CONNECT admin_user/adminpass@CAPSTON
sqlplus admin_user/adminpass@CAPSTON

connect sales_user/salespass@CAPSTON
sqlplus sales_user/salespass@CAPSTON


connect hr_user/hrpass@CAPSTON
sqlplus hr_user/hrpass@CAPSTON




connect finance_user/financepass@CAPSTON
sqlplus finance_user/financepass@CAPSTON


SELECT * FROM hr_user.hr_dashboard;
SELECT * FROM finance_user.finance_dashboard;
SELECT * FROM sales_user.sales_dashboard;

as ADMIN user:
SELECT * FROM hr_user.employees;
SELECT * FROM finance_user.accounts;
SELECT * FROM sales_user.orders;



@C:\oracle_capstone_project\alerts\check_tbs_alert.sql

@C:\oracle_capstone_project\alerts\check_tbs.sql

@C:\scripts\login.sql

cd C:\oracle_capstone_project\backups\
rman_full_backup.bat

check_backup_result.bat
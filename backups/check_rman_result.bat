@echo off
echo Checking RMAN backup result...

findstr /c:"ORA-" C:\oracle_capstone_project\logs\rman_backup_current.log
if %errorlevel% == 0 (
    echo ERROR: Backup failed!
    goto :send_alert
)

findstr /c:"Finished backup at" C:\oracle_capston_project\logs\rman_backup_current.log
if %errorlevel% == 0 (
    echo SUCCESS: Backup completed successfully.
    goto :end
)

:send_alert
echo Sending alert...
powershell -File C:\oracle_capston_project\alerts\send_email.ps1

:end

@echo off
echo Checking RMAN backup result...

findstr /c:"ORA-" C:\oracle_capstone_project\logs\rman_backup_current.log
if %errorlevel% == 0 (
    echo ERROR: Backup failed!
     
)

findstr /c:"Finished backup at" C:\oracle_capston_project\logs\rman_backup_current.log
if %errorlevel% == 0 (
    echo SUCCESS: Backup completed successfully.
     
)

echo Check complete.
 
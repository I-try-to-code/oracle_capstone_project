@echo off
echo Checking RMAN backup result...

set LOG_FILE=C:\oracle_capstone_project\logs\rman_backup_current.log
set STATUS_LOG=C:\oracle_capstone_project\logs\backup_status.log

REM Clear previous status
echo. > %STATUS_LOG%

findstr /c:"channel c1: backup set complete" %LOG_FILE% | findstr /v "not found"
if %errorlevel% == 0 (
    echo Backup succeeded >> %STATUS_LOG%
) else (
    echo Backup failed >> %STATUS_LOG%
    echo Sending alert...
    powershell -File C:\Users\Vinod\Documents\send_mail.ps1
)
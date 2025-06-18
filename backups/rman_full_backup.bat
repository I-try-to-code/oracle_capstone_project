@echo off
echo Starting RMAN Full Backup at %date% %time% > C:\oracle_capstone_project\logs\rman_backup_current.log
echo. >> C:\oracle_capstone_project\logs\rman_backup_current.log

rman target / @C:\oracle_capstone_project\backups\rman_full_backup_cmd.sql >> C:\oracle_capstone_project\logs\rman_backup_current.log 2>&1

echo Backup completed at %date% %time% >> C:\oracle_capstone_project\logs\rman_backup.log
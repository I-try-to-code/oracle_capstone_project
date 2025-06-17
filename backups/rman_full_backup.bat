@echo off
echo Starting RMAN Full Backup at %date% %time% > C:\oracle_capstone_project\logs\rman_backup_current.log
echo. >> C:\oracle_capstone_project\logs\rman_backup_current.log

rman target / << EOF >> C:\oracle_capstone_project\logs\rman_backup_current.log
BACKUP DATABASE PLUS ARCHIVELOG;
EXIT;
EOF

echo Backup completed at %date% %time% >> C:\oracle_capstone_project\logs\rman_backup.log

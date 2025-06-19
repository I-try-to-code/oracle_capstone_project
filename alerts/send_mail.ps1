# Read last few lines of the log to include in email
$lastLogLines = Get-Content -Path "C:\oracle_capstone_project\logs\rman_backup_current.log" -Tail 20

# Convert log snippet into string
$emailBody = "🚨 The nightly RMAN backup did not complete successfully.`n`nLast log entries:`n" + ($lastLogLines -join "`n")

# Email settings
$EmailTo = "your_email@example.com"
$EmailFrom = "db_alert@company.local"
$Subject = "❌ RMAN Backup Failed!"

$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587
$SMTPUser = "your_email@gmail.com"
$SMTPPassword = "your_app_password"

# Send email
$Message = New-Object Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $emailBody)
$Smtp = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($SMTPUser, $SMTPPassword)

$Smtp.Send($Message)
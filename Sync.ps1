#Script2 – S3 logs sync
# Set log file path
$logDirectory = "C:\website-hit"
$s3Bucket = "mtechproj"
$s3Key = "website_logs/"
$statusLogFile = "C:\temp\Task2\status_log.txt"
# Check if the log directory exists
if (-Not (Test-Path $logDirectory)) {
 Write-Host "Log directory does not exist."
 exit
}
# Sync the log directory to AWS S3 and capture output
$syncOutput = aws s3 sync $logDirectory s3://$s3Bucket/$s3Key
# Check if the sync command was successful and if any files were copied
$syncSuccess = $LASTEXITCODE -eq 0 # Check if the last command was successful
if ($syncSuccess) {
 # Check if sync output indicates any files were copied
 if ($syncOutput -match "upload:") {
 $statusMessage = "Success: Logs synced to S3"
 } else {
 $statusMessage = "Info: No new files to sync."
 }
} else {
 $statusMessage = "Error: Failed to sync logs to S3"
}
# Log the completion/error status
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"$timestamp - $statusMessage" | Out-File -Append -FilePath $statusLogFile

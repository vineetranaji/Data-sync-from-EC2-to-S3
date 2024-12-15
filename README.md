# Data-sync-from-EC2-to-S3

Purpose: This PowerShell script is designed to synchronize log files from an EC2 instance to an AWS S3 bucket. It ensures that all logs are consistently backed up to S3, providing a reliable storage solution.

Workflow:
Set Log File Path and S3 Configuration:
Defines the directory containing the logs ($logDirectory), the S3 bucket ($s3Bucket), and the S3 key prefix ($s3Key).
Specifies the path for the status log file ($statusLogFile).

Check Log Directory:
Verifies if the log directory exists. If it doesn't, the script exits and logs an appropriate message.

Sync Logs to S3:
Uses the AWS CLI command aws s3 sync to synchronize the log directory to the specified S3 bucket.
Captures the output of the sync operation.

Check Sync Status:
Checks if the sync command executed successfully by examining the exit code ($LASTEXITCODE).
Determines if any files were uploaded by searching the sync output for the keyword "upload:".
Sets the appropriate status message based on the success or failure of the sync operation and whether files were uploaded.

Log the Results:
Captures the current timestamp.
Logs the status message (success, information, or error) with the timestamp to the status log file ($statusLogFile).

Key Features:
AWS S3 Sync: Ensures logs are backed up to AWS S3 using the aws s3 sync command.
Directory Check: Verifies the existence of the log directory before attempting sync.
Status Logging: Records the success or failure of the sync operation and any relevant information to a status log file.
Timestamped Logs: Provides a timestamp for each log entry to facilitate tracking and auditing.

This script ensures that logs from an EC2 instance are regularly synchronized to an S3 bucket, providing a secure and reliable backup solution. The detailed logging of operations helps in monitoring the sync process and troubleshooting any issues.

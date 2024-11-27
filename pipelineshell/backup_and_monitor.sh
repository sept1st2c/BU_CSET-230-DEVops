#!/bin/bash

# Example task: Backup files
echo "Starting backup..."

SOURCE_DIR="/home/sept1c/Documents"
DEST_DIR="/home/sept1c/backup"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist!"
    exit 1
fi

# Check if destination directory exists, create if not
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory does not exist. Creating it..."
    mkdir -p "$DEST_DIR"
fi

# Backup files
tar -czf "${DEST_DIR}/backup_$(date +'%Y-%m-%d').tar.gz" -C "$SOURCE_DIR" .
echo "Backup completed."

# Monitor disk usage
echo "Checking disk usage..."
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo "Current disk usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "Disk usage is above 80%. Current usage: ${DISK_USAGE}%"
    # Send email if disk usage exceeds 80%
    echo "Disk usage is ${DISK_USAGE}%" | mail -s "Disk Utilization Warning" your-email@example.com
else
    echo "Disk usage is below 80%. Current usage: ${DISK_USAGE}%"
fi

# Check if a process is running (e.g., jenkins)
PROCESS_STATUS=$(ps aux | grep jenkins | grep -v grep)

if [ -z "$PROCESS_STATUS" ]; then
    echo "Jenkins is not running!" | mail -s "Process Not Running" your-email@example.com
else
    echo "Jenkins process is running."
fi

echo "Backup and monitoring completed."


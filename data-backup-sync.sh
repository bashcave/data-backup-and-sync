#!/bin/bash

# Data Backup and Sync Script
# Performs incremental backups and synchronizes data to a remote server.
#
# @author BASHCAVE
# @version 1.0.0
# @license MIT

source_directory="/path/to/source" # Source directory to backup
backup_directory="/path/to/backup" # Local backup directory
remote_directory="user@remote_server:/path/to/remote/backup" # Remote server backup directory
timestamp=$(date +%Y%m%d_%H%M%S)
backup_log="backup_$timestamp.log"

# Create a local backup
echo "Starting local backup..."
rsync -avh --delete "$source_directory" "$backup_directory" > "$backup_log" 2>&1
echo "Local backup completed."

# Sync the backup to a remote server
echo "Syncing data to remote server..."
rsync -avz --delete "$backup_directory" "$remote_directory" >> "$backup_log" 2>&1
echo "Data sync to remote server completed."

echo "Backup and Sync operation finished. Check log: $backup_log"

#!/bin/bash

# Usage: ./backup_tool.sh /path/to/dir

if [ -z "$1" ]; then
    echo "Error: Please provide a directory path as an argument"
    exit 1
fi

SOURCE_DIR=$1
BACKUP_DIR="./backups"

# Create backup directory if it doesn't exist"
mkdir -p $BACKUP_DIR

# Copy files and log the result
cp -r $SOURCE_DIR $BACKUP_DIR
echo "Backup of $SOURCE_DIR completed at $(date)" >> backup_log.txt
echo "Files backed up to $BACKUP_DIR"
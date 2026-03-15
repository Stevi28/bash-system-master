#!/bin/bash
# ============================================
# Bash Backup Tool
# Usage: ./backup_tool.sh /path/to/dir [tar|zip]
# Arguments:
#   $1 = directory to backup
#   $2 = backup type: tar (default) or zip
# ============================================

SOURCE_DIR="$1"
BACKUP_DIR="$HOME/backups"
TYPE="${2:-tar}"  # Default to tar if not specified
LOG_FILE="$BACKUP_DIR/backup_log.txt"

# 1. Validate source argument was provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Error: No source directory provided."
    echo "Usage: $0 /path/to/directory [tar|zip]"
    exit 1
fi

# 2. Validate source directory actually exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# 3. Create backup directory if needed
mkdir -p "$BACKUP_DIR"

# 4. Build timestamped filename
FILENAME="backup_$(date +%Y%m%d_%H%M%S)"

# 5. Perform backup based on type
case "$TYPE" in
    "tar")
        OUTPUT="$BACKUP_DIR/$FILENAME.tar.gz"
        tar -czf "$OUTPUT" "$SOURCE_DIR"
        if [ $? -eq 0 ]; then
            echo "OK: Tarball created at $OUTPUT"
        else
            echo "Error: tar backup failed."
            exit 1
        fi
        ;;
    "zip")
        OUTPUT="$BACKUP_DIR/$FILENAME.zip"
        zip -r "$OUTPUT" "$SOURCE_DIR"
        if [ $? -eq 0 ]; then
            echo "OK: Zip file created at $OUTPUT"
        else
            echo "Error: zip backup failed."
            exit 1
        fi
        ;;
    *)
        echo "Error: Invalid type '$TYPE'. Use 'tar' or 'zip'."
        exit 1
        ;;
esac

# 6. Log the result to a consistent location
echo "[$(date)] Backed up '$SOURCE_DIR' -> '$OUTPUT'" >> "$LOG_FILE"

echo ""
echo "-----------------------------------"
echo "Backup complete!"
echo "  Source:  $SOURCE_DIR"
echo "  Output:  $OUTPUT"
echo "  Log:     $LOG_FILE"
echo "-----------------------------------"
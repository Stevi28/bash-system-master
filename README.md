# Bash-System-Master

A robust suite of Bash scripts designed for automated Linux system monitoring and data management. This project applies the core principles of Shell scripting—variables, conditional logic, loops, and process automation—as taught in the **freeCodeCamp Linux Curriculum**.

---

##  Features

### 1. System Health Monitor (`health_check.sh`)

- **Automated Logging**: Saves detailed reports with timestamps to a dedicated `~/logs` folder.
- **Disk Usage Alert**: Uses `df` and `awk` to calculate root partition health and issues an `ALERT` if usage exceeds 80%, or a `WARNING` if above 60%.
- **Memory Tracking**: Provides a snapshot of used vs. total RAM in human-readable format.
- **Process Analysis**: Lists the **top 5 memory-consuming** and **top 3 CPU-consuming** processes.
- **System Uptime**: Displays human-readable uptime and load averages (1m / 5m / 15m).

### 2. Intelligent Backup Tool (`backup_tool.sh`)

- **Multi-Format Support**: Uses a `case` statement to support both `.tar.gz` and `.zip` formats.
- **Safety Checks**: Validates that the source directory exists before attempting a backup.
- **Timestamped Output**: Every backup is named with a `YYYYMMDD_HHMMSS` timestamp to avoid overwrites.
- **Consistent Logging**: Appends a record of every backup to `~/backups/backup_log.txt`.

---

##  Cron Ready: Automation Setup

This project is designed to run without user intervention. To schedule the **System Health Monitor** to run every day at midnight:

1. Open your crontab editor:
   ```bash
   crontab -e
   ```

2. Add the following line (replace `/path/to/` with your actual directory path):
   ```bash
   0 0 * * * /bin/bash /path/to/bash-system-master/health_check.sh
   ```

3. Save and exit. Your system will now generate a health log automatically every 24 hours.

> **Note:** The script uses `$HOME` for all paths, making it safe for cron execution regardless of the working directory.

---

##  Manual Usage

### Prerequisites

Give execution permissions to the scripts:

```bash
chmod u+x health_check.sh backup_tool.sh
```

### System Health Monitor

```bash
./health_check.sh
```

You will be prompted for your name. The report is printed to the screen and saved to `~/logs/health_report.log`.

### Backup Tool

```bash
# Default: tar.gz backup
./backup_tool.sh /path/to/directory

# Zip backup
./backup_tool.sh /path/to/directory zip
```

Backups are saved to `~/backups/` with a timestamped filename. A log entry is appended to `~/backups/backup_log.txt` after each run.

---

##  Project Structure

```
bash-system-master/
├── health_check.sh       # System health monitor
├── backup_tool.sh        # Backup utility
├── .gitignore            # Excludes logs, backups, and OS files
└── README.md
```

---

##  Requirements

- Bash 4.0+
- Standard Linux utilities: `df`, `free`, `ps`, `awk`, `tar`, `zip`
- `zip` package (for zip backups): `sudo apt install zip`
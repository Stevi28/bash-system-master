# Bash System Master

A project built based on the freeCodeCamp Bash Scripting Tutorial. This suite automates routine Linux tasks.

## Features
- **Health Checks**: Monitors disk space and memory usage.
- **Automated Backups**: Easily back up directories via command line arguments.
- **Cron Ready**: Designed to be scheduled for automation.

## How to Run
1. Give execution permissions:
   ```bash
   chmod u+x system_health.sh backup_tool.sh
2. Run the Health Check:
   ```bash
   ./system_health.sh
3. Run a backup
   ```bash
   ./backup_tool.sh /path/to/your/folder
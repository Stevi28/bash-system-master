#!/bin/bash

# This script uses variables, conditionals, and basic commands to check your system status
# --- Bash System Health Checker ---

# 1. Variables and Input
echo "Enter your name to start the report:"
read user_name
echo "Generating report for $user_name..."
echo "-----------------------------------"

# 2. Date and System Info
echo "Today is: $(date)"
echo "Current directory: $(pwd)"
echo "Logged in as: $(whoami)"

# 3. Conditional: Check Disk Space
# Using 'df' -disk free- to see if disk usage is above 80 %
usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is high ($usage%)!"
else
    echo " Disk usage is healthy ($usage%)."
fi

# 4. Loop: List active processes (Top 5)
echo -e "\nTop 5 Memory Consuming Processes:"
ps aux --sort=-%mem | head -n 6

echo "-----------------------------------"
echo "Report Complete!"
   
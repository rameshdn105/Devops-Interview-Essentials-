#!/bin/bash

# Set the threshold (e.g., 70%)
THRESHOLD=70
EMAIL="your-email@example.com"
SUBJECT="High CPU Usage Alert"

# Get the overall CPU usage (idle time is the 8th field in top output)
CPU_USAGE=$(top -b -n 1 | awk 'NR==3 {print 100-$8}')

echo "Current CPU Usage: $CPU_USAGE%"

# Check if CPU usage is greater than the threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "CPU Usage is above $THRESHOLD%! Sending alert email..."

    # Prepare email body
    MESSAGE="Warning: High CPU Usage detected!\n\nCurrent CPU Usage: $CPU_USAGE%\n\nTop 10 CPU-consuming processes:\n$(ps -eo pid,comm,%cpu --sort=-%cpu | head -10)"

    # Send email (install mailx if needed: sudo apt install mailutils or sudo yum install mailx)
    echo -e "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
fi

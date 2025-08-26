#!/bin/bash
# Operating system version
os_version=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d '"' -f 2)
# Date and time
current_date=$(date "+%Y-%m-%d")
current_time=$(date "+%H:%M:%S")
# System uptime
uptime_info=$(uptime -p)
# System load
system_load=$(uptime | awk -F'[a-z]:' '{ print $2 }')
# Disk usage
disk_usage=$(df / | awk '{print $5}' | sed 's/%//')
# Top processes by memory usage
top_processes=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6)
# Number of processes
process_count=$(ps -ef | wc -l)
# Number of users
user_count=$(who | wc -l)
# Print report
echo "System Report"
echo "Operating system version: $os_version"
echo "Date: $current_date"
echo "Time: $current_time"
echo "System uptime: $uptime_info"
echo "System load: $system_load"
echo "Disk usage: $disk_usage"
echo "Top processes by memory usage:"
echo "$top_processes"
echo "Number of processes: $process_count"
echo "Number of users: $user_count"
#!/bin/bash

## To collect CPU, Memory and Disk usage report from the server
## Format: Hostname, Date&Time, CPU%, Mem% and Disk%

LOG_FILE="/var/log/server_health.log"
API_BASE_URL="http://16.16.28.140:8000"
STUDENTS_ENDPOINT="$API_BASE_URL/students"
SUBJECTS_ENDPOINT="$API_BASE_URL/subjects"
DISK_THRESHOLD=10

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
HOSTNAME=$(hostname)

check_endpoint() {
    local url=$1
    local response=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    if [ "$response" -eq 200 ]; then
        echo "200 OK"
    else
        echo " $response"
    fi
}

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | awk '{printf("%.2f", $1)}')
MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

DISK_WARNING="OK"
if [ "$DISK_USAGE" -gt $((100 - $DISK_THRESHOLD)) ]; then
    DISK_WARNING="Low Space"
fi

if systemctl is-active --quiet apache2; then
    APACHE_STATUS="Running"
else
    APACHE_STATUS="Not Running"
fi

STUDENTS_STATUS=$(check_endpoint "$STUDENTS_ENDPOINT")
SUBJECTS_STATUS=$(check_endpoint "$SUBJECTS_ENDPOINT")

{
    echo "Server Health Report - $TIMESTAMP"
    printf "%-20s : %s\n" "Hostname" "$HOSTNAME"
    printf "%-20s : %s%%\n" "CPU Usage" "$CPU_USAGE"
    printf "%-20s : %s%%\n" "Memory Usage" "$MEMORY_USAGE"
    printf "%-20s : %s%% ($DISK_WARNING)\n" "Disk Usage" "$DISK_USAGE"
    printf "%-20s : %s\n" "Apache Server" "$APACHE_STATUS"
    printf "%-20s : %s\n" "/students Endpoint" "$STUDENTS_STATUS"
    printf "%-20s : %s\n" "/subjects Endpoint" "$SUBJECTS_STATUS"
    echo ""
} >> "$LOG_FILE"





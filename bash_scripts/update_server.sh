#!/bin/bash

# === CONFIGURATION ===
GIT_DIR="/var/www/html/cs421_assignment"
WEB_SERVICE="apache2"                   
LOG_FILE="/var/log/update.log"

# === FUNCTIONS ===
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# === SCRIPT ===

log_message "=== Starting server update ==="

# Update and upgrade Ubuntu packages
log_message "Updating package list and upgrading packages..."
apt update && apt upgrade -y
if [ $? -eq 0 ]; then
    log_message "System packages updated successfully."
else
    log_message "Failed to update system packages."
    exit 1
fi

# Navigate to the project directory
cd "$GIT_DIR" || { log_message "Failed to find project directory: $GIT_DIR"; exit 1; }

# Pull latest changes from GitHub
log_message "Pulling latest changes from GitHub..."
git pull
if [ $? -eq 0 ]; then
    log_message "Git pull successful."
else
    log_message "Git pull FAILED. Exiting without restarting server."
    exit 1
fi

# Restart the web server
log_message "Restarting web server: $WEB_SERVICE..."
systemctl restart "$WEB_SERVICE"
if [ $? -eq 0 ]; then
    log_message "Web server restarted successfully."
else
    log_message "Failed to restart web server."
    exit 1
fi

log_message "=== Server update completed successfully ==="

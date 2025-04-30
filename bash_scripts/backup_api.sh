#!/bin/bash
API_DIR="/var/www/html/cs421_assignment"
BACKUP_DIR="/var/www/html/cs421_assignment/backups"
DATE=$(date +%F)
LOG_FILE="/var/log/backup.log"

DB_TYPE="mysql"
MYSQL_USER="root"
MYSQL_PASSWORD="Aaronpaul@100"
MYSQL_DATABASE="api_db"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

mkdir -p "$BACKUP_DIR"

log_message "Starting API project backup..."

tar -czvf "$BACKUP_DIR/api_backup_${DATE}.tar.gz" -C "$API_DIR" . > /dev/null 2>&1
if [ $? -eq 0 ]; then
    log_message "API project backup successful: api_backup_${DATE}.tar.gz"
else
    log_message "API project backup FAILED."
fi

if [ "$DB_TYPE" == "mysql" ]; then
    log_message "Starting MySQL database backup..."
    mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > "$BACKUP_DIR/db_backup_${DATE}.sql"
    if [ $? -eq 0 ]; then
        log_message "MySQL database backup successful: db_backup_${DATE}.sql"
    else
        log_message "MySQL database backup FAILED."
    fi
fi

log_message "Cleaning up old backups..."
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;
if [ $? -eq 0 ]; then
    log_message "Old backups deleted successfully."
else
    log_message "Failed to delete old backups."
fi

log_message "Backup script completed."

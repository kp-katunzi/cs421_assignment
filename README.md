# 🎓 University Management API

![API Status](https://img.shields.io/badge/status-active-brightgreen)
![PHP Version](https://img.shields.io/badge/PHP-8.0%2B-blue)
![MySQL Version](https://img.shields.io/badge/MySQL-5.7%2B-orange)
![Backup Status](https://img.shields.io/badge/Backup-Automated-brightgreen)
![Script Status](https://img.shields.io/badge/Script-Working-success)
![License](https://img.shields.io/badge/License-MIT-blue)



A modern RESTful API for university data management, built with PHP using object-oriented programming principles.

## ✨ Features

- 🧑‍🎓 Student management endpoint (`/students`)
- 📚 Subject catalog endpoint (`/subjects`)
- 🗂️ JSON-formatted responses
- 🗃️ MySQL database integration
- 🛣️ RESTful routing architecture
- 🔒 Secure database interactions
- 📊 Structured response formats

## 🚀 Quick Start

### Prerequisites

| Requirement | Version | Installation Guide |
|-------------|---------|--------------------|
| PHP | 8.0+ | [PHP Installation](https://www.php.net/manual/en/install.php) |
| MySQL | 5.7+ | [MySQL Installation](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) |
| Apache/Nginx | Latest | [Apache Guide](https://httpd.apache.org/docs/2.4/install.html) |

## 🌐 API Endpoints

### Base URL
`http://ec2-13-60-14-29.eu-north-1.compute.amazonaws.com:8080`

### Endpoint Reference

| 📍 Endpoint | 🔧 Method | 📝 Description | 🔗 Live Demo |
|------------|----------|---------------|-------------|
| `/students` | `GET` | Retrieve all student records | [View Students](http://ec2-13-60-14-29.eu-north-1.compute.amazonaws.com:8080/students) |
| `/subjects` | `GET` | List all academic subjects | [View Subjects](http://ec2-13-60-14-29.eu-north-1.compute.amazonaws.com:8080/subjects) |

### Example Requests

```bash
# cURL Example
curl -X GET "http://ec2-13-60-14-29.eu-north-1.compute.amazonaws.com:8080/students" \
     -H "Accept: application/json"
     
     
```
### Response Schema

```bash
{
  "Year 4": [
    {
      "id": 6,
      "name": "Machine Learning",
      "program_id": 1,
      "year_id": 4,
      "description": null,
      "credits": null,
      "created_at": "2025-03-28 00:20:36"
    }
  ]
}

```
### 🏗️ Project Architecture

```plaintext
deployment_assignment/
├── 📂 api/                          # API Core
│   └── 🧭 UniversityAPI.php        # Main router & request handler
│
├── 📂 controllers/                  # Business Logic
│   ├── 🧑‍🎓 StudentController.php    # Handles student operations
│   └── 📚 SubjectController.php     # Manages subject operations
│
├── 📂 models/                       # Data Layer
│   ├── 🗃️ Student.php              # Student data operations
│   └── 🗂️ Subject.php              # Subject data operations
|    └── 🗂️ Connection.php              # DB connection objects
│
├── 📂 config/                       # Configuration
│   ├── 🔑 db.php              # DB connection settings
│   └── 🏛️ schema.sql               # Database schema
│
├── 📜 index.php                     # Application entry point
├── 📜 .htaccess                     # URL rewrite rules
└── 📜 README.md                     # Project documentation

```
### 🛠️ Installation Guide
git clone https://github.com/edibily12/deploymeent_assignment.git
cd deployment_assignment

### Database Setup
CREATE DATABASE ap_db;
CREATE USER 'api_user'@'localhost' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON university_db.* TO 'api_user'@'localhost';
FLUSH PRIVILEGES;

## Data backup
DATA BACKUP is the process of creating the copy of data to protect against the data loss.
This can be due to various reasons such as hardware failure, cyberattacks, accidental deletions, or natural disasters. Implementing a robust data backup strategy is crucial for ensuring data protection and disaster recovery. Different types of data backup methods, such as full, incremental, differential, and hybrid backups, offer various advantages and disadvantages.

1. 	Full Backup Method
A full backup is the most straightforward and comprehensive method of data backup. It involves copying all the data from a source to a backup medium, creating a complete replica each time a backup is performed.
Advantages:
 -	Comprehensive Protection 
 Full backups provide a complete snapshot of your data, making   recovery straightforward.
 -	Simplified Restoration 
 Restoring from a full backup is efficient, as it requires only the latest backup file.

Disadvantages:
 -	High Storage Needs 
    Full backups require considerable storage space because they duplicate all data with each backup.
 -	Time-Consuming:
    Executing a full backup can be time-intensive, especially for large data sets.

Full backups are essential for creating a complete, reliable copy of your data, but due to their storage and time demands, they are often scheduled less frequently in backup routines.

2.	Incremental Backup
Incremental backups are more efficient than full backups. They save only the data that has changed since the last backup—whether it was a full or incremental backup. This method involves backing up all the files that have changed since the last backup. Tracking the last incremental backup is crucial to ensure efficient data backup and restoration processes.

Advantages:
 -	Storage Efficiency 
     Incremental backups use less storage space since they only save changes made after the last backup.
 - Faster Backup Process
   These backups are quicker because they involve less data.
Disadvantages:
 -	Complex Restoration
     Restoring requires the last full backup and all subsequent incremental backups, which can be complex and time-consuming.
-	Higher Risk of Data Loss
   If one incremental backup is corrupted or missing, all subsequent backups could be rendered useless.

Incremental backups are well-suited for environments with frequent data changes, where efficient storage utilization is essential.

3.	Differential Backup
Types of backup include full, incremental, and differential backups, each with unique implications for data security, restoration times, and storage requirements.
Differential backups provide a balance between full and incremental backups by saving all data that has changed since the last full backup. Unlike incremental backups, differential backups do not reset after each backup, causing them to increase in size as more data is modified

Advantages:
 -	Simplified Restoration 
      Only the last full backup and the most recent differential backup are needed for restoration, simplifying the process compared to incremental backups.
 -	Less Storage Than Full Backups:
      While larger than incremental backups, differential backups require less storage than performing a full backup each time.
Disadvantages:
 -	Growing Size
      As differential backups accumulate data, they become progressively larger, eventually nearing the size of a full backup.

Differential backups are commonly used to balance the storage and restoration needs, making them a practical choice for regular backups between full backups.


## 📋 About

This project provides a **fully automated backup** solution for both the **API project files** and the **MySQL database**.  
It ensures regular backups and cleans up old backups, keeping your server storage efficient and safe.

## 🛠️ Script Features

- 📦 Compresses API project files
- 🗄️ Dumps MySQL database
- 🗑️ Automatically deletes backups older than 7 days
- 🧹 Organized backup folder

## 🔧 How It Works

1. Compresses project files using `tar`.
2. Exports the MySQL database with `mysqldump`.
3. Saves both files into the `backups/` directory.
4. Deletes backups older than **7 days** to save space.
5. Logs every action into `/var/log/backup.log`.

## 📅 Cronjob Setup

To automate daily backups at 2:00 AM:
```bash
  0 2 * * * /bin/bash /var/www/html/cs421_assignment/bash_scripts/backup.sh


## 📂 Files Generated // Backup Outputs

- `api_backup_2025-04-18.tar.gz` → Backup of project files.
- `api_backup_2025-04-19.tar.gz` → Backup of project files.
- `db_backup_2025-04-18.sql` → Backup of MySQL database.
- `db_backup_2025-04-19.sql` → Backup of MySQL database.

 Example log entry:

2025-04-19 16:53:50 - API project backup successful: api_backup_2025-04-19.tar.gz
2025-04-19 16:53:50 - MySQL database backup successful: db_backup_2025-04-19.sql
2025-04-19 16:53:50 - Old backups deleted successfully.
2025-04-19 16:53:50 - Backup script completed.
2025-04-19 17:18:33 - Starting API project backup...
2025-04-19 17:18:33 - API project backup successful: api_backup_2025-04-19.tar.gz
2025-04-19 17:18:33 - Starting MySQL database backup...
2025-04-19 17:18:33 - MySQL database backup successful: db_backup_2025-04-19.sql
2025-04-19 17:18:33 - Cleaning up old backups...
2025-04-19 17:18:33 - Old backups deleted successfully.
2025-04-19 17:18:33 - Backup script completed.
2025-04-19 17:26:21 - Starting API project backup...
2025-04-19 17:26:21 - API project backup successful: api_backup_2025-04-19.tar.gz
2025-04-19 17:26:21 - Starting MySQL database backup...
2025-04-19 17:26:21 - MySQL database backup successful: db_backup_2025-04-19.sql
2025-04-19 17:26:21 - Cleaning up old backups...
2025-04-19 17:26:21 - Old backups deleted successfully.
2025-04-19 17:26:21 - Backup script completed.

📂 Directory Structure

/var/www/html/cs421_assignment/
 ├── bash_scripts/
 │    ├── backup.sh
 │    └── update.sh
      └── health_check.sh
 ├── backups/
 │    ├── api_backup_DATE.tar.gz
 │    └── db_backup_DATE.sql
 └── README.md

 
##  📈 health_check.sh
    Checks CPU, memory, and disk usage

    Monitors Apache server status

    Verifies /students and /subjects API endpoints

    Logs server health status to /var/www/html/cs421_assignment/bash_scripts/server_health.log

    ## 📅 Cronjob Setup

To automate  To collect CPU, Memory and Disk usage report from the server at every 6 hours:
```bash
  0 */6 * * * /bin/bash /var/www/html/cs421_assignment/bash_scripts/health_check.sh >> /var/log/server_health.log2>&1

  ##Example of health :
  sudo cat /var/log/server_health.log
  #output
  Server Health Report - 2025-04-18 12:00:01
-----------------------------------------------------------
Hostname             : ip-172-31-18-186
CPU Usage            : 9.50%
Memory Usage         : 80.79%
Disk Usage           : 42% (OK)
Apache Server        : ✅ Running
/students Endpoint   : ✅ 200 OK
/subjects Endpoint   : ✅ 200 OK
-----------------------------------------------------------

-----------------------------------------------------------
Server Health Report - 2025-04-18 18:00:01
-----------------------------------------------------------
Hostname             : ip-172-31-18-186
CPU Usage            : 9.10%
Memory Usage         : 82.68%
Disk Usage           : 42% (OK)
Apache Server        : ✅ Running
/students Endpoint   : ✅ 200 OK
/subjects Endpoint   : ✅ 200 OK
-----------------------------------------------------------



##🔄 update_server.sh

    Updates Ubuntu packages (apt update/upgrade)

    Pulls latest code from GitHub

    Restarts Apache server

    Logs results to /var/log/update.log

 ## 📅 Cronjob Setup
 To automate Update server and pull latest code every  3 days at 3 AM.
0 3 */3 * * /bin/bash /var/www/html/cs421_assignment/bash_scripts/update_server.sh >> /var/log/update.log2>&1

## example update:

2025-04-18 22:57:00 - === Starting server update ===
2025-04-18 22:57:00 - Updating package list and upgrading packages...
2025-04-18 22:57:08 - System packages updated successfully.
2025-04-18 22:57:08 - Pulling latest changes from GitHub...
2025-04-18 22:57:09 - Git pull FAILED. Exiting without restarting server.
2025-04-18 22:58:52 - === Starting server update ===
2025-04-18 22:58:52 - Updating package list and upgrading packages...
2025-04-18 22:58:56 - System packages updated successfully.
2025-04-18 22:58:56 - Pulling latest changes from GitHub...
2025-04-18 22:58:56 - Git pull FAILED. Exiting without restarting server.
2025-04-18 23:00:52 - === Starting server update ===
2025-04-18 23:00:52 - Updating package list and upgrading packages...
2025-04-18 23:00:55 - System packages updated successfully.
2025-04-18 23:00:55 - Pulling latest changes from GitHub...
2025-04-18 23:00:56 - Git pull successful.
2025-04-18 23:00:56 - Restarting web server: apache2...
2025-04-18 23:00:56 - Web server restarted successfully.
2025-04-18 23:00:56 - === Server update completed successfully ===
2025-04-19 17:26:21 - === Starting server update ===
2025-04-19 17:26:21 - Updating package list and upgrading packages...
2025-04-19 17:26:28 - System packages updated successfully.
2025-04-19 17:26:28 - Pulling latest changes from GitHub...
2025-04-19 17:26:29 - Git pull successful.
2025-04-19 17:26:29 - Restarting web server: apache2...
2025-04-19 17:26:29 - Web server restarted successfully.
2025-04-19 17:26:29 - === Server update completed successfully ===



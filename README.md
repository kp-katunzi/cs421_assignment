# 🎓 University Management API

![API Status](https://img.shields.io/badge/status-active-brightgreen)
![PHP Version](https://img.shields.io/badge/PHP-8.0%2B-blue)
![MySQL Version](https://img.shields.io/badge/MySQL-5.7%2B-orange)

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



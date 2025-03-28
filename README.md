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
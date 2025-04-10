# Employee Attendance System 

##  Project Overview
The **Employee Attendance System** is designed to manage and track employee attendance efficiently.  
This project uses **MySQL** as the database and **Power BI** for visualization.

##  Features
 Employee Management (50+ Employees)  
 Attendance Tracking (Check-in & Check-out)  
 Leave Management (Sick, Casual, Annual)  
 Role-based Access (Admin & Employee)  
 Power BI Dashboard for Attendance Analysis  

---

##  Tech Stack
- **Database**: MySQL  
- **Data Visualization**: Power BI  

---

##  Database Schema
###  Employees Table
| Column | Type | Description |
|--------|------|-------------|
| employee_id | INT (PK) | Unique Employee ID |
| name | VARCHAR(100) | Employee Name |
| department | VARCHAR(50) | Department Name |
| role | VARCHAR(50) | Employee Role |
| email | VARCHAR(100) | Unique Email |
| phone | VARCHAR(15) | Contact Number |
| hire_date | DATE | Date of Joining |

###  Attendance Table
| Column | Type | Description |
|--------|------|-------------|
| attendance_id | INT (PK) | Unique Attendance ID |
| employee_id | INT (FK) | References Employees Table |
| check_in | DATETIME | Check-in Time |
| check_out | DATETIME | Check-out Time |
| status | ENUM | Present, Absent, Leave |

###  Leaves Table
| Column | Type | Description |
|--------|------|-------------|
| leave_id | INT (PK) | Unique Leave ID |
| employee_id | INT (FK) | References Employees Table |
| leave_date | DATE | Leave Date |
| leave_type | ENUM | Sick, Casual, Annual |
| status | ENUM | Pending, Approved, Rejected |

###  Users Table (Login System)
| Column | Type | Description |
|--------|------|-------------|
| user_id | INT (PK) | Unique User ID |
| employee_id | INT (FK) | References Employees Table |
| username | VARCHAR(50) | Login Username |
| password_hash | VARCHAR(255) | Encrypted Password |
| role | ENUM | Admin, Employee |

---





-- Step 1: Create Database
CREATE DATABASE EmployeeAttendanceDB;
USE EmployeeAttendanceDB;

-- Step 2: Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    role VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    hire_date DATE
);

-- Step 3: Create Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    check_in DATETIME,
    check_out DATETIME,
    status ENUM('Present', 'Absent', 'Leave') DEFAULT 'Present',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- Step 4: Create Leaves Table
CREATE TABLE leaves (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    leave_date DATE,
    leave_type ENUM('Sick', 'Casual', 'Annual'),
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- Step 5: Create Users Table (For Login System)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT UNIQUE,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Employee') DEFAULT 'Employee',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- Step 6: Insert 50 Employees
INSERT INTO employees (name, department, role, email, phone, hire_date) VALUES
('John Doe', 'HR', 'Manager', 'john.doe@example.com', '9876543210', '2023-01-10'),
('Jane Smith', 'IT', 'Developer', 'jane.smith@example.com', '9876543211', '2022-06-15'),
('Robert Brown', 'Finance', 'Accountant', 'robert.brown@example.com', '9876543212', '2021-03-20'),
('Emily Johnson', 'HR', 'Recruiter', 'emily.johnson@example.com', '9876543213', '2022-09-30'),
('Michael Williams', 'IT', 'Data Analyst', 'michael.williams@example.com', '9876543214', '2024-02-10'),
('Sarah Davis', 'Marketing', 'Executive', 'sarah.davis@example.com', '9876543215', '2023-07-05'),
('David Miller', 'IT', 'Developer', 'david.miller@example.com', '9876543216', '2020-05-25'),
('Olivia Wilson', 'Finance', 'Analyst', 'olivia.wilson@example.com', '9876543217', '2019-11-15'),
('James Taylor', 'Sales', 'Sales Executive', 'james.taylor@example.com', '9876543218', '2021-08-01'),
('Sophia Martinez', 'IT', 'Data Scientist', 'sophia.martinez@example.com', '9876543219', '2022-12-12'),
('Ethan Anderson', 'IT', 'Network Engineer', 'ethan.anderson@example.com', '9876543220', '2023-05-18'),
('Isabella Thomas', 'HR', 'HR Executive', 'isabella.thomas@example.com', '9876543221', '2020-04-22'),
('Daniel White', 'Operations', 'Supervisor', 'daniel.white@example.com', '9876543222', '2021-09-05'),
('Ava Harris', 'Marketing', 'Manager', 'ava.harris@example.com', '9876543223', '2018-07-14'),
('Matthew Clark', 'Sales', 'Sales Manager', 'matthew.clark@example.com', '9876543224', '2022-03-30'),
('Mia Lewis', 'Finance', 'Auditor', 'mia.lewis@example.com', '9876543225', '2021-11-27'),
('Lucas Walker', 'IT', 'Support Engineer', 'lucas.walker@example.com', '9876543226', '2023-01-05'),
('Charlotte Hall', 'Operations', 'Logistics Coordinator', 'charlotte.hall@example.com', '9876543227', '2020-06-08'),
('Benjamin Allen', 'Finance', 'Tax Consultant', 'benjamin.allen@example.com', '9876543228', '2019-12-19'),
('Ella Young', 'HR', 'HR Manager', 'ella.young@example.com', '9876543229', '2022-08-17');

-- Adding 30 more employees dynamically
INSERT INTO employees (name, department, role, email, phone, hire_date)
SELECT 
    CONCAT('Employee_', FLOOR(1000 + RAND() * 9000)),
    CASE FLOOR(RAND() * 5) 
        WHEN 0 THEN 'IT' 
        WHEN 1 THEN 'HR' 
        WHEN 2 THEN 'Finance' 
        WHEN 3 THEN 'Marketing' 
        ELSE 'Operations' 
    END,
    CASE FLOOR(RAND() * 4) 
        WHEN 0 THEN 'Developer' 
        WHEN 1 THEN 'Analyst' 
        WHEN 2 THEN 'Manager' 
        ELSE 'Executive' 
    END,
    CONCAT('employee', FLOOR(1000 + RAND() * 9000), '@example.com'),
    CONCAT('98765', FLOOR(10000 + RAND() * 90000)),
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 2000) DAY)
FROM employees LIMIT 30;

-- Step 7: Insert Sample Attendance Data
INSERT INTO attendance (employee_id, check_in, check_out, status)
SELECT employee_id, 
       DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY) AS check_in, 
       DATE_ADD(DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY), INTERVAL 8 HOUR) AS check_out, 
       'Present' 
FROM employees 
LIMIT 50;

-- Step 8: Insert Sample Leave Requests
INSERT INTO leaves (employee_id, leave_date, leave_type, status)
SELECT employee_id, DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 10) DAY), 
       CASE FLOOR(RAND() * 3) 
           WHEN 0 THEN 'Sick' 
           WHEN 1 THEN 'Casual' 
           ELSE 'Annual' 
       END, 
       CASE FLOOR(RAND() * 3) 
           WHEN 0 THEN 'Pending' 
           WHEN 1 THEN 'Approved' 
           ELSE 'Rejected' 
       END 
FROM employees LIMIT 10;

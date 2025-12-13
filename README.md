# 🎓 College University Management System

A full-stack **College Management System** developed using **React.js, Node.js, Express.js, and MySQL**.  
This application helps manage students, staff, courses, admissions, attendance, results, and administrative activities in an efficient and user-friendly way.

> 📌 This project is created for **academic and learning purposes**.

---

## 🛠️ Technologies Used

- **Frontend:** React.js, HTML, CSS
- **Backend:** Node.js, Express.js
- **Database:** MySQL
- **Tools:** VS Code, MySQL Workbench

---

## ✨ Features

- Student Management  
- Staff & Faculty Management  
- Course & Department Management  
- Admissions Handling  
- Attendance & Results  
- Admin Dashboard  
- Secure Authentication  
- Database-driven application  
- User-friendly interface  

---

## 📁 Project Structure

college-management-system/
│
├── client/ # React frontend
├── server/ # Node.js backend
├── database/ # MySQL SQL file
├── README.md
└── .gitignore

yaml
Copy code

---

## ⚙️ Installation & Setup (Step by Step)

Follow the steps below carefully to run the project.

---

## 🔹 Step 1: Download the Project

You can either:

- Clone the repository  
  ```bash
  git clone https://github.com/your-username/college-management-system.git
OR

Download the ZIP file and extract it

**🔹 Step 2: Frontend Setup (React)**
Open terminal

Navigate to the client folder:

bash
Copy code
cd client
Install dependencies:

bash
Copy code
npm install
Start the React app:

bash
Copy code
npm start
📍 Frontend will run at:

arduino
Copy code
http://localhost:3000
**🔹 Step 3: Backend Setup (Node.js)**
Open a new terminal

Go to the server folder:

bash
Copy code
cd server
Install backend dependencies:

bash
Copy code
npm install
Start the backend server:

bash
Copy code
npm start

📍 Backend will run at:

arduino
Copy code
http://localhost:5000

**🗄️ Database Setup (MySQL)**
This project uses MySQL as the database.
It stores all information related to students, staff, admissions, courses, attendance, results, fees, library, and more.

**🔹 Step 4: Create the Database**
Open MySQL Workbench or Command Line

Run the following commands:

sql
Copy code
CREATE DATABASE IF NOT EXISTS north_gate_university;
USE north_gate_university;
**🔹 Step 5: Import SQL File**

**📁 SQL file location:**

pgsql
Copy code
/database/north_gate_university.sql
Method 1: MySQL Workbench
File → Open SQL Script

Select the SQL file

Click Execute

Method 2: Command Line
bash
Copy code
mysql -u root -p north_gate_university < north_gate_university.sql

**📊 Database Tables Overview**

Major tables included:

users – Authentication and roles

students – Student details

staff – Staff & faculty

courses – Courses and programs

admission_applications – Admissions

student_attendance – Attendance

student_results – Results

fee_payments – Fees

library_books, library_issues – Library

events – College events

news_announcements – Notices

scholarships – Scholarships

placement_records – Placements


**📌 Sample Data Included**

The database already contains sample data for:

Courses

Events

News & Announcements

Scholarships

Student Clubs

This helps in testing the application immediately.


**🚀 Database Features**

Proper foreign key relationships

Indexes for faster queries

Views for common data access

Stored procedures for complex queries

Data integrity using constraints


**🔍 Views Available**

active_students – All active students

recent_admissions – Last 30 days admissions

upcoming_events – Future events

featured_news – Highlighted announcements


**⚙️ Stored Procedures**

GetStudentDetails

GetStudentAttendance

GetStudentResults

GetUpcomingEvents


**🔐 Environment Configuration**

Create a .env file inside the server folder:

env
Copy code
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=north_gate_university


**✅ How to Verify Setup**

Run in MySQL:

sql
Copy code
SHOW TABLES;
If tables are visible, setup is successful ✅


**📌 Notes**

Designed for educational purposes

Can be extended with:

Online payment integration

Role-based access control

Reporting dashboards


**⭐ Conclusion**

This project demonstrates a complete full-stack College Management System using modern web technologies and a well-structured database.

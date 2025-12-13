# College-University-Management-System
A full-stack College Management System built using HTML, CSS, React, Node.js, and MySQL. It manages students, staff, courses, departments and authentication with a clean UI and secure backend APIs


# College Management System

The College Management System is a full-stack web application developed to manage and automate college-related activities.  
This project helps in handling students, faculty, courses, and administrative tasks in a simple and efficient way.

This project is created for **academic and learning purposes**.

---

## 🛠️ Technologies Used

- Frontend: React.js  
- Backend: Node.js with Express.js  
- Database: MySQL  
- Tools: VS Code 

---

## ✨ Features

- college activities 
- Course Management  
- Admin Dashboard  
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


---

## ⚙️ Installation & Setup (Step by Step)

Follow the steps below to run this project on your system.

---

### Step 1: Download the Project

- Clone the repository from GitHub  
OR  
- Download the ZIP file and extract it

---

### Step 2: Frontend Setup (React)

1. Open terminal  
2. Go to client folder:

```bash
cd client

## Install required packages:

npm install

## Start the React app:

npm start

## Frontend will run at:

http://localhost:3000


**📘 Database Setup – North Gate University**

## 🗄️ Database Setup (MySQL)

This project uses **MySQL** as the database.  
The database stores all information related to users, students, staff, admissions, courses, attendance, results, fees, library, hostels, transport, events, scholarships, and placements.

---

## 📌 Database Name

north_gate_university


---

## ⚙️ Requirements

Before setting up the database, make sure you have:

- MySQL Server installed  
- MySQL Workbench or Command Line  
- Basic knowledge of SQL  

---

## 📁 Database File Location

The database SQL file is available in the project folder:



---

## 🧩 Step-by-Step Database Setup

Follow the steps below carefully.

---

### Step 1: Start MySQL Server

- Open **MySQL Workbench**  
OR  
- Start MySQL from Command Line

---

### Step 2: Create the Database

Run the following command:

```sql
CREATE DATABASE IF NOT EXISTS north_gate_university;


Then select the database:

USE north_gate_university;


🧱 Database Tables Overview

The database includes the following major tables:

users – Authentication and roles

students – Student details

staff – Staff and faculty information

courses – Course and program details

admission_applications – Student admissions

contact_submissions – Website contact form data

events – Academic and cultural events

news_announcements – Notices and announcements

scholarships – Scholarship details

library_books & library_issues – Library management

student_attendance – Attendance records

student_results – Academic results

fee_payments – Fee transactions

hostel_applications – Hostel requests

transport_applications – Transport requests

student_clubs & club_memberships – Student clubs

placement_records – Placement information


📊 Sample Data Included

The SQL file already contains sample data for:

Courses

Events

News & Announcements

Scholarships

Student Clubs

This helps in testing the application immediately.


🚀 Database Features

Proper foreign key relationships

Indexes for faster queries

Views for common data access

Stored Procedures for complex queries

Data integrity using constraints


🔍 Views Available

active_students – All active students

recent_admissions – Last 30 days applications

upcoming_events – Future events

featured_news – Highlighted announcements


⚙️ Stored Procedures Available

GetStudentDetails

GetStudentAttendance

GetStudentResults

GetUpcomingEvents

These procedures help retrieve data efficiently.


🔐 Database Configuration (Backend)

Update your backend .env file with the following:

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=north_gate_university


✅ Verify Database Setup

After importing the database, run:

SHOW TABLES;

If all tables are visible, the database setup is successful.

📌 Notes

This database is designed for educational purposes

Can be extended with:

Online payment gateways

Role-based access control

Advanced reporting dashboards


▶️ How to Use

Start backend server

Start frontend application

Open browser and go to http://localhost:3000

Login as Admin or User

Manage students, faculty, and courses


🎯 Purpose of the Project

Academic mini/major project

Learning full-stack development

Understanding React, Node.js, and MySQL integration


👨‍💻 Developer

Name: Your Name

Course: MCA

Project Type: College Management System


📌 Note

This project is developed only for educational purposes.
Further enhancements can be added like:

Role-based access

Attendance system

Payment module

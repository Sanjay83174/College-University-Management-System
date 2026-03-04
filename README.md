# 🎓 College University Management System

A full-stack **College Management System** built using modern web technologies.

This application helps manage:

- 🎓 Students  
- 👨‍🏫 Staff & Faculty  
- 📚 Courses & Departments  
- 📝 Admissions  
- 📊 Attendance & Results  
- 💳 Fees  
- 📖 Library  
- 📢 Events & Announcements  

📌 This project is developed for academic and learning purposes.

---

# 🛠️ Technologies Used

## 🌐 Frontend
- React.js  
- HTML5  
- CSS3  

## ⚙️ Backend
- Node.js  
- Express.js  

## 🗄️ Database
- MySQL  

## 🧰 Tools
- VS Code  
- MySQL Workbench  

---

# ✨ Features

- 👨‍🎓 Student Management  
- 👩‍🏫 Staff & Faculty Management  
- 📘 Course & Department Management  
- 📝 Admission Handling  
- 📅 Attendance Tracking  
- 📊 Results Management  
- 🛡️ Secure Authentication  
- 📊 Admin Dashboard  
- 🗄️ Database-driven system  
- 🖥️ User-friendly interface  

---

# 📂 Project Structure

```
college-management-system/
│
├── client/            # React frontend
├── server/            # Node.js backend
├── database/          # MySQL SQL file
├── public/            # Setup & schema reference files
├── README.md
└── .gitignore
```

---

# ⚙️ Installation & Setup

Follow these steps carefully to run the project.

---

## 🔹 Step 1: Clone the Repository

```bash
git clone https://github.com/Sanjay83174/College-University-Management-System.git
cd college-management-system
```

OR download the ZIP file and extract it.

---

# 🌐 Frontend Setup (React)

## 🔹 Step 2: Setup Client

Open terminal and navigate to the client folder:

```bash
cd client
```

Install dependencies:

```bash
npm install
```

Start the React application:

```bash
npm start
```

📍 Frontend runs at:

```
http://localhost:3000
```

---

# ⚙️ Backend Setup (Node.js)

## 🔹 Step 3: Setup Server

Open a new terminal and go to the server folder:

```bash
cd server
```

Install backend dependencies:

```bash
npm install
```

Start the backend server:

```bash
npm start
```

📍 Backend runs at:

```
http://localhost:5000
```

---

# 🗄️ Database Setup (MySQL)

This project uses **MySQL** to store all data related to:

- Students  
- Staff  
- Admissions  
- Courses  
- Attendance  
- Results  
- Fees  
- Library  
- Events  
- News & Announcements  

---

## 🔹 Step 4: Create the Database

Open **MySQL Workbench** or Command Line and run:

```sql
CREATE DATABASE IF NOT EXISTS north_gate_university;
USE north_gate_university;
```

⚠️ Important:  
In `database.js`, update the MySQL password according to your system.

---

## 🔹 Step 5: Import SQL File

📁 SQL File Location:

```
/database/north_gate_university.sql
```

### Method 1: MySQL Workbench

1. File → Open SQL Script  
2. Select the SQL file  
3. Click Execute  

### Method 2: Command Line

```bash
mysql -u root -p north_gate_university < north_gate_university.sql
```

---

# 📊 Database Tables Overview

Major tables included:

- users (Authentication & roles)
- students
- staff
- courses
- admission_applications
- student_attendance
- student_results
- fee_payments
- library_books
- library_issues
- events
- news_announcements
- scholarships
- placement_records

---

# 📌 Sample Data Included

The database contains sample data for:

- Courses  
- Events  
- News & Announcements  
- Scholarships  
- Student Clubs  

This allows immediate testing after setup.

---

# 🚀 Database Features

- Proper foreign key relationships  
- Indexed tables for performance  
- Views for common queries  
- Stored procedures for complex operations  
- Data integrity with constraints  

---

# 🔍 Views Available

- active_students  
- recent_admissions  
- upcoming_events  
- featured_news  

---

# ⚙️ Stored Procedures

- GetStudentDetails  
- GetStudentAttendance  
- GetStudentResults  
- GetUpcomingEvents  

---

# 🔐 Environment Configuration

Create a `.env` file inside the `server` folder:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=north_gate_university
```

Make sure your MySQL credentials are correct.

---

# ✅ How to Verify Setup

Run in MySQL:

```sql
SHOW TABLES;
```

If tables are visible, setup is successful ✅

---

# 📌 Notes

- Designed for educational purposes  
- Can be extended with:
  - Online payment integration  
  - Role-based access control  
  - Advanced reporting dashboards  
  - Cloud deployment  

For detailed schema and setup reference, check the `public` folder.

---

# 👨‍💻 Author

Sanjay HL  
Full-Stack Developer  

If you found this project useful, please ⭐ star the repository!

---

# 📜 License

This project is developed for academic and educational purposes.

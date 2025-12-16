-- North Gate University Database Schema
-- This file contains all the necessary tables to store user data from the website

-- Create the database
CREATE DATABASE IF NOT EXISTS north_gate_university;
USE north_gate_university;

-- Users table for authentication
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'staff', 'admin', 'applicant') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contact form submissions
CREATE TABLE contact_submissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('new', 'read', 'replied', 'closed') DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Admission applications
CREATE TABLE admission_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT NOT NULL,
    course_interested VARCHAR(100) NOT NULL,
    parent_name VARCHAR(100) NOT NULL,
    parent_phone VARCHAR(20) NOT NULL,
    previous_school VARCHAR(200) NOT NULL,
    marks_percentage DECIMAL(5,2) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    application_status ENUM('submitted', 'under_review', 'approved', 'rejected', 'waitlisted') DEFAULT 'submitted',
    application_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Students table (for enrolled students)
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    student_id VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address TEXT NOT NULL,
    course_enrolled VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    year_of_admission YEAR NOT NULL,
    parent_name VARCHAR(100) NOT NULL,
    parent_phone VARCHAR(20) NOT NULL,
    emergency_contact VARCHAR(20),
    blood_group VARCHAR(5),
    nationality VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Staff table
CREATE TABLE staff (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    staff_id VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    department VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    qualification VARCHAR(200),
    experience_years INT,
    joining_date DATE NOT NULL,
    address TEXT NOT NULL,
    emergency_contact VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Courses table
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    duration_years INT NOT NULL,
    total_semesters INT NOT NULL,
    seats_available INT NOT NULL,
    seats_filled INT DEFAULT 0,
    fee_per_semester DECIMAL(10,2) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Events table
CREATE TABLE events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    event_time TIME,
    venue VARCHAR(200),
    event_type ENUM('academic', 'cultural', 'sports', 'technical', 'other') NOT NULL,
    target_audience ENUM('students', 'staff', 'all', 'public') DEFAULT 'all',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- News and announcements
CREATE TABLE news_announcements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    category ENUM('general', 'academic', 'placement', 'sports', 'cultural', 'important') NOT NULL,
    target_audience ENUM('students', 'staff', 'all', 'public') DEFAULT 'all',
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Scholarships table
CREATE TABLE scholarships (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    amount DECIMAL(10,2) NOT NULL,
    eligibility_criteria TEXT,
    application_deadline DATE NOT NULL,
    scholarship_type ENUM('merit_based', 'need_based', 'sports', 'cultural', 'research') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Scholarship applications
CREATE TABLE scholarship_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    scholarship_id INT NOT NULL,
    application_status ENUM('submitted', 'under_review', 'approved', 'rejected') DEFAULT 'submitted',
    documents_submitted TEXT,
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (scholarship_id) REFERENCES scholarships(id) ON DELETE CASCADE
);

-- Hostel applications
CREATE TABLE hostel_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    room_type ENUM('single', 'double', 'triple') NOT NULL,
    meal_plan ENUM('breakfast', 'lunch', 'dinner', 'all_meals') NOT NULL,
    application_status ENUM('submitted', 'approved', 'rejected', 'allocated') DEFAULT 'submitted',
    room_number VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Transport applications
CREATE TABLE transport_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    route_name VARCHAR(100) NOT NULL,
    pickup_point VARCHAR(200) NOT NULL,
    drop_point VARCHAR(200) NOT NULL,
    application_status ENUM('submitted', 'approved', 'rejected') DEFAULT 'submitted',
    pass_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Library books
CREATE TABLE library_books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher VARCHAR(100),
    publication_year YEAR,
    category VARCHAR(50) NOT NULL,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    location VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Library book issues
CREATE TABLE library_issues (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(8,2) DEFAULT 0.00,
    status ENUM('issued', 'returned', 'overdue') DEFAULT 'issued',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES library_books(id) ON DELETE CASCADE
);

-- Student attendance
CREATE TABLE student_attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('present', 'absent', 'late', 'excused') NOT NULL,
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_attendance (student_id, course_id, date)
);

-- Student results
CREATE TABLE student_results (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester INT NOT NULL,
    subject VARCHAR(100) NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,
    total_marks DECIMAL(5,2) NOT NULL DEFAULT 100.00,
    grade VARCHAR(2),
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Fee payments
CREATE TABLE fee_payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    semester INT NOT NULL,
    academic_year YEAR NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('online', 'cash', 'cheque', 'bank_transfer') NOT NULL,
    transaction_id VARCHAR(100),
    status ENUM('pending', 'completed', 'failed', 'refunded') DEFAULT 'pending',
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Student clubs
CREATE TABLE student_clubs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    club_name VARCHAR(100) NOT NULL,
    description TEXT,
    category ENUM('technical', 'cultural', 'sports', 'social', 'academic') NOT NULL,
    faculty_incharge VARCHAR(100),
    meeting_schedule TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Club memberships
CREATE TABLE club_memberships (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    club_id INT NOT NULL,
    role ENUM('member', 'secretary', 'treasurer', 'president') DEFAULT 'member',
    joined_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES student_clubs(id) ON DELETE CASCADE
);

-- Placement records
CREATE TABLE placement_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    company_name VARCHAR(200) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    package_amount DECIMAL(10,2) NOT NULL,
    placement_date DATE NOT NULL,
    job_location VARCHAR(100),
    job_type ENUM('full_time', 'internship', 'contract') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Insert sample data for courses
INSERT INTO courses (course_code, course_name, department, duration_years, total_semesters, seats_available, fee_per_semester, description) VALUES
('BTECH-CSE', 'B.Tech Computer Science', 'Computer Science', 4, 8, 120, 75000.00, 'Bachelor of Technology in Computer Science and Engineering'),
('BTECH-IT', 'B.Tech Information Technology', 'Information Technology', 4, 8, 80, 70000.00, 'Bachelor of Technology in Information Technology'),
('BTECH-ECE', 'B.Tech Electronics & Communication', 'Electronics', 4, 8, 100, 72000.00, 'Bachelor of Technology in Electronics and Communication Engineering'),
('BTECH-EEE', 'B.Tech Electrical & Electronics', 'Electrical', 4, 8, 80, 72000.00, 'Bachelor of Technology in Electrical and Electronics Engineering'),
('BTECH-MECH', 'B.Tech Mechanical', 'Mechanical', 4, 8, 90, 70000.00, 'Bachelor of Technology in Mechanical Engineering'),
('BTECH-CIVIL', 'B.Tech Civil', 'Civil', 4, 8, 70, 68000.00, 'Bachelor of Technology in Civil Engineering'),
('BSC-CS', 'B.Sc Computer Science', 'Computer Science', 3, 6, 60, 45000.00, 'Bachelor of Science in Computer Science'),
('BCOM', 'B.Com', 'Commerce', 3, 6, 100, 35000.00, 'Bachelor of Commerce'),
('BBA', 'BBA', 'Business Administration', 3, 6, 80, 40000.00, 'Bachelor of Business Administration'),
('MBA', 'MBA', 'Business Administration', 2, 4, 60, 120000.00, 'Master of Business Administration'),
('MTECH-CSE', 'M.Tech Computer Science', 'Computer Science', 2, 4, 30, 100000.00, 'Master of Technology in Computer Science');

-- Insert sample events
INSERT INTO events (title, description, event_date, event_time, venue, event_type, target_audience) VALUES
('Annual Sports Meet', 'Annual sports competition featuring various athletic events', '2024-07-15', '09:00:00', 'University Stadium', 'sports', 'students'),
('Tech Fest 2024', 'Annual technical festival showcasing student projects', '2024-09-20', '10:00:00', 'Main Auditorium', 'technical', 'all'),
('Cultural Night', 'Annual cultural program featuring music and dance', '2024-10-05', '18:00:00', 'Open Air Theatre', 'cultural', 'all'),
('Career Fair', 'Job fair with leading companies', '2024-11-10', '10:00:00', 'Conference Hall', 'academic', 'students');

-- Insert sample news
INSERT INTO news_announcements (title, content, category, target_audience, is_featured) VALUES
('Admissions Open for 2024-25', 'Applications are now open for all undergraduate and postgraduate programs for the academic year 2024-25.', 'important', 'public', TRUE),
('New Research Center Inaugurated', 'The university has inaugurated a new state-of-the-art research center for artificial intelligence and machine learning.', 'academic', 'all', TRUE),
('Annual Sports Meet on 15th July', 'The annual sports meet will be held on 15th July 2024. All students are encouraged to participate.', 'sports', 'students', FALSE),
('Campus Placements: 95% Success Rate', 'Our students achieved 95% placement success rate with top companies offering excellent packages.', 'placement', 'students', TRUE);

-- Insert sample scholarships
INSERT INTO scholarships (name, description, amount, eligibility_criteria, application_deadline, scholarship_type) VALUES
('Merit Scholarship', 'Scholarship for students with excellent academic performance', 50000.00, 'Minimum 90% in 12th standard', '2024-06-30', 'merit_based'),
('Sports Scholarship', 'Scholarship for outstanding sports achievements', 30000.00, 'State or national level sports achievements', '2024-06-30', 'sports'),
('Need-based Scholarship', 'Financial assistance for economically disadvantaged students', 40000.00, 'Family income below 5 lakhs per annum', '2024-06-30', 'need_based');

-- Insert sample student clubs
INSERT INTO student_clubs (club_name, description, category, faculty_incharge, meeting_schedule) VALUES
('Coding Club', 'Technical club for programming enthusiasts', 'technical', 'Dr. Amit Kumar', 'Every Saturday 2:00 PM'),
('Dance Club', 'Cultural club for dance and music', 'cultural', 'Ms. Priya Sharma', 'Every Friday 4:00 PM'),
('Football Club', 'Sports club for football players', 'sports', 'Mr. Rajesh Singh', 'Every Sunday 6:00 AM'),
('Photography Club', 'Creative club for photography enthusiasts', 'cultural', 'Mr. Suresh Verma', 'Every Saturday 3:00 PM');

-- Create indexes for better performance
CREATE INDEX idx_contact_email ON contact_submissions(email);
CREATE INDEX idx_admission_email ON admission_applications(email);
CREATE INDEX idx_student_email ON students(email);
CREATE INDEX idx_student_course ON students(course_enrolled);
CREATE INDEX idx_event_date ON events(event_date);
CREATE INDEX idx_news_category ON news_announcements(category);
CREATE INDEX idx_library_title ON library_books(title);
CREATE INDEX idx_attendance_date ON student_attendance(date);
CREATE INDEX idx_payment_date ON fee_payments(payment_date);

-- Create views for common queries
CREATE VIEW active_students AS
SELECT * FROM students WHERE is_active = TRUE;

CREATE VIEW recent_admissions AS
SELECT * FROM admission_applications 
WHERE created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
ORDER BY created_at DESC;

CREATE VIEW upcoming_events AS
SELECT * FROM events 
WHERE event_date >= CURDATE() AND is_active = TRUE
ORDER BY event_date ASC;

CREATE VIEW featured_news AS
SELECT * FROM news_announcements 
WHERE is_featured = TRUE AND is_active = TRUE
ORDER BY created_at DESC;

-- Create stored procedures
DELIMITER //

CREATE PROCEDURE GetStudentDetails(IN student_email VARCHAR(100))
BEGIN
    SELECT s.*, c.course_name, c.department
    FROM students s
    JOIN courses c ON s.course_enrolled = c.course_name
    WHERE s.email = student_email AND s.is_active = TRUE;
END //

CREATE PROCEDURE GetStudentAttendance(IN student_id INT, IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT sa.*, c.course_name
    FROM student_attendance sa
    JOIN courses c ON sa.course_id = c.id
    WHERE sa.student_id = student_id 
    AND sa.date BETWEEN start_date AND end_date
    ORDER BY sa.date DESC;
END //

CREATE PROCEDURE GetStudentResults(IN student_id INT, IN semester INT)
BEGIN
    SELECT sr.*, c.course_name
    FROM student_results sr
    JOIN courses c ON sr.course_id = c.id
    WHERE sr.student_id = student_id AND sr.semester = semester
    ORDER BY sr.subject;
END //

CREATE PROCEDURE GetUpcomingEvents(IN days_ahead INT)
BEGIN
    SELECT * FROM events 
    WHERE event_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL days_ahead DAY)
    AND is_active = TRUE
    ORDER BY event_date ASC;
END //

DELIMITER ;

-- Grant permissions (adjust as needed for your MySQL setup)
-- GRANT ALL PRIVILEGES ON north_gate_university.* TO 'your_username'@'localhost';
-- FLUSH PRIVILEGES;

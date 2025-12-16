# North Gate University - Database Setup Guide

This guide will help you set up the MySQL database and connect it to your university website.

## Prerequisites

1. **MySQL Server** (version 5.7 or higher)
2. **Node.js** (version 14 or higher)
3. **npm** (comes with Node.js)

## Step 1: Install MySQL

### Windows:
1. Download MySQL Installer from: https://dev.mysql.com/downloads/installer/
2. Run the installer and follow the setup wizard
3. Remember the root password you set during installation

### macOS:
```bash
brew install mysql
brew services start mysql
```

### Linux (Ubuntu/Debian):
```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
```

## Step 2: Create Database and Tables

1. **Open MySQL Command Line Client** or use MySQL Workbench
2. **Login to MySQL**:
   ```bash
   mysql -u root -p
   ```
   Enter your password when prompted

3. **Run the Database Schema**:
   ```sql
   -- Copy and paste the entire content of database_schema.sql
   -- This will create the database and all tables
   ```

   Or run it from command line:
   ```bash
   mysql -u root -p < database_schema.sql
   ```

## Step 3: Configure Backend

1. **Navigate to the backend directory**:
   ```bash
   cd backend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Create environment file**:
   ```bash
   # Copy the example file
   cp env.example .env
   ```

4. **Edit the .env file** with your MySQL credentials:
   ```env
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your_mysql_password_here
   DB_NAME=north_gate_university
   DB_PORT=3306
   PORT=5000
   NODE_ENV=development
   ```

## Step 4: Test Database Connection

1. **Start the backend server**:
   ```bash
   npm start
   ```

2. **Check the console output** - you should see:
   ```
   ✅ Database connected successfully
   🚀 North Gate University Server running on port 5000
   🌐 Frontend: http://localhost:5000
   🔗 API: http://localhost:5000/api
   💾 Database: north_gate_university
   ```

3. **Test the API health endpoint**:
   - Open your browser and go to: `http://localhost:5000/api/health`
   - You should see a JSON response indicating the API is running

## Step 5: Test Form Submissions

1. **Open the website**: `http://localhost:5000`

2. **Test Contact Form**:
   - Go to Contact page
   - Fill out the contact form
   - Submit the form
   - Check the database to see if the data was stored

3. **Test Admission Form**:
   - Go to Admissions page
   - Fill out the admission application
   - Submit the form
   - Check the database to see if the data was stored

## Database Tables Created

The following tables are created in the database:

### Core Tables:
- `users` - User authentication and roles
- `contact_submissions` - Contact form submissions
- `admission_applications` - Admission applications
- `students` - Enrolled students
- `staff` - University staff
- `courses` - Available courses

### Academic Tables:
- `student_attendance` - Student attendance records
- `student_results` - Student exam results
- `fee_payments` - Fee payment records

### Campus Life Tables:
- `events` - University events
- `news_announcements` - News and announcements
- `scholarships` - Available scholarships
- `student_clubs` - Student clubs and organizations
- `library_books` - Library book catalog
- `library_issues` - Book borrowing records

### Support Tables:
- `hostel_applications` - Hostel accommodation requests
- `transport_applications` - Transport pass applications
- `placement_records` - Student placement records

## API Endpoints

The following API endpoints are available:

### Form Submissions:
- `POST /api/contact` - Submit contact form
- `POST /api/admission` - Submit admission application

### Data Retrieval:
- `GET /api/courses` - Get all courses
- `GET /api/events` - Get upcoming events
- `GET /api/news` - Get featured news
- `GET /api/scholarships` - Get available scholarships
- `GET /api/clubs` - Get student clubs
- `GET /api/stats` - Get university statistics

### Utility:
- `GET /api/health` - API health check
- `GET /api/search` - Search functionality

## Troubleshooting

### Database Connection Issues:
1. **Check MySQL service is running**:
   ```bash
   # Windows
   net start mysql
   
   # macOS
   brew services start mysql
   
   # Linux
   sudo systemctl start mysql
   ```

2. **Verify credentials** in `.env` file

3. **Test MySQL connection**:
   ```bash
   mysql -u root -p
   ```

### Port Already in Use:
If port 5000 is already in use, change the PORT in `.env` file:
```env
PORT=3000
```

### CORS Issues:
The backend is configured with CORS to allow frontend requests. If you're still getting CORS errors, check that the frontend is being served from the correct port.

## Sample Data

The database comes with sample data for:
- Courses (11 different programs)
- Events (4 upcoming events)
- News announcements (4 featured news items)
- Scholarships (3 different types)
- Student clubs (4 clubs)

## Security Notes

1. **Change default MySQL password** after installation
2. **Use environment variables** for sensitive data
3. **Regular database backups** are recommended
4. **Update dependencies** regularly for security patches

## Next Steps

1. **Add more sample data** to populate the database
2. **Implement user authentication** for student/staff portals
3. **Add admin panel** for managing data
4. **Implement email notifications** for form submissions
5. **Add file upload functionality** for documents

## Support

If you encounter any issues:
1. Check the console logs for error messages
2. Verify database connection settings
3. Ensure all dependencies are installed
4. Check that MySQL service is running

The database is now fully connected to your university website and all form submissions will be stored in MySQL!

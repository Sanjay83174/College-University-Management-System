# North Gate University - University Website

A modern, responsive university website built with HTML, CSS, JavaScript, and Node.js.

## Features

- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Modern UI**: Clean and professional design with Bootstrap 5
- **Multiple Pages**: Comprehensive university website with various sections
- **Interactive Forms**: Contact forms, admission forms, and other interactive elements
- **Static File Server**: Simple Express.js backend to serve the frontend files

## Project Structure

```
fullstackCursor/
├── backend/
│   ├── app.js              # Express server
│   ├── package.json        # Dependencies
│   └── README.md
├── frontend/
│   ├── index.html          # Homepage
│   ├── about.html          # About page
│   ├── admissions.html     # Admission form
│   ├── contact.html        # Contact form
│   ├── academics.html      # Academics page
│   ├── placements.html     # Placements page
│   ├── student-portal.html # Student portal
│   ├── staff-portal.html   # Staff portal
│   ├── *_sidebar.html      # Various sidebar forms
│   ├── style.css           # Main stylesheet
│   └── script.js           # JavaScript functionality
└── README.md              # This file
```

## Setup Instructions

### Prerequisites
- **Node.js** (version 14 or higher)
- **npm** (comes with Node.js)

### Installation

1. **Navigate to the backend directory:**
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Start the server:**
   ```bash
   npm start
   ```

   Or for development with auto-restart:
   ```bash
   npm run dev
   ```

4. **Access the website:**
   Open your browser and go to: `http://localhost:5000`

## Pages and Features

### Main Pages
- **Homepage** (`/`) - University overview and navigation
- **About** (`/about.html`) - University information and history
- **Academics** (`/academics.html`) - Academic programs and departments
- **Admissions** (`/admissions.html`) - Admission application form
- **Contact** (`/contact.html`) - Contact information and form
- **Placements** (`/placements.html`) - Placement statistics and information
- **Student Portal** (`/student-portal.html`) - Student resources
- **Staff Portal** (`/staff-portal.html`) - Staff resources

### Sidebar Forms
- Alumni registration
- Research inquiries
- Hostel inquiries
- Sports inquiries
- Club interests
- Canteen feedback
- Scholarship inquiries
- News submissions
- Career inquiries
- FAQ questions

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Backend**: Node.js, Express.js
- **Styling**: Custom CSS with Bootstrap framework
- **Icons**: Font Awesome
- **Fonts**: Google Fonts (Montserrat)

## Development

### Running in Development Mode
```bash
cd backend
npm run dev
```

This will start the server with nodemon for automatic restarts when files change.

### File Structure
- All frontend files are in the `frontend/` directory
- The backend server serves static files from the frontend directory
- Forms are client-side only (no database backend)

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## License

This project is for educational purposes.

## Contact

For any questions or support, please contact the development team.

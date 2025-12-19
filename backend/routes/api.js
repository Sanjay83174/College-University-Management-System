const express = require('express');
const router = express.Router();
const { executeQuery, executeTransaction } = require('../database');

// Contact form submission
router.post('/contact', async (req, res) => {
  try {
    const { name, email, phone, message } = req.body;
    
    // Validate required fields
    if (!name || !email || !phone || !message) {
      return res.status(400).json({
        success: false,
        message: 'All fields are required'
      });
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({
        success: false,
        message: 'Please enter a valid email address'
      });
    }

    // Validate phone number (10 digits)
    const phoneRegex = /^[0-9]{10}$/;
    if (!phoneRegex.test(phone)) {
      return res.status(400).json({
        success: false,
        message: 'Please enter a valid 10-digit phone number'
      });
    }

    const query = `
      INSERT INTO contact_submissions (name, email, phone, message)
      VALUES (?, ?, ?, ?)
    `;
    
    const result = await executeQuery(query, [name, email, phone, message]);
    
    if (result.success) {
      res.status(201).json({
        success: true,
        message: 'Your message has been sent successfully! We will get back to you soon.',
        data: { id: result.data.insertId }
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to submit message. Please try again.',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Contact form error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Admission application submission
router.post('/admission', async (req, res) => {
  try {
    const {
      full_name,
      email,
      phone,
      date_of_birth,
      gender,
      address,
      course_interested,
      parent_name,
      parent_phone,
      previous_school,
      marks_percentage,
      nationality
    } = req.body;

    // Validate required fields
    const requiredFields = [
      'full_name', 'email', 'phone', 'date_of_birth', 'gender',
      'address', 'course_interested', 'parent_name', 'parent_phone',
      'previous_school', 'marks_percentage', 'nationality'
    ];

    for (const field of requiredFields) {
      if (!req.body[field]) {
        return res.status(400).json({
          success: false,
          message: `${field.replace(/_/g, ' ')} is required`
        });
      }
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({
        success: false,
        message: 'Please enter a valid email address'
      });
    }

    // Validate phone numbers (10 digits)
    const phoneRegex = /^[0-9]{10}$/;
    if (!phoneRegex.test(phone) || !phoneRegex.test(parent_phone)) {
      return res.status(400).json({
        success: false,
        message: 'Please enter valid 10-digit phone numbers'
      });
    }

    // Validate marks percentage
    const marks = parseFloat(marks_percentage);
    if (isNaN(marks) || marks < 0 || marks > 100) {
      return res.status(400).json({
        success: false,
        message: 'Please enter valid marks percentage (0-100)'
      });
    }

    // Generate application number
    const applicationNumber = 'APP' + Date.now() + Math.floor(Math.random() * 1000);

    const query = `
      INSERT INTO admission_applications (
        full_name, email, phone, date_of_birth, gender, address,
        course_interested, parent_name, parent_phone, previous_school,
        marks_percentage, nationality, application_number
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    
    const result = await executeQuery(query, [
      full_name, email, phone, date_of_birth, gender, address,
      course_interested, parent_name, parent_phone, previous_school,
      marks, nationality, applicationNumber
    ]);
    
    if (result.success) {
      res.status(201).json({
        success: true,
        message: 'Your application has been submitted successfully! We will contact you soon.',
        data: {
          id: result.data.insertId,
          application_number: applicationNumber
        }
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to submit application. Please try again.',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Admission form error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get all courses
router.get('/courses', async (req, res) => {
  try {
    const query = 'SELECT * FROM courses WHERE is_active = TRUE ORDER BY course_name';
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch courses',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Get courses error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get upcoming events
router.get('/events', async (req, res) => {
  try {
    const query = `
      SELECT * FROM events 
      WHERE event_date >= CURDATE() AND is_active = TRUE 
      ORDER BY event_date ASC
    `;
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch events',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Get events error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get featured news
router.get('/news', async (req, res) => {
  try {
    const query = `
      SELECT * FROM news_announcements 
      WHERE is_featured = TRUE AND is_active = TRUE 
      ORDER BY created_at DESC
    `;
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch news',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Get news error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get scholarships
router.get('/scholarships', async (req, res) => {
  try {
    const query = `
      SELECT * FROM scholarships 
      WHERE is_active = TRUE AND application_deadline >= CURDATE()
      ORDER BY application_deadline ASC
    `;
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch scholarships',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Get scholarships error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get student clubs
router.get('/clubs', async (req, res) => {
  try {
    const query = 'SELECT * FROM student_clubs WHERE is_active = TRUE ORDER BY club_name';
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch clubs',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Get clubs error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Get university statistics
router.get('/stats', async (req, res) => {
  try {
    const queries = [
      { sql: 'SELECT COUNT(*) as total_students FROM students WHERE is_active = TRUE' },
      { sql: 'SELECT COUNT(*) as total_staff FROM staff WHERE is_active = TRUE' },
      { sql: 'SELECT COUNT(*) as total_courses FROM courses WHERE is_active = TRUE' },
      { sql: 'SELECT COUNT(*) as pending_admissions FROM admission_applications WHERE application_status = "submitted"' },
      { sql: 'SELECT COUNT(*) as total_events FROM events WHERE event_date >= CURDATE() AND is_active = TRUE' }
    ];

    const results = await executeTransaction(queries);
    
    if (results.success) {
      const stats = {
        total_students: results.data[0][0].total_students,
        total_staff: results.data[1][0].total_staff,
        total_courses: results.data[2][0].total_courses,
        pending_admissions: results.data[3][0].pending_admissions,
        upcoming_events: results.data[4][0].total_events
      };

      res.json({
        success: true,
        data: stats
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Failed to fetch statistics',
        error: results.error
      });
    }
  } catch (error) {
    console.error('Get stats error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Search functionality
router.get('/search', async (req, res) => {
  try {
    const { query, type } = req.query;
    
    if (!query || !type) {
      return res.status(400).json({
        success: false,
        message: 'Search query and type are required'
      });
    }

    let searchQuery = '';
    let params = [`%${query}%`];

    switch (type) {
      case 'courses':
        searchQuery = 'SELECT * FROM courses WHERE course_name LIKE ? AND is_active = TRUE';
        break;
      case 'events':
        searchQuery = 'SELECT * FROM events WHERE title LIKE ? AND is_active = TRUE';
        break;
      case 'news':
        searchQuery = 'SELECT * FROM news_announcements WHERE title LIKE ? AND is_active = TRUE';
        break;
      case 'clubs':
        searchQuery = 'SELECT * FROM student_clubs WHERE club_name LIKE ? AND is_active = TRUE';
        break;
      default:
        return res.status(400).json({
          success: false,
          message: 'Invalid search type'
        });
    }

    const result = await executeQuery(searchQuery, params);
    
    if (result.success) {
      res.json({
        success: true,
        data: result.data
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Search failed',
        error: result.error
      });
    }
  } catch (error) {
    console.error('Search error:', error);
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: error.message
    });
  }
});

// Health check endpoint
router.get('/health', async (req, res) => {
  try {
    const query = 'SELECT 1 as status';
    const result = await executeQuery(query);
    
    if (result.success) {
      res.json({
        success: true,
        message: 'API is running',
        timestamp: new Date().toISOString(),
        database: 'connected'
      });
    } else {
      res.status(500).json({
        success: false,
        message: 'Database connection failed',
        error: result.error
      });
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'API health check failed',
      error: error.message
    });
  }
});

module.exports = router;

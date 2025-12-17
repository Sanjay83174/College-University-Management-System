// API Configuration
const API_BASE_URL = 'http://localhost:5000/api';

// Utility function for API calls
async function apiCall(endpoint, options = {}) {
  try {
    const url = `${API_BASE_URL}${endpoint}`;
    const defaultOptions = {
      headers: {
        'Content-Type': 'application/json',
      },
    };

    const response = await fetch(url, { ...defaultOptions, ...options });
    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || 'API request failed');
    }

    return data;
  } catch (error) {
    console.error('API Error:', error);
    throw error;
  }
}

// Contact Form API
async function submitContactForm(formData) {
  return apiCall('/contact', {
    method: 'POST',
    body: JSON.stringify(formData)
  });
}

// Admission Form API
async function submitAdmissionForm(formData) {
  return apiCall('/admission', {
    method: 'POST',
    body: JSON.stringify(formData)
  });
}

// Get Courses
async function getCourses() {
  return apiCall('/courses');
}

// Get Events
async function getEvents() {
  return apiCall('/events');
}

// Get News
async function getNews() {
  return apiCall('/news');
}

// Get Scholarships
async function getScholarships() {
  return apiCall('/scholarships');
}

// Get Student Clubs
async function getClubs() {
  return apiCall('/clubs');
}

// Get University Statistics
async function getStats() {
  return apiCall('/stats');
}

// Search Functionality
async function searchData(query, type) {
  return apiCall(`/search?query=${encodeURIComponent(query)}&type=${type}`);
}

// Health Check
async function checkApiHealth() {
  return apiCall('/health');
}

// Form validation utilities
function validateEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function validatePhone(phone) {
  const phoneRegex = /^[0-9]{10}$/;
  return phoneRegex.test(phone);
}

function validateRequired(value) {
  return value && value.trim().length > 0;
}

// Show notification function
function showNotification(message, type = 'success') {
  // Create notification element
  const notification = document.createElement('div');
  notification.className = `alert alert-${type} notification`;
  notification.style.cssText = `
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
    min-width: 300px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    animation: slideIn 0.3s ease-out;
  `;
  
  notification.textContent = message;
  
  // Add animation styles
  const style = document.createElement('style');
  style.textContent = `
    @keyframes slideIn {
      from { transform: translateX(100%); opacity: 0; }
      to { transform: translateX(0); opacity: 1; }
    }
    @keyframes slideOut {
      from { transform: translateX(0); opacity: 1; }
      to { transform: translateX(100%); opacity: 0; }
    }
  `;
  document.head.appendChild(style);
  
  document.body.appendChild(notification);
  
  // Remove notification after 5 seconds
  setTimeout(() => {
    notification.style.animation = 'slideOut 0.3s ease-in';
    setTimeout(() => {
      if (notification.parentNode) {
        notification.parentNode.removeChild(notification);
      }
    }, 300);
  }, 5000);
}

// Load dynamic content from API
async function loadDynamicContent() {
  try {
    // Load events for the marquee
    const eventsResponse = await getEvents();
    if (eventsResponse.success && eventsResponse.data.length > 0) {
      updateNewsMarquee(eventsResponse.data);
    }

    // Load statistics for the achievements section
    const statsResponse = await getStats();
    if (statsResponse.success) {
      updateStatistics(statsResponse.data);
    }

    // Load featured news
    const newsResponse = await getNews();
    if (newsResponse.success && newsResponse.data.length > 0) {
      updateFeaturedNews(newsResponse.data);
    }

  } catch (error) {
    console.error('Error loading dynamic content:', error);
  }
}

// Update news marquee with real data
function updateNewsMarquee(events) {
  const marqueeContainer = document.querySelector('.marquee-text');
  if (!marqueeContainer) return;

  const newsItems = events.slice(0, 5).map(event => 
    `<span class="news-item" data-target="events_sidebar.html">📅 ${event.title}</span>`
  );

  if (newsItems.length > 0) {
    marqueeContainer.innerHTML = newsItems.join(' &nbsp; | &nbsp; ');
  }
}

// Update statistics section
function updateStatistics(stats) {
  const statNumbers = document.querySelectorAll('.stat-number');
  if (statNumbers.length >= 4) {
    // Update placement rate
    statNumbers[0].setAttribute('data-count', '95');
    statNumbers[0].textContent = '95';
    
    // Update alumni count
    statNumbers[1].setAttribute('data-count', stats.total_students || '10000');
    statNumbers[1].textContent = stats.total_students || '10000';
    
    // Update faculty count
    statNumbers[2].setAttribute('data-count', stats.total_staff || '120');
    statNumbers[2].textContent = stats.total_staff || '120';
    
    // Update awards count
    statNumbers[3].setAttribute('data-count', '50');
    statNumbers[3].textContent = '50';
  }
}

// Update featured news section
function updateFeaturedNews(news) {
  // This can be used to update any news sections on the page
  console.log('Featured news loaded:', news);
}

// Initialize API functionality when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Load dynamic content
  loadDynamicContent();
  
  // Check API health
  checkApiHealth().then(response => {
    console.log('API Health:', response);
  }).catch(error => {
    console.error('API Health Check Failed:', error);
  });
});

// Export functions for use in other scripts
window.UniversityAPI = {
  submitContactForm,
  submitAdmissionForm,
  getCourses,
  getEvents,
  getNews,
  getScholarships,
  getClubs,
  getStats,
  searchData,
  checkApiHealth,
  showNotification,
  validateEmail,
  validatePhone,
  validateRequired
};

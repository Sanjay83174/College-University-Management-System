// Sidebar logic
const sidebar = document.getElementById('sidebar');
const openSidebarBtn = document.getElementById('openSidebar');
const closeSidebarBtn = document.getElementById('closeSidebar');
let sidebarOverlay = document.getElementById('sidebarOverlay');
if (!sidebarOverlay) {
  sidebarOverlay = document.createElement('div');
  sidebarOverlay.id = 'sidebarOverlay';
  document.body.appendChild(sidebarOverlay);
}
function openSidebar() {
  sidebar.classList.add('active');
  sidebarOverlay.style.display = 'block';
}
function closeSidebar() {
  sidebar.classList.remove('active');
  sidebarOverlay.style.display = 'none';
}
openSidebarBtn.addEventListener('click', openSidebar);
closeSidebarBtn.addEventListener('click', closeSidebar);
sidebarOverlay.addEventListener('click', closeSidebar);

// Navigation logic for single-page app
const navLinks = document.querySelectorAll('.nav-link, .dropdown-item');
const sections = document.querySelectorAll('.section, .hero');

function showSection(id) {
  sections.forEach(section => {
    if (section.id === id) {
      section.style.display = 'block';
    } else {
      section.style.display = 'none';
    }
  });
  navLinks.forEach(link => {
    if (link.getAttribute('href') === '#' + id) {
      link.classList.add('active');
    } else {
      link.classList.remove('active');
    }
  });
  closeSidebar();
}

navLinks.forEach(link => {
  link.addEventListener('click', function(e) {
    const href = this.getAttribute('href');
    if (href && href.startsWith('#')) {
      e.preventDefault();
      const id = href.substring(1);
      showSection(id);
    }
  });
});

// Show home by default
showSection('home');

// Form validation for all forms
function validateForm(form, fields) {
  let valid = true;
  fields.forEach(field => {
    const el = document.getElementById(field.id);
    if (field.type === 'email') {
      if (!el.value.match(/^\S+@\S+\.\S+$/)) {
        el.classList.add('is-invalid');
        valid = false;
      } else {
        el.classList.remove('is-invalid');
      }
    } else {
      if (!el.value.trim()) {
        el.classList.add('is-invalid');
        valid = false;
      } else {
        el.classList.remove('is-invalid');
      }
    }
  });
  return valid;
}

document.addEventListener('DOMContentLoaded', function() {
  // Contact form validation
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
      const valid = validateForm(contactForm, [
        {id: 'contactName'},
        {id: 'contactEmail', type: 'email'},
        {id: 'contactMessage'}
      ]);
      if (!valid) e.preventDefault();
    });
  }
  // Admissions form validation
  const admissionsForm = document.getElementById('admissionsForm');
  if (admissionsForm) {
    admissionsForm.addEventListener('submit', function(e) {
      const valid = validateForm(admissionsForm, [
        {id: 'admitName'},
        {id: 'admitEmail', type: 'email'},
        {id: 'admitCourse'}
      ]);
      if (!valid) e.preventDefault();
    });
  }

  // News marquee click-to-navigate functionality
  const marqueeNewsItems = document.querySelectorAll('.marquee-text .news-item');
  marqueeNewsItems.forEach(item => {
    item.addEventListener('click', function() {
      const targetPage = this.getAttribute('data-target');
      if (targetPage) {
        // Add visual feedback
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
          this.style.transform = 'scale(1)';
        }, 150);
        
        // Navigate to the target page
        window.location.href = targetPage;
      }
    });
  });

  // News subpage logic (for other news items with data-news-id)
  const newsItems = document.querySelectorAll('.news-item[data-news-id]');
  const newsDetail = document.getElementById('newsDetail');
  if (newsItems && newsDetail) {
    const newsData = {
      1: {
        title: 'North Gate University wins National Innovation Award',
        content: 'North Gate University has been awarded the National Innovation Award for its outstanding research and innovation in technology and education. The award was presented at the National Education Summit 2024.'
      },
      2: {
        title: 'Admissions Open for 2024-25',
        content: 'Admissions for the academic year 2024-25 are now open. Apply online through our admissions portal and join our vibrant community.'
      },
      3: {
        title: 'Annual Sports Meet Announced',
        content: 'The Annual Sports Meet will be held from March 15-18, 2024. All students are encouraged to participate and showcase their talents.'
      }
    };
    newsItems.forEach(item => {
      item.addEventListener('click', function() {
        const id = this.getAttribute('data-news-id');
        if (newsData[id]) {
          newsDetail.innerHTML = `<div class='card'><div class='card-body'><h5 class='card-title'>${newsData[id].title}</h5><p class='card-text'>${newsData[id].content}</p><button class='btn btn-link p-0' id='closeNewsDetail'>&larr; Back to News</button></div></div>`;
          newsItems.forEach(i => i.classList.remove('active'));
          this.classList.add('active');
          document.getElementById('closeNewsDetail').onclick = function() {
            newsDetail.innerHTML = '';
            newsItems.forEach(i => i.classList.remove('active'));
          };
        }
      });
    });
  }
}); 
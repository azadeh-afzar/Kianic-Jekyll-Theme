// Add lightbox class to all image links magnific-popup
$("a[href$='.jpg'],a[href$='.jpeg'],a[href$='.JPG'],a[href$='.png'],a[href$='.gif']").addClass("image-popup");

// All others magnific-popup
$(document).ready(function() {
	$('.image-popup').magnificPopup({
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: '<a href="%url%">Image #%curr%</a> could not be loaded.',
    },
    removalDelay: 300, // Delay in milliseconds before popup is removed
    // Class that is added to body when popup is open. 
    // make it unique to apply your CSS animations just to this exact popup
    mainClass: 'mfp-fade'
  });
});

// FitVids options
$(function() {
  $(".content").fitVids();
});

// Projects Menu
$('.projects-menu-icon').click(function() {
  $('html').toggleClass('no-scroll');
  $(this).toggleClass('active');
  $('.overlay').toggleClass('show-projects');
});

// Languages Menu
$('.languages-menu-icon').click(function() {
  $('html').toggleClass('no-scroll');
  $(this).toggleClass('active');
  $('.overlay').toggleClass('show-languages');
});

// Mode Menu
$('.mode-menu-icon').click(function() {
  localStorage.setItem('mode', (localStorage.getItem('mode') || 'light') === 'light' ? 'dark' : 'light');
  localStorage.getItem('mode') === 'light' ?  lightMode('transition') : darkMode('transition') ;
  changeModeIcon('indirect');
  
});

$(document).on('DOMContentLoaded', modeKeeper);

function modeKeeper() {
  (localStorage.getItem('mode') || 'light') === 'light' ? lightMode('no-transition') : darkMode('no-transition');
  changeModeIcon('direct');
}

function changeModeIcon(mode) {
  if (mode === 'direct') {
    localStorage.getItem('mode') === 'light' ? $("#sun-moon").removeClass('fa-sun').addClass('fa-moon') : $("#sun-moon").removeClass('fa-moon').addClass('fa-sun');
  } else if (mode == 'indirect') {
    localStorage.getItem('mode') === 'light' ? $("#sun-moon").toggleClass('fa-moon fa-sun') : $("#sun-moon").toggleClass('fa-sun fa-moon');
  } 
}

function lightMode(mode) {
  if (mode === 'transition') {
      var light = 'light transit';
  } else if (mode === 'no-transition') {
      var light = 'light';
  }

  $('body, .languages-menu-icon, .languages-menu-icon-posts, .mode-menu-icon, .posts-menu-icon, .projects-menu-icon, .mode-link, .languages-link, .posts-link, .projects-link, .about-info, .posts-list, .inner-post, .tags, .tag-heading, .highlighter-rouge, .highlight, .change-language, .date-highlight, .pagination, .pagination_pager, .entry-meta, .btn, .notice, .notice_warning, .notice_success, .notice_danger, .notice_info, dt, thead').removeClass('transit').removeClass('dark').addClass(light);
}

function darkMode(mode) {
  if (mode === 'transition') {
    var dark = 'dark transit';
  } else if (mode === 'no-transition') {
    var dark = 'dark';
  }

  $('body, .languages-menu-icon, .languages-menu-icon-posts, .mode-menu-icon, .posts-menu-icon, .projects-menu-icon, .mode-link, .languages-link, .posts-link, .projects-link, .about-info, .posts-list, .inner-post, .tags, .tag-heading, .highlighter-rouge, .highlight, .change-language, .date-highlight, .pagination, .pagination_pager, .entry-meta, .btn, .notice, .notice_warning, .notice_success, .notice_danger, .notice_info, dt, thead').removeClass('transit').removeClass('light').addClass(dark);
}

// Smooth scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
      e.preventDefault();

      document.querySelector(this.getAttribute('href')).scrollIntoView({
          behavior: 'smooth'
      });
  });
});

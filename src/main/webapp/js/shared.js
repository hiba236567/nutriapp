// Utility Functions
var utils = {
    // Format date to readable string
    formatDate: function(date) {
        return new Date(date).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    },

    // Format time to readable string
    formatTime: function(date) {
        return new Date(date).toLocaleTimeString('en-US', {
            hour: '2-digit',
            minute: '2-digit'
        });
    },

    // Show notification
    showNotification: function(message, type) {
        type = type || 'info';
        var notification = document.createElement('div');
        notification.className = 'notification notification-' + type;
        notification.textContent = message;
        
        document.body.appendChild(notification);
        
        setTimeout(function() {
            notification.classList.add('show');
        }, 100);
        
        setTimeout(function() {
            notification.classList.remove('show');
            setTimeout(function() {
                document.body.removeChild(notification);
            }, 300);
        }, 3000);
    },

    // Toggle password visibility
    togglePassword: function(inputId, iconId) {
        var input = document.getElementById(inputId);
        var icon = document.getElementById(iconId);
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.className = 'fas fa-eye-slash';
        } else {
            input.type = 'password';
            icon.className = 'fas fa-eye';
        }
    },

    // Handle form submission
    handleFormSubmit: function(formId, callback) {
        var form = document.getElementById(formId);
        if (!form) {
            return;
        }

        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            var submitButton = form.querySelector('button[type="submit"]');
            var originalText = submitButton.innerHTML;
            
            try {
                // Show loading state
                submitButton.disabled = true;
                submitButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
                
                // Collect form data
                var formData = new FormData(form);
                var data = {};
                formData.forEach(function(value, key) {
                    data[key] = value;
                });
                
                // Call the provided callback
                var promise = callback(data);
                if (promise && typeof promise.then === 'function') {
                    promise.catch(function(error) {
                        utils.showNotification(error.message || 'An error occurred', 'error');
                    }).finally(function() {
                        submitButton.disabled = false;
                        submitButton.innerHTML = originalText;
                    });
                }
            } catch (error) {
                utils.showNotification(error.message || 'An error occurred', 'error');
                submitButton.disabled = false;
                submitButton.innerHTML = originalText;
            }
        });
    },

    // Initialize lazy loading for images
    initLazyLoading: function() {
        var lazyImages = document.querySelectorAll('img[data-src]');
        
        var imageObserver = new IntersectionObserver(function(entries, observer) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    var img = entry.target;
                    img.src = img.dataset.src;
                    img.classList.add('loaded');
                    observer.unobserve(img);
                }
            });
        });
        
        lazyImages.forEach(function(img) {
            imageObserver.observe(img);
        });
    },

    // Handle mobile menu toggle
    initMobileMenu: function() {
        var menuButton = document.getElementById('mobileMenuButton');
        var sidebar = document.getElementById('sidebar');
        
        if (menuButton && sidebar) {
            menuButton.addEventListener('click', function() {
                sidebar.classList.toggle('show');
            });
            
            // Close sidebar when clicking outside
            document.addEventListener('click', function(e) {
                if (!sidebar.contains(e.target) && !menuButton.contains(e.target)) {
                    sidebar.classList.remove('show');
                }
            });
        }
    },

    // Initialize tooltips
    initTooltips: function() {
        var tooltipElements = document.querySelectorAll('[data-tooltip]');
        
        tooltipElements.forEach(function(element) {
            var tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = element.dataset.tooltip;
            
            element.appendChild(tooltip);
            
            element.addEventListener('mouseenter', function() {
                tooltip.classList.add('show');
            });
            
            element.addEventListener('mouseleave', function() {
                tooltip.classList.remove('show');
            });
        });
    }
};

// Initialize shared functionality when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    utils.initLazyLoading();
    utils.initMobileMenu();
    utils.initTooltips();
});

// Export utils for use in other modules
window.utils = utils; 
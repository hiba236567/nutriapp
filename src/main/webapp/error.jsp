<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <c:if test="${not empty user}">
    <button class="mobile-menu-btn" aria-label="Toggle Menu">
        <i class="fas fa-bars"></i>
    </button>
    </c:if>

    <div class="dashboard-container">
        <c:if test="${not empty user}">
        <nav class="sidebar" role="navigation" aria-label="Main Navigation">
            <div class="sidebar-header">
                <img data-src="${user.profilePicture}" alt="Profile Picture" class="profile-picture">
                <h2>${user.firstName} ${user.lastName}</h2>
                <p>Client</p>
            </div>
            <ul class="sidebar-menu">
                <li><a href="dashboard" role="menuitem"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="logout" role="menuitem"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
        </c:if>

        <main class="main-content error-content" role="main">
            <div class="error-container">
                <div class="error-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h1 class="error-title">Oops! Something went wrong</h1>
                
                <div class="error-details">
                    <c:choose>
                        <c:when test="${not empty error}">
                            <p>${error}</p>
                        </c:when>
                        <c:otherwise>
                            <p>An unexpected error occurred. Please try again later.</p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="error-actions">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <a href="dashboard" class="btn btn-primary">
                                <i class="fas fa-arrow-left"></i> Return to Dashboard
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp" class="btn btn-primary">
                                <i class="fas fa-sign-in-alt"></i> Go to Login Page
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <button class="btn btn-secondary" onclick="history.back()">
                        <i class="fas fa-undo"></i> Go Back
                    </button>
                </div>

                <div class="error-support">
                    <p>If the problem persists, contact our support team:</p>
                    <a href="mailto:support@nutritionapp.com" class="support-link">
                        <i class="fas fa-envelope"></i> support@nutritionapp.com
                    </a>
                </div>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            <c:if test="${not empty user}">
            const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
            const sidebar = document.querySelector('.sidebar');
            const mainContent = document.querySelector('.main-content');
            
            mobileMenuBtn.addEventListener('click', () => {
                sidebar.classList.toggle('active');
                mainContent.classList.toggle('expanded');
            });
            </c:if>

            const lazyImages = document.querySelectorAll('.lazy-load');
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.classList.add('loaded');
                        observer.unobserve(img);
                    }
                });
            });
            lazyImages.forEach(img => imageObserver.observe(img));
        });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    :root {
        --primary-color: #4CAF50;
        --secondary-color: #2E7D32;
        --accent-color: #81C784;
        --text-color: #333;
        --light-text: #666;
        --background-color: #f5f5f5;
        --card-background: #fff;
        --border-color: #e0e0e0;
        --spacing-xs: 0.5rem;
        --spacing-sm: 1rem;
        --spacing-md: 1.5rem;
        --spacing-lg: 2rem;
        --spacing-xl: 3rem;
        --font-size-sm: 0.875rem;
        --font-size-md: 1rem;
        --font-size-lg: 1.25rem;
        --font-size-xl: 1.5rem;
        --border-radius: 8px;
        --box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        --box-shadow-hover: 0 4px 8px rgba(0,0,0,0.15);
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        line-height: 1.6;
        min-height: 100vh;
    }

    .dashboard-container {
        display: grid;
        grid-template-columns: minmax(250px, 300px) 1fr;
        min-height: 100vh;
        position: relative;
    }

    .mobile-menu-btn {
        display: none;
        position: fixed;
        top: var(--spacing-sm);
        left: var(--spacing-sm);
        z-index: 1001;
        background: var(--primary-color);
        color: white;
        border: none;
        border-radius: var(--border-radius);
        padding: var(--spacing-sm);
        cursor: pointer;
        transition: var(--transition);
    }

    .mobile-menu-btn:hover {
        background: var(--secondary-color);
        transform: scale(1.05);
    }

    .sidebar {
        background-color: var(--card-background);
        padding: var(--spacing-lg);
        box-shadow: var(--box-shadow);
        position: sticky;
        top: 0;
        height: 100vh;
        overflow-y: auto;
        transition: transform 0.3s ease-in-out;
    }

    .sidebar-header {
        text-align: center;
        margin-bottom: var(--spacing-xl);
        padding-bottom: var(--spacing-md);
        border-bottom: 1px solid var(--border-color);
    }

    .sidebar-header img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        margin-bottom: var(--spacing-sm);
        border: 3px solid var(--primary-color);
        padding: 3px;
        object-fit: cover;
    }

    .sidebar-menu {
        list-style: none;
    }

    .sidebar-menu li {
        margin-bottom: var(--spacing-sm);
    }

    .sidebar-menu a {
        display: flex;
        align-items: center;
        padding: var(--spacing-md);
        color: var(--text-color);
        text-decoration: none;
        border-radius: var(--border-radius);
        transition: var(--transition);
    }

    .sidebar-menu a.active {
        background-color: var(--primary-color);
        color: white;
    }

    .sidebar-menu a:hover {
        background-color: var(--primary-color);
        color: white;
        transform: translateX(5px);
    }

    .main-content {
        padding: var(--spacing-xl);
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: var(--spacing-lg);
        align-content: start;
        height: 100vh;
        overflow-y: auto;
    }

    .info-card {
        background: var(--card-background);
        border-radius: var(--border-radius);
        padding: var(--spacing-lg);
        box-shadow: var(--box-shadow);
        transition: var(--transition);
        height: fit-content;
    }

    .info-card:hover {
        transform: translateY(-3px);
        box-shadow: var(--box-shadow-hover);
    }

    .info-card h3 {
        color: var(--secondary-color);
        margin-bottom: var(--spacing-md);
        padding-bottom: var(--spacing-sm);
        border-bottom: 2px solid var(--primary-color);
        display: flex;
        align-items: center;
        gap: var(--spacing-sm);
    }

    .detail-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: var(--spacing-sm);
        margin: var(--spacing-sm) 0;
        background: var(--background-color);
        border-radius: var(--border-radius);
        transition: var(--transition);
    }

    .detail-item:hover {
        background: #f8f8f8;
        transform: translateX(5px);
    }

    .detail-item strong {
        color: var(--secondary-color);
        font-weight: 600;
    }

    .detail-item span {
        color: var(--text-color);
        font-weight: 500;
    }

    .bio-content {
        padding: var(--spacing-sm);
        line-height: 1.8;
        color: var(--light-text);
    }

    @media (max-width: 768px) {
        .dashboard-container {
            grid-template-columns: 1fr;
        }

        .mobile-menu-btn {
            display: block;
        }

        .sidebar {
            position: fixed;
            left: -100%;
            width: 250px;
            z-index: 1000;
            transition: var(--transition);
        }

        .sidebar.active {
            left: 0;
        }

        .main-content {
            padding: var(--spacing-md);
            height: auto;
        }
    }

    @media (max-width: 480px) {
        :root {
            --spacing-lg: 1.5rem;
            --spacing-xl: 2rem;
        }

        .detail-item {
            flex-direction: column;
            align-items: flex-start;
            gap: var(--spacing-xs);
        }

        .detail-item span {
            width: 100%;
            text-align: right;
        }
    }
</style>
</head>
<body>
    <button class="mobile-menu-btn" aria-label="Toggle Menu">
        <i class="fas fa-bars"></i>
    </button>

    <div class="dashboard-container">
        <!-- Sidebar -->
        <nav class="sidebar" role="navigation" aria-label="Main Navigation">
            <div class="sidebar-header">
                <img src="${pageContext.request.contextPath}/logoo.png" alt="NutriGuide Logo" class="profile-picture">
                <h2>${firstName} ${lastName}</h2>
            </div>
            
            <ul class="sidebar-menu">
                <li><a href="dietitian-dashboard" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="client"><i class="fas fa-utensils"></i> Client</a></li>
                <li><a href="appointments"><i class="fas fa-calendar"></i> Appointments</a></li>
                <li><a href="meal-plans"><i class="fas fa-utensils"></i> Meal Plans</a></li>
               <li><a href="progress"><i class="fas fa-chart-line"></i> Progress</a></li>
                
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <div class="info-card">
                <h3>Basic Info</h3>
                <div class="detail-item">
                    <strong>Full Name:</strong>
                    <span id="fullName">${firstName} ${lastName}</span>
                </div>
                <div class="detail-item">
                    <strong>Email:</strong>
                    <span id="email">${email}</span>
                </div>
            </div>

            <div class="info-card">
                <h3>Professional Information</h3>
                <div class="detail-item">
                    <strong>License Number</strong>
                    <span>${licenseNumber}</span>
                </div>
                <div class="detail-item">
                    <strong>Specialization</strong>
                    <span>${specialization}</span>
                </div>
                <div class="detail-item">
                    <strong>Experience</strong>
                    <span>${yearsExperience} years</span>
                </div>
            </div>

            <div class="info-card">
                <h3>Bio</h3>
                <div class="bio-content">
                    ${bio}
                </div>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
            const sidebar = document.querySelector('.sidebar');
            
            mobileMenuBtn.addEventListener('click', () => {
                sidebar.classList.toggle('active');
            });
        });
    </script>
</body>
</html>
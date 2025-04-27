<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Client Dashboard - NutriGuide</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
    :root {
        --primary-color: #4CAF50;
        --secondary-color: #2E7D32;
        --accent-color: #A5D6A7;
        --text-color: #333;
        --light-text: #777;
        --background-color: #f9fafb;
        --card-background: #fff;
        --border-color: #e0e0e0;
        --spacing-xs: 0.5rem;
        --spacing-sm: 1rem;
        --spacing-md: 1.5rem;
        --spacing-lg: 2rem;
        --spacing-xl: 3rem;
        --border-radius: 12px;
        --box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        --box-shadow-hover: 0 6px 12px rgba(0,0,0,0.1);
        --transition: all 0.3s ease;
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
        min-height: 100vh;
    }

    .mobile-menu-btn {
        display: none;
        position: fixed;
        top: var(--spacing-sm);
        left: var(--spacing-sm);
        background: var(--primary-color);
        color: white;
        border: none;
        border-radius: 50%;
        padding: var(--spacing-sm);
        font-size: 1.5rem;
        cursor: pointer;
        z-index: 1001;
        transition: var(--transition);
    }

    .dashboard-container {
        display: grid;
        grid-template-columns: 280px 1fr;
        min-height: 100vh;
    }

    /* Sidebar */
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
        display: flex;
        flex-direction: column;
        gap: var(--spacing-lg);
    }

    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: var(--card-background);
        padding: var(--spacing-md);
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
    }

    .welcome-message h1 {
        font-size: 1.5rem;
        font-weight: 600;
    }

    .welcome-message p {
        font-size: 1rem;
        color: var(--light-text);
        margin-top: 0.25rem;
    }

    .btn {
        background: var(--primary-color);
        color: white;
        padding: var(--spacing-sm) var(--spacing-md);
        border: none;
        border-radius: var(--border-radius);
        cursor: pointer;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: var(--spacing-xs);
        transition: var(--transition);
    }

    .btn:hover {
        background: var(--secondary-color);
        transform: scale(1.05);
    }

    .info-card {
        background: var(--card-background);
        padding: var(--spacing-lg);
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        transition: var(--transition);
    }

    .info-card:hover {
        box-shadow: var(--box-shadow-hover);
        transform: translateY(-5px);
    }

    .info-card h3 {
        margin-bottom: var(--spacing-md);
        color: var(--primary-color);
        font-size: 1.25rem;
    }

    .detail-item {
        display: flex;
        justify-content: space-between;
        padding: var(--spacing-sm) 0;
        border-bottom: 1px solid var(--border-color);
    }

    .detail-item strong {
        font-weight: 500;
    }

    @media (max-width: 768px) {
        .dashboard-container {
            grid-template-columns: 1fr;
        }

        .sidebar {
            position: fixed;
            left: -100%;
            top: 0;
            height: 100vh;
            width: 250px;
            transition: var(--transition);
            z-index: 999;
        }

        .sidebar.active {
            left: 0;
        }

        .mobile-menu-btn {
            display: block;
        }
    }
    </style>
</head>
<body>

<button class="mobile-menu-btn" aria-label="Toggle Menu" onclick="toggleMenu()">
    <i class="fas fa-bars"></i>
</button>

<div class="dashboard-container">
    <!-- Sidebar -->
    <nav class="sidebar" role="navigation" aria-label="Main Navigation">
        <div class="sidebar-header">
            <img src="${pageContext.request.contextPath}/logoo.png" alt="NutriGuide Logo">
            <h2>${firstName} ${lastName}</h2>
        </div>
        <ul class="sidebar-menu">
            <li><a href="client_dashboard" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="meal-plans"><i class="fas fa-utensils"></i> Meal Plans</a></li>
            <li><a href="progress"><i class="fas fa-chart-line"></i> Progress</a></li>
            <li><a href="appointments"><i class="fas fa-calendar-alt"></i> Appointments</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">
            <div class="welcome-message">
                <h1>Welcome back, ${firstName}!</h1>
                <p>Here's your personalized nutrition dashboard.</p>
            </div>
            <button class="btn" onclick="window.location.href='appointments'">
                <i class="fas fa-plus"></i> New Appointment
            </button>
        </div>

        <div class="info-card">
            <h3>Basic Information</h3>
            <div class="detail-item">
                <strong>Full Name:</strong> <span>${firstName} ${lastName}</span>
            </div>
            <div class="detail-item">
                <strong>Email:</strong> <span>${email}</span>
            </div>
        </div>

        <div class="info-card">
            <h3>Client Profile</h3>
            <div class="detail-item">
                <strong>Age:</strong> <span>${age}</span>
            </div>
            <div class="detail-item">
                <strong>Gender:</strong> <span>${gender}</span>
            </div>
            <div class="detail-item">
                <strong>Height:</strong> <span>${height} cm</span>
            </div>
            <div class="detail-item">
                <strong>Weight:</strong> <span>${weight} kg</span>
            </div>
            <div class="detail-item">
                <strong>Activity Level:</strong> <span>${activityLevel}</span>
            </div>
            <div class="detail-item">
                <strong>Goals:</strong> <span>${goals}</span>
            </div>
            <div class="detail-item">
                <strong>Dietary Preferences:</strong> <span>${dietaryPreferences}</span>
            </div>
        </div>
    </div>
</div>

<script>
function toggleMenu() {
    document.querySelector('.sidebar').classList.toggle('active');
}
</script>

</body>
</html>

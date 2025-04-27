<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Dashboard - NutriGuide</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="logoo.png">
    <style>
    .lazy-load {
            opacity: 0;
            transition: opacity 60s ease-in;
        }
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
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
            position: relative;
        }

        /* Mobile Menu Button */
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
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: var(--card-background);
            padding: var(--spacing-lg);
            box-shadow: var(--box-shadow);
            position: fixed;
            height: 100vh;
            width: 250px;
            z-index: 1000;
            transition: transform 0.3s ease-in-out;
        }

        .sidebar.collapsed {
            transform: translateX(-100%);
        }

        .sidebar-header {
            text-align: center;
            margin-bottom: var(--spacing-xl);
            padding-bottom: var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
        }

        .sidebar-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: var(--spacing-sm);
            border: 3px solid var(--primary-color);
            padding: 3px;
            object-fit: cover;
        }

        .sidebar-header h2 {
            font-size: var(--font-size-lg);
            color: var(--text-color);
            margin-bottom: var(--spacing-xs);
            font-weight: 600;
        }

        .sidebar-header p {
            color: var(--light-text);
            font-size: var(--font-size-sm);
            font-weight: 300;
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
            padding: var(--spacing-sm);
            color: var(--text-color);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: var(--transition);
            position: relative;
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

        .sidebar-menu i {
            margin-right: var(--spacing-sm);
            width: 20px;
            text-align: center;
        }

        .notification-badge {
            position: absolute;
            right: var(--spacing-sm);
            background-color: var(--secondary-color);
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 0.7rem;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 250px;
            padding: var(--spacing-lg);
            width: calc(100% - 250px);
            transition: margin-left 0.3s ease-in-out;
        }

        .main-content.expanded {
            margin-left: 0;
            width: 100%;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-xl);
            padding: var(--spacing-md);
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .welcome-message h1 {
            font-size: var(--font-size-xl);
            color: var(--text-color);
            margin-bottom: var(--spacing-xs);
            font-weight: 500;
        }

        .welcome-message p {
            color: var(--light-text);
            font-weight: 300;
        }

        .user-actions {
            display: flex;
            gap: var(--spacing-sm);
        }

        .btn {
            padding: var(--spacing-sm) var(--spacing-md);
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: var(--spacing-xs);
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        /* Dashboard Cards */
        .dashboard-grid {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xl);
        }

        .card {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            padding: var(--spacing-xl);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-md);
            padding-bottom: var(--spacing-sm);
            border-bottom: 1px solid var(--border-color);
        }

        .card-header h3 {
            font-size: var(--font-size-lg);
            color: var(--text-color);
            font-weight: 600;
        }

        .card-header i {
            color: var(--primary-color);
            font-size: var(--font-size-xl);
        }

        /* Profile Section */
        .profile-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--spacing-md);
        }

        .info-item {
            padding: var(--spacing-md);
            background-color: var(--background-color);
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        .info-item:hover {
            background-color: var(--accent-color);
            color: white;
        }

        .info-label {
            font-size: var(--font-size-sm);
            color: var(--light-text);
            margin-bottom: var(--spacing-xs);
            font-weight: 300;
        }

        .info-value {
            font-weight: 500;
            font-size: var(--font-size-md);
        }

        /* Progress Chart */
        .progress-chart {
            height: 300px;
            margin-top: var(--spacing-md);
            background-color: var(--background-color);
            border-radius: var(--border-radius);
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .chart-container {
            width: 100%;
            height: 100%;
            padding: var(--spacing-md);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .mobile-menu-btn {
                display: block;
            }

            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .profile-info {
                grid-template-columns: 1fr;
            }

            .progress-stats {
                grid-template-columns: 1fr;
            }

            .dashboard-header {
                flex-direction: column;
                gap: var(--spacing-md);
                text-align: center;
            }

            .user-actions {
                width: 100%;
                justify-content: center;
            }
        }

        /* Add this at the beginning of your style section */
        
    </style>
</head>
<body>
    <button class="mobile-menu-btn" aria-label="Toggle Menu">
        <i class="fas fa-bars"></i>
    </button>

    <div class="dashboard-container">
        <nav class="sidebar" role="navigation" aria-label="Main Navigation">
            <div class="sidebar-header">
                
                <h2>${first_Name} ${last_Name}</h2>
                <p>Client</p>
            </div>
            <ul class="sidebar-menu">
                <li><a href="dashboard" class="active" role="menuitem"><i class="fas fa-home"></i> Dashboard</a></li>
               
                <li><a href="meal-plans" ><i class="fas fa-utensils"></i> Meal Plans</a></li>
                <li><a href="progress"><i class="fas fa-chart-line"></i> Progress</a></li>
                <li><a href="appointments.jsp"><i class="fas fa-calendar"></i> Appointments</a></li>
                 </ul>
        </nav>

        <main class="main-content" role="main">
            <div class="dashboard-header">
                <div class="welcome-message">
                    <h1>Welcome back, ${first_Name}!</h1>
                    <p>Here's your nutrition dashboard</p>
                </div>
                <div class="user-actions">
    <button class="btn btn-primary" role="button" aria-label="Schedule New Appointment" onclick="window.location.href='appointments.jsp'">
        <i class="fas fa-plus"></i> New Appointment
    </button>
</div>
                

            </div>

            <div class="dashboard-grid">
                <section class="card" aria-labelledby="profile-title">
                    <div class="card-header">
                        <h3 id="profile-title">My Profile</h3>
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="profile-info">
                        <div class="info-item"><div class="info-label">Age</div><div class="info-value">${age}</div></div>
                        <div class="info-item"><div class="info-label">Height</div><div class="info-value">${height} cm</div></div>
                        <div class="info-item"><div class="info-label">Weight</div><div class="info-value">${weight} kg</div></div>
                    </div>
                </section>

                <section class="card" aria-labelledby="dietitian-title">
                    <div class="card-header">
                        <h3 id="dietitian-title">My Dietitian</h3>
                        <i class="fas fa-user-md"></i>
                    </div>
                    <div class="profile-info">
                        <div class="info-item">
                            <div class="info-label">Name</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty dietitian}">
                                        ${dietitian_firstName} ${dietitian_lastName}
                                    </c:when>
                                    <c:otherwise>
                                        Not assigned
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Specialization</div>
                            <div class="info-value">
                                ${not empty dietitian.specialization ? dietitian.specialization : 'N/A'}
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Next Appointment</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty nextAppointment}">
                                        <fmt:formatDate value="${nextAppointment}" pattern="MMM dd, yyyy hh:mm a"/>
                                    </c:when>
                                    <c:otherwise>
                                        No upcoming appointments
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="card" aria-labelledby="progress-title">
                    <div class="card-header">
                        <h3 id="progress-title">Progress</h3>
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="progress-chart">
                        <div class="chart-container">
                            <canvas id="progressChart"></canvas>
                        </div>
                    </div>
                    <div class="progress-stats">
                        <div class="stat-item">
                            <div class="stat-value">${not empty progress.weightChange ? progress.weightChange : 'N/A'}</div>
                            <div class="stat-label">Weight Change</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">${not empty progress.bodyFat ? progress.bodyFat : 'N/A'}%</div>
                            <div class="stat-label">Body Fat</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">${not empty progress.goalProgress ? progress.goalProgress : 'N/A'}%</div>
                            <div class="stat-label">Goal Progress</div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
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

            const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
            const sidebar = document.querySelector('.sidebar');
            const mainContent = document.querySelector('.main-content');
            mobileMenuBtn.addEventListener('click', () => {
                sidebar.classList.toggle('active');
                mainContent.classList.toggle('expanded');
            });

            const ctx = document.getElementById('progressChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ${weightHistoryLabelsJson},
                    datasets: [{
                        label: 'Weight Progress',
                        data: ${weightHistoryJson},
                        borderColor: '#4CAF50',
                        backgroundColor: 'rgba(76, 175, 80, 0.2)',
                        tension: 0.1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } },
                    scales: { y: { beginAtZero: false } }
                }
            });

            document.querySelector('.btn-primary').addEventListener('click', () => {
                window.location.href = 'new-appointment';
            });
        });
    </script>
</body>
</html>
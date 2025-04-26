<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dietitian Dashboard - NutriGuide</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🥗</text></svg>">
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
        }

        .dashboard-container {
            display: grid;
            grid-template-columns: minmax(250px, 300px) 1fr;
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
            transform: scale(1.05);
        }

        /* Sidebar Styles */
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
            background-color: var(--background-color);
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
            padding: var(--spacing-md);
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
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Main Content Styles */
        .main-content {
            padding: var(--spacing-xl);
            overflow-y: auto;
            height: 100vh;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-xl);
            padding: var(--spacing-lg);
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
            box-shadow: var(--box-shadow-hover);
        }

        /* Dashboard Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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
            box-shadow: var(--box-shadow-hover);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
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

        /* Client List */
        .client-list {
            list-style: none;
        }

        .client-item {
            display: flex;
            align-items: center;
            padding: var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
            transition: var(--transition);
            margin-bottom: var(--spacing-sm);
        }

        .client-item:hover {
            background-color: var(--background-color);
            transform: translateX(5px);
        }

        .client-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: var(--spacing-md);
            object-fit: cover;
            background-color: var(--background-color);
        }

        .client-info {
            flex: 1;
        }

        .client-name {
            font-weight: 500;
            margin-bottom: var(--spacing-xs);
        }

        .client-details {
            font-size: var(--font-size-sm);
            color: var(--light-text);
        }

        .client-actions {
            display: flex;
            gap: var(--spacing-xs);
        }

        .action-btn {
            padding: var(--spacing-xs);
            border: none;
            background: none;
            cursor: pointer;
            color: var(--light-text);
            transition: var(--transition);
            position: relative;
        }

        .action-btn:hover {
            color: var(--primary-color);
            transform: scale(1.1);
        }

        .action-btn::after {
            content: attr(data-tooltip);
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            padding: var(--spacing-xs) var(--spacing-sm);
            background-color: var(--text-color);
            color: white;
            border-radius: var(--border-radius);
            font-size: var(--font-size-sm);
            white-space: nowrap;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
        }

        .action-btn:hover::after {
            opacity: 1;
            visibility: visible;
            transform: translateX(-50%) translateY(-5px);
        }

        /* Statistics Section */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-xl);
        }

        .stat-card {
            text-align: center;
            padding: var(--spacing-lg);
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--box-shadow-hover);
        }

        .stat-value {
            font-size: var(--font-size-xl);
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: var(--spacing-xs);
        }

        .stat-label {
            font-size: var(--font-size-sm);
            color: var(--light-text);
        }

        /* Appointments Section */
        .appointment-list {
            list-style: none;
        }

        .appointment-item {
            padding: var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
            transition: var(--transition);
            margin-bottom: var(--spacing-sm);
        }

        .appointment-item:hover {
            background-color: var(--background-color);
            transform: translateX(5px);
        }

        .appointment-time {
            font-weight: 500;
            color: var(--primary-color);
            margin-bottom: var(--spacing-xs);
        }

        .appointment-client {
            font-size: var(--font-size-sm);
            color: var(--light-text);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .dashboard-container {
                grid-template-columns: 250px 1fr;
            }
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
                left: -250px;
                z-index: 1000;
            }

            .sidebar.active {
                left: 0;
            }

            .main-content {
                margin-left: 0;
                padding: var(--spacing-lg);
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

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }

            .client-item {
                flex-direction: column;
                align-items: flex-start;
                gap: var(--spacing-sm);
            }

            .client-actions {
                width: 100%;
                justify-content: flex-end;
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
                <img src="logoo.png" alt="Profile Picture" class="profile-picture lazy-load">
                <h2>${dietitian.name}</h2>
                <p>Dietitian</p>
            </div>
            <ul class="sidebar-menu">
                <li><a href="#" class="active" role="menuitem"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-users"></i> Clients</a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-utensils"></i> Meal Plans</a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-chart-line"></i> Progress</a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-calendar"></i> Appointments</a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-comments"></i> Messages <span class="notification-badge">3</span></a></li>
                <li><a href="#" role="menuitem"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="login.jsp" role="menuitem"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content" role="main">
            <div class="dashboard-header">
                <div class="welcome-message">
                    <h1>Welcome back, ${dietitian.firstName}!</h1>
                    <p>Here's your dietitian dashboard</p>
                </div>
                <div class="user-actions">
                    <button class="btn btn-primary" role="button" aria-label="Add New Client">
                        <i class="fas fa-plus"></i> New Client
                    </button>
                    <button class="btn btn-primary" role="button" aria-label="Schedule New Appointment">
                        <i class="fas fa-calendar-plus"></i> New Appointment
                    </button>
                </div>
            </div>

            <!-- Statistics -->
            <section class="stats-grid" aria-label="Dashboard Statistics">
                <div class="stat-card">
                    <div class="stat-value">${activeClients}</div>
                    <div class="stat-label">Active Clients</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${todayAppointments}</div>
                    <div class="stat-label">Appointments Today</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${newMessages}</div>
                    <div class="stat-label">New Messages</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${clientSatisfaction}%</div>
                    <div class="stat-label">Client Satisfaction</div>
                </div>
            </section>

            <div class="dashboard-grid">
                <!-- Active Clients Card -->
                <section class="card" aria-labelledby="clients-title">
                    <div class="card-header">
                        <h3 id="clients-title">Active Clients</h3>
                        <i class="fas fa-users"></i>
                    </div>
                    <ul class="client-list">
                        <li class="client-item">
                            <img src="logoo.png" alt="Client Avatar" class="client-avatar lazy-load">
                            <div class="client-info">
                                <div class="client-name">${client1.name}</div>
                                <div class="client-details">Last seen: ${client1.lastSeen}</div>
                            </div>
                            <div class="client-actions">
                                <button class="action-btn" data-tooltip="Send Message">
                                    <i class="fas fa-comment"></i>
                                </button>
                                <button class="action-btn" data-tooltip="Schedule Appointment">
                                    <i class="fas fa-calendar"></i>
                                </button>
                                <button class="action-btn" data-tooltip="More Options">
                                    <i class="fas fa-ellipsis-v"></i>
                                </button>
                            </div>
                        </li>
                        <!-- More client items with dynamic data -->
                    </ul>
                </section>

                <!-- Today's Appointments Card -->
                <section class="card" aria-labelledby="appointments-title">
                    <div class="card-header">
                        <h3 id="appointments-title">Today's Appointments</h3>
                        <i class="fas fa-calendar"></i>
                    </div>
                    <ul class="appointment-list">
                        <li class="appointment-item">
                            <div class="appointment-time">${appointment1.time}</div>
                            <div class="appointment-client">${appointment1.clientName} - ${appointment1.type}</div>
                        </li>
                        <!-- More appointment items with dynamic data -->
                    </ul>
                </section>

                <!-- Recent Messages Card -->
                <section class="card" aria-labelledby="messages-title">
                    <div class="card-header">
                        <h3 id="messages-title">Recent Messages</h3>
                        <i class="fas fa-comments"></i>
                    </div>
                    <ul class="client-list">
                        <li class="client-item">
                            <img src="logoo.png" alt="Client Avatar" class="client-avatar lazy-load">
                            <div class="client-info">
                                <div class="client-name">${message1.sender}</div>
                                <div class="client-details">${message1.content}</div>
                            </div>
                            <div class="client-actions">
                                <button class="action-btn" data-tooltip="Reply">
                                    <i class="fas fa-reply"></i>
                                </button>
                            </div>
                        </li>
                        <!-- More message items with dynamic data -->
                    </ul>
                </section>
            </div>
        </main>
    </div>

    <script>
        // Mobile Menu Toggle
        const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
        const sidebar = document.querySelector('.sidebar');

        mobileMenuBtn.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 768 && 
                !sidebar.contains(e.target) && 
                !mobileMenuBtn.contains(e.target)) {
                sidebar.classList.remove('active');
            }
        });

        // Handle action buttons
        document.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                // TODO: Implement specific actions based on button type
                console.log('Action button clicked:', btn.dataset.tooltip);
            });
        });

        // Handle new client/appointment buttons
        document.querySelectorAll('.btn-primary').forEach(btn => {
            btn.addEventListener('click', () => {
                // TODO: Implement modals for new client/appointment
                alert(`${btn.textContent.trim()} feature coming soon!`);
            });
        });
    </script>
</body>
</html> 
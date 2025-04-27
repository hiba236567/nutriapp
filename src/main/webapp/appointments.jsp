<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Appointments - NutriGuide</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

    /* Dashboard Layout */
    .dashboard-container {
        display: grid;
        grid-template-columns: minmax(250px, 300px) 1fr;
        min-height: 100vh;
        position: relative;
    }

    /* Mobile Menu */
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

    /* Main Content */
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

    /* Cards */
    .card {
        background: var(--card-background);
        border-radius: var(--border-radius);
        padding: var(--spacing-lg);
        margin-bottom: var(--spacing-lg);
        box-shadow: var(--box-shadow);
        transition: var(--transition);
    }

    .card:hover {
        transform: translateY(-3px);
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

    /* Tables */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: var(--spacing-md);
    }

    th, td {
        padding: 1rem;
        text-align: left;
        border-bottom: 1px solid var(--border-color);
    }

    th {
        background-color: var(--primary-color);
        color: white;
        font-weight: 500;
    }

    tr:hover {
        background-color: #f8f8f8;
    }

    /* Forms */
    form {
        background: var(--card-background);
        padding: var(--spacing-lg);
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        margin-bottom: var(--spacing-xl);
    }

    .form-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: var(--spacing-md);
        margin-bottom: var(--spacing-md);
    }

    .form-group {
        margin-bottom: var(--spacing-md);
    }

    label {
        display: block;
        margin-bottom: var(--spacing-sm);
        color: var(--secondary-color);
        font-weight: 500;
    }

    input[type="datetime-local"],
    textarea,
    input[type="number"] {
        width: 100%;
        padding: 0.8rem;
        border: 1px solid var(--border-color);
        border-radius: var(--border-radius);
        transition: var(--transition);
    }

    input:focus,
    textarea:focus {
        border-color: var(--primary-color);
        outline: none;
        box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
    }

    /* Buttons */
    .btn {
        padding: 0.8rem 1.5rem;
        border: none;
        border-radius: var(--border-radius);
        cursor: pointer;
        transition: var(--transition);
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        gap: var(--spacing-xs);
    }

    .btn-primary {
        background: var(--primary-color);
        color: white;
    }

    .btn-primary:hover {
        background: var(--secondary-color);
        transform: translateY(-2px);
    }

    .btn-secondary {
        background: var(--accent-color);
        color: var(--text-color);
    }

    .btn-icon {
        padding: 0.5rem;
        background: none;
        color: var(--light-text);
    }

    /* Error States */
    .error-card {
        padding: var(--spacing-md);
        background: #ffe6e6;
        color: #dc3545;
        border-radius: var(--border-radius);
        margin-bottom: var(--spacing-md);
        display: flex;
        align-items: center;
        gap: var(--spacing-sm);
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: var(--spacing-xl);
        color: var(--light-text);
    }

    /* Responsive Design */
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
            width: 250px;
        }

        .sidebar.active {
            left: 0;
        }

        .main-content {
            padding: var(--spacing-lg);
        }

        table {
            display: block;
            overflow-x: auto;
        }
    }

    @media (max-width: 480px) {
        .dashboard-header {
            flex-direction: column;
            gap: var(--spacing-md);
        }

        .form-grid {
            grid-template-columns: 1fr;
        }
    }

        
        /* Additional specific styles for appointments page */
        .appointments-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: var(--spacing-lg);
        }
        
        .appointment-actions {
            display: flex;
            gap: var(--spacing-sm);
            justify-content: flex-end;
        }
         .table-responsive {
            overflow-x: auto;
        }
        
        .client-info {
            display: grid;
            gap: 0.5rem;
            font-size: 0.9em;
        }
        
        .notes-cell {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        @media (max-width: 768px) {
            .hide-mobile {
                display: none;
            }
            
            .dashboard-table td:before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 0.25rem;
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
                <h2>${user.firstName} ${user.lastName}</h2>
                <p>${fn:toLowerCase(user.role)}</p>
            </div>
             
            <ul class="sidebar-menu">
            <c:if test="${user.role eq 'dietitian'}">
                <li><a href="dietitian-dashboard"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="client"><i class="fas fa-utensils"></i> Client</a></li>
                <li><a href="appointments"  class="active"><i class="fas fa-calendar"></i> Appointments</a></li>
                <li><a href="meal-plans"><i class="fas fa-utensils"></i> Meal Plans</a></li>
                
                <li><a href="progress"><i class="fas fa-chart-line"></i> Progress</a></li>
                </c:if>
                <c:if test="${user.role eq 'client'}">
                
                <li><a href="client_dashboard"><i class="fas fa-home"></i> Dashboard</a></li>
               
                <li><a href="meal-plans" ><i class="fas fa-utensils"></i> Meal Plans</a></li>
                <li><a href="progress" ><i class="fas fa-chart-line"></i> Progress</a></li>
                <li><a href="appointments" class="active"><i class="fas fa-calendar"></i> Appointments</a></li>
               
                 </c:if>
               
                
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content" role="main">
            <div class="dashboard-header">
                <div class="welcome-message">
                    <h1>Appointment Management</h1>
                    <p>View and manage all appointments</p>
                </div>
                
            </div>

            <div class="appointments-container">
                <!-- Error Messages -->
                <c:if test="${not empty error}">
                    <div class="error-card">
                        <i class="fas fa-exclamation-circle"></i>
                        ${error}
                    </div>
                </c:if>

                <!-- New Appointment Form -->
                <div class="card hidden" id="newAppointmentForm">
                    <h3>Schedule New Appointment</h3>
                    <form method="POST">
                        <div class="form-grid">
                            <div class="form-group">
    <label>Appointment Date and Time:</label>
    <input type="datetime-local" name="appointment_time" required>
</div>

<c:choose>
    <c:when test="${user.role eq 'dietitian'}">
        <div class="form-group">
            <label>Client ID:</label>
            <input type="number" name="target_id" required placeholder="Enter Client ID">
        </div>
    </c:when>
</c:choose>

<div class="form-group">
    <label>Notes:</label>
    <textarea name="notes"></textarea>
</div>
                        </div>
                        <div class="form-actions">
                            
                            <button type="submit" class="btn btn-primary">Schedule</button>
                        </div>
                    </form>
                </div>

                <!-- Appointments List -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-calendar-alt"></i> Upcoming Appointments</h3>
                        <div class="header-actions">
                            <button class="btn btn-icon" onclick="refreshAppointments()">
                                <i class="fas fa-sync-alt"></i>
                            </button>
                        </div>
                    </div>
                    
                    <c:choose>
                        <c:when test="${not empty appointments}">
                            <table class="dashboard-table">
                                <thead>
                                    <tr>
                                       
                                        <th>Date & Time</th>
                                        <th>Notes</th>
                                        <th>${user.role eq 'client' ? 'Dietitian' : 'Client'}</th>
                                        <c:if test="${user.role eq 'client'}">
                                            <th>Specialization</th>
                                        </c:if>
                                        <c:if test="${user.role eq 'dietitian'}">
                                            <th>Age</th>
                                             <th>Gender</th>
                <th>Height</th>
                <th>Weight</th>
                
                <th>Diet Preferences</th>
                                        </c:if>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="appointment" items="${appointments}">
                                        <tr>
                                           
                                            <td>${fn:replace(appointment.time, 'T', ' ')}</td>
                                            <td>${appointment.notes}</td>
                                            <td>${appointment.name}</td>
                                            <c:if test="${user.role eq 'client'}">
                                                <td>
                                                    ${fn:replace(
                                                        fn:toLowerCase(appointment.specialization),
                                                        '_', ' '
                                                    )}
                                                </td>
                                            </c:if>
                                            <c:if test="${user.role eq 'dietitian'}">
                                                <td>${appointment.age}</td>
                                        <td>${appointment.gender}</td>
                                        <td>${appointment.height}</td>
                                        <td>${appointment.weight}</td>
                                       
                                        <td>${appointment.dietary_preferences}</td>
                                            </c:if>
                                            <td>
                                                <div class="appointment-actions">
                                                    <button class="btn btn-icon" data-tooltip="Edit">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-icon text-danger" data-tooltip="Delete">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="fas fa-calendar-times"></i>
                                <p>No upcoming appointments found</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
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

        // Form Toggle
        function showNewAppointmentForm() {
            document.getElementById('newAppointmentForm').classList.remove('hidden');
        }

        function hideNewAppointmentForm() {
            document.getElementById('newAppointmentForm').classList.add('hidden');
        }

        // Refresh Appointments
        function refreshAppointments() {
            window.location.reload();
        }

        // Tooltips
        document.querySelectorAll('[data-tooltip]').forEach(element => {
            element.addEventListener('mouseenter', (e) => {
                const tooltip = document.createElement('div');
                tooltip.className = 'tooltip';
                tooltip.textContent = element.dataset.tooltip;
                document.body.appendChild(tooltip);
                
                const rect = element.getBoundingClientRect();
                tooltip.style.left = `${rect.left + rect.width/2}px`;
                tooltip.style.top = `${rect.top - 30}px`;
            });

            element.addEventListener('mouseleave', () => {
                document.querySelector('.tooltip')?.remove();
            });
        });
        function validateAppointmentForm() {
            const dateTimeInput = document.getElementById('appointment_time');
            const selectedDate = new Date(dateTimeInput.value);
            const now = new Date();
            
            if (selectedDate < now) {
                alert('Please select a future date and time');
                return false;
            }
            
            // Additional validation if needed
            return true;
        }

        // Delete Confirmation
        function confirmDelete(appointmentId) {
            if (confirm('Are you sure you want to delete this appointment?')) {
                // Perform deletion
                window.location.href = `deleteAppointment?id=${appointmentId}`;
            }
        }

        // Responsive Table Handling
        function handleResponsiveTable() {
            const tables = document.querySelectorAll('.dashboard-table');
            tables.forEach(table => {
                const headers = Array.from(table.querySelectorAll('th')).map(header => header.innerText);
                table.querySelectorAll('tbody tr').forEach(row => {
                    Array.from(row.querySelectorAll('td')).forEach((cell, index) => {
                        cell.setAttribute('data-label', headers[index]);
                    });
                });
            });
        }
        
        window.addEventListener('resize', handleResponsiveTable);
        handleResponsiveTable();


    </script>
</body>
</html>
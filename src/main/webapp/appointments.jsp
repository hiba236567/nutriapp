<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Rendez-vous</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #dddddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
   <h3>Appointments</h3>
<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<form method="POST">
    <label>Date/Time: <input type="datetime-local" name="appointment_time" required></label>
    <label>Notes: <textarea name="notes"></textarea></label>
    <label>
        ${user.role eq 'client' ? 'Dietitian ID' : 'Client ID'}:
        <input type="number" name="target_id" required>
    </label>
    <button type="submit">Book Appointment</button>
</form>
  <h1>Appointments</h1>

    <!-- Check if there are any appointments -->
    <c:if test="${not empty appointments}">
        <table border="1">
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Time</th>
                    <th>Notes</th>
                    <th>Name</th>
                    <c:if test="${user.role == 'client'}">
                        <th>Specialization</th>
                    </c:if>
                    <c:if test="${user.role == 'dietitian'}">
                        <th>Age</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through appointments -->
                <c:forEach var="appointment" items="${appointments}">
                    <tr>
                        <td>${appointment.id}</td>
                        <td>${appointment.time}</td>
                        <td>${appointment.notes}</td>
                        <td>${appointment.name}</td>
                        
                        <!-- Display specialization for client -->
                        <c:if test="${user.role == 'client'}">
                            <td>${appointment.specialization}</td>
                        </c:if>

                        <!-- Display age for dietitian -->
                        <c:if test="${user.role == 'dietitian'}">
                            <td>${appointment.age}</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty appointments}">
        <p>No appointments found.</p>
    </c:if>


   

</body>
</html>
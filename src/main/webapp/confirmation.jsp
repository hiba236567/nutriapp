<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Confirmation</title>
    <style>
        .confirmation-container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 2rem;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .confirmation-details {
            margin: 1.5rem 0;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Registration Successful! 🎉</h2>
        <div class="confirmation-details">
            <p><strong>Name:</strong> ${firstName} ${lastName}</p>
            <p><strong>Email:</strong> ${email}</p>
            <p><strong>Username:</strong> ${username}</p>
            <p><strong>Role:</strong> ${role}</p>
        </div>
        <p>An email confirmation has been sent to ${email}</p>
        <a href="login.jsp" class="login-link">Proceed to Login</a>
    </div>
</body>
</html>
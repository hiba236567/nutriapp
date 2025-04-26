<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Successful</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f9f0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .message-box {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        .message-box h1 {
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h1>🎉 Login Successful!</h1>
        <p>Welcome to NutriGuide.</p>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>

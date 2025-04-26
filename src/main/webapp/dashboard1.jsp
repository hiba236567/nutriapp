<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: #f0f2f5;
            padding: 2rem;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .info-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .info-card:hover {
            transform: translateY(-5px);
        }

        h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #3498db;
            font-size: 1.4rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        h3::before {
            content: '•';
            color: #3498db;
            font-size: 1.8rem;
        }

        .detail-item {
            margin: 1rem 0;
            padding: 0.8rem;
            background: #f8f9fa;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .detail-item strong {
            color: #3498db;
            font-weight: 600;
            margin-right: 1rem;
        }

        .detail-item span {
            color: #2c3e50;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .dashboard-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<div class="info-card">
        <div class="info-card">
            <h3>Basic Info</h3>
            <div class="detail-item">
                <strong>Full Name</strong>
                <span id="fullName">${firstName} ${lastName}</span>
            </div>
            
            <div class="detail-item">
                <strong>Email</strong>
                <span id="email">${email}</span>
            </div>
            
        </div>
         </div>
<div class="dashboard-container">
<a href="appointments">Manage Appointments</a>
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
        
      
    

    <div class="info-card">
        <h3>Bio</h3>
        <div class="bio-content">
            ${bio}
        </div>
    </div>
</div>
 </div>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Nutrition App</title>
 <title>NutriGuide - Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
  :root {
    /* Color System */
    --primary-color: #4ecdc4;
    --secondary-color: #ff6b6b;
    --hover-color: #45b7b0;
    --text-color: #333;
    --label-color: #666;
    --background-light: rgba(255, 255, 255, 0.95);
    --error-color: #e74c3c;
    --success-color: #2ecc71;
    
    /* Spacing System */
    --spacing-xs: 0.5rem;
    --spacing-sm: 1rem;
    --spacing-md: 1.5rem;
    --spacing-lg: 2rem;
    --spacing-xl: 3rem;
    
    /* Typography */
    --font-size-xs: 0.75rem;
    --font-size-sm: 0.875rem;
    --font-size-md: 1rem;
    --font-size-lg: 1.25rem;
    --font-size-xl: 1.5rem;
    --font-size-2xl: 2rem;
    
    /* Border Radius */
    --border-radius-sm: 4px;
    --border-radius-md: 8px;
    --border-radius-lg: 12px;
    --border-radius-xl: 20px;
    
    /* Shadows */
    --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.1);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
    --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
    --box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    
    /* Transitions */
    --transition-fast: 0.2s ease;
    --transition-normal: 0.3s ease;
    --transition-slow: 0.5s ease;
    --transition-duration: 0.35s;
    --transition-timing: cubic-bezier(0.25, 0.8, 0.25, 1);
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', 'Arial', sans-serif;
  }

  html {
    font-size: 16px;
  }

  body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
    padding: var(--spacing-md);
    font-size: var(--font-size-md);
    line-height: 1.6;
  }

  .login-container {
    background: var(--background-light);
    padding: var(--spacing-xl);
    border-radius: var(--border-radius-xl);
    box-shadow: var(--box-shadow);
    width: 100%;
    max-width: 500px;
    transition: transform var(--transition-normal);
    animation: fadeIn var(--transition-slow);
  }

  .login-container:hover {
    transform: translateY(-5px);
  }

  .login-header {
    text-align: center;
    margin-bottom: var(--spacing-xl);
  }

  .login-header h1 {
    color: var(--text-color);
    font-size: var(--font-size-2xl);
    margin-bottom: var(--spacing-xs);
    font-weight: 600;
  }

  .login-header p {
    color: var(--label-color);
    font-size: var(--font-size-md);
  }

  .input-group {
    margin-bottom: var(--spacing-lg);
    position: relative;
  }

  .input-group label {
    display: block;
    margin-bottom: var(--spacing-xs);
    color: var(--label-color);
    font-weight: 500;
    font-size: var(--font-size-sm);
  }

  .input-group input {
    width: 100%;
    padding: var(--spacing-sm) var(--spacing-md);
    padding-left: calc(var(--spacing-md) + 1rem);
    border: 1px solid #ddd;
    border-radius: var(--border-radius-md);
    font-size: var(--font-size-md);
    transition: all var(--transition-normal);
  }

  .input-group input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(78, 205, 196, 0.1);
  }

  .input-group i {
    position: absolute;
    left: var(--spacing-md);
    top: 50%;
    transform: translateY(-50%);
    color: var(--label-color);
    font-size: var(--font-size-md);
  }

  

  .login-button {
    width: 100%;
    padding: var(--spacing-sm) var(--spacing-md);
    background: var(--primary-color);
    color: white;
    border: none;
    border-radius: var(--border-radius-md);
    font-size: var(--font-size-md);
    font-weight: 500;
    cursor: pointer;
    transition: all var(--transition-normal);
    position: relative;
    overflow: hidden;
    height: 3rem;
  }

  .login-button:hover {
    background: var(--hover-color);
    transform: translateY(-2px);
  }

  .login-button:disabled {
    background: #ccc;
    cursor: not-allowed;
    transform: none;
  }

  .login-button .spinner {
    display: none;
    width: 1.25rem;
    height: 1.25rem;
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    border-top-color: white;
    animation: spin 1s linear infinite;
    position: absolute;
    right: var(--spacing-md);
    top: 50%;
    transform: translateY(-50%);
  }

  .error-message {
    color: var(--error-color);
    font-size: var(--font-size-sm);
    margin-top: var(--spacing-xs);
    display: none;
    animation: fadeIn var(--transition-fast);
  }

  .password-container {
    position: relative;
    width: 100%;
  }

  .password-container input {
    width: 100%;
    padding: var(--spacing-sm) var(--spacing-md);
    padding-left: calc(var(--spacing-md) + 1rem);
    padding-right: calc(var(--spacing-md) + 1.5rem);
    border: 1px solid #ddd;
    border-radius: var(--border-radius-md);
    font-size: var(--font-size-md);
    transition: all var(--transition-normal);
  }

  .password-container i:first-child {
    position: absolute;
    left: var(--spacing-md);
    top: 50%;
    transform: translateY(-50%);
    color: var(--label-color);
    font-size: var(--font-size-md);
  }

  .show-password {
    position: absolute;
    right: var(--spacing-md);
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: var(--label-color);
    transition: color var(--transition-normal);
    font-size: var(--font-size-md);
    z-index: 2;
  }

  .show-password:hover {
    color: var(--primary-color);
  }

  .logo-section {
    text-align: center;
    margin-bottom: var(--spacing-lg);
  }

  .logo {
    width: 10rem;
    margin-bottom: var(--spacing-sm);
    transition: transform var(--transition-normal);
  }

  .logo:hover {
    transform: scale(1.05);
  }

  .website-description {
    text-align: center;
    color: var(--label-color);
    margin-bottom: var(--spacing-xl);
    font-size: var(--font-size-sm);
    line-height: 1.6;
  }

  .register-section {
    text-align: center;
    margin-top: var(--spacing-lg);
    padding-top: var(--spacing-md);
    border-top: 1px solid #eee;
  }

  .register-link {
    color: var(--primary-color);
    text-decoration: none;
    font-weight: 600;
    transition: color var(--transition-normal);
  }

  .register-link:hover {
    color: var(--hover-color);
    text-decoration: underline;
  }

  

  @keyframes spin {
    to { transform: translateY(-50%) rotate(360deg); }
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
  }

  /* Responsive design */
  @media (max-width: 768px) {
    html {
      font-size: 14px;
    }
    
    .login-container {
      padding: var(--spacing-lg);
    }
    
    
  
  @media (max-width: 480px) {
    html {
      font-size: 12px;
    }
    
    .login-container {
      padding: var(--spacing-md);
    }
    
    .logo {
      width: 8rem;
    }
  }
</style>
</head>

<body>
    
            
  
  <div class="login-container">
        <div class="logo-section">
            <img src="logoo.png"
                 alt="NutriGuide Logo" 
                 class="logo">
            <div class="website-description">
                Your personalized nutrition advisor<br>
                Get customized meal plans and track your nutritional intake
            </div>
        </div>

        <div class="login-header">
            <h1>Welcome Back</h1>
            
        </div>
        <c:if test="${not empty loginError}">
    <div class="server-error-message">${loginError}</div>
</c:if>

<form id="loginForm" action="login" method="POST" onsubmit="return handleLogin(event)">
    
        
            <div class="input-group">
                <label for="username">Username</label>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="error-message" id="usernameError"></div>
            </div>
            
            <div class="input-group">
                <label for="password">Password</label>
                <div class="password-container">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    <span class="show-password" id="showPassword"><i class="fas fa-eye"></i></span>
                </div>
                <div class="error-message" id="passwordError"></div>
            </div>
            

            
            <button type="submit" class="login-button" id="loginButton">
                Sign In
                <span class="spinner"></span>
            </button>
        

        <div class="register-section">
            New to NutriGuide? <a href="signup.jsp" class="register-link">Create Account</a>
        </div>
       </form>
        </div> 
    
    
   <script>
    // DOM Elements
    const loginForm = document.getElementById('loginForm');
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    const loginButton = document.getElementById('loginButton');
    const spinner = loginButton.querySelector('.spinner');
    const usernameError = document.getElementById('usernameError');
    const passwordError = document.getElementById('passwordError');

    // Password Toggle
    document.getElementById('showPassword').addEventListener('click', () => {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        const icon = document.querySelector('#showPassword i');
        icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
    });

    // Form Submission
    function handleLogin(event) {
        // Prevent default only *if invalid*
        let isValid = true;

        // Reset error messages
        usernameError.style.display = 'none';
        passwordError.style.display = 'none';

        const username = usernameInput.value.trim();
        const password = passwordInput.value.trim();

        if (!username) {
            usernameError.textContent = 'Username is required';
            usernameError.style.display = 'block';
            isValid = false;
        }

        if (!password) {
            passwordError.textContent = 'Password is required';
            passwordError.style.display = 'block';
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault(); // Only stop submission if errors
            return false;
        }

        // Optional: Show loading spinner
        spinner.style.display = 'inline-block';
        loginButton.disabled = true;

        return true; // Let form submit
    }
</script>
</body>
</html>
  
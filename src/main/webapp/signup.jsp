<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - NutriGuide</title>
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

  .signup-container {
    background: var(--background-light);
    padding: var(--spacing-xl);
    border-radius: var(--border-radius-xl);
    box-shadow: var(--box-shadow);
    width: 100%;
    max-width: 600px;
    transition: transform var(--transition-normal);
    animation: fadeIn var(--transition-slow);
  }

  .signup-container:hover {
    transform: translateY(-5px);
  }

  .signup-header {
    text-align: center;
    margin-bottom: var(--spacing-xl);
  }

  .signup-header h1 {
    color: var(--text-color);
    font-size: var(--font-size-2xl);
    margin-bottom: var(--spacing-xs);
    font-weight: 600;
  }

  .signup-header p {
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

  .input-group input, .input-group select {
    width: 100%;
    padding: var(--spacing-sm) var(--spacing-md);
    padding-left: calc(var(--spacing-md) + 1rem);
    border: 1px solid #ddd;
    border-radius: var(--border-radius-md);
    font-size: var(--font-size-md);
    transition: all var(--transition-normal);
  }

  .input-group input:focus, .input-group select:focus {
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

  .signup-button {
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
    margin-top: var(--spacing-md);
  }

  .signup-button:hover {
    background: var(--hover-color);
    transform: translateY(-2px);
  }

  .signup-button:disabled {
    background: #ccc;
    cursor: not-allowed;
    transform: none;
  }

  .signup-button .spinner {
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

  .login-section {
    text-align: center;
    margin-top: var(--spacing-lg);
    padding-top: var(--spacing-md);
    border-top: 1px solid #eee;
  }

  .login-link {
    color: var(--primary-color);
    text-decoration: none;
    font-weight: 600;
    transition: color var(--transition-normal);
  }

  .login-link:hover {
    color: var(--hover-color);
    text-decoration: underline;
  }

  /* Role selection styles */
  .role-selection {
    margin-bottom: var(--spacing-lg);
    text-align: center;
  }

  .role-label {
    display: block;
    margin-bottom: var(--spacing-sm);
    color: var(--label-color);
    font-weight: 500;
    font-size: var(--font-size-md);
  }

  .role-options {
    display: flex;
    gap: var(--spacing-md);
    justify-content: center;
    margin-top: var(--spacing-sm);
  }

  .role-btn {
    padding: var(--spacing-xs) var(--spacing-sm);
    border: 2px solid var(--primary-color);
    border-radius: var(--border-radius-md);
    background: white;
    color: var(--primary-color);
    font-weight: 600;
    cursor: pointer;
    transition: all var(--transition-normal);
    width: 8rem;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: var(--spacing-xs);
  }

  .role-btn i {
    font-size: var(--font-size-lg);
  }

  .role-btn.selected {
    background: var(--primary-color);
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(78, 205, 196, 0.3);
  }

  .role-btn:hover:not(.selected) {
    background: rgba(78, 205, 196, 0.1);
  }

  /* Form sections */
  .form-section {
    display: none;
  }

  .form-section.active {
    display: block;
    animation: fadeIn var(--transition-normal);
  }

  .form-row {
    display: flex;
    gap: var(--spacing-md);
    margin-bottom: var(--spacing-md);
  }

  .form-row .input-group {
    flex: 1;
    margin-bottom: 0;
  }

  .form-divider {
    margin: var(--spacing-lg) 0;
    border-top: 1px solid #eee;
  }

  .form-divider-title {
    text-align: center;
    color: var(--label-color);
    font-size: var(--font-size-md);
    font-weight: 500;
    margin-top: -0.75rem;
    background: var(--background-light);
    padding: 0 var(--spacing-sm);
    display: inline-block;
    position: relative;
    left: 50%;
    transform: translateX(-50%);
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
    
    .signup-container {
      padding: var(--spacing-lg);
    }
    
    .role-options {
      flex-direction: column;
      align-items: center;
    }

    .role-btn {
      width: 100%;
      max-width: 12rem;
      padding: var(--spacing-xs);
    }

    .form-row {
      flex-direction: column;
      gap: var(--spacing-md);
    }
  }
  
  @media (max-width: 480px) {
    html {
      font-size: 12px;
    }
    
    .signup-container {
      padding: var(--spacing-md);
    }
    
    .logo {
      width: 8rem;
    }
  }
</style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="signup-container">
        <div class="logo-section">
            <img src="logoo.png" alt="NutriGuide Logo" class="logo">
            <div class="website-description">
                Your personalized nutrition advisor<br>
                Get customized meal plans and track your nutritional intake
            </div>
        </div>

        <div class="signup-header">
            <h1>Create Account</h1>
            <p>Join NutriGuide to start your nutrition journey</p>
        </div>

        <!-- Error Message Display -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form id="signupForm" action="${pageContext.request.contextPath}/REG" method="POST">
            <div class="input-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>

            <div class="input-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                <div class="error-message" id="usernameError"></div>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                    <span class="show-password" onclick="togglePassword('password')"><i class="fas fa-eye"></i></span>
                </div>
                <div class="error-message" id="passwordError"></div>
            </div>

            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <div class="password-container">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                    <span class="show-password" onclick="togglePassword('confirmPassword')"><i class="fas fa-eye"></i></span>
                </div>
                <div class="error-message" id="confirmPasswordError"></div>
            </div>

            <!-- Role Selection -->
            <div class="role-selection">
                <div class="role-label">Select Your Role</div>
                <div class="role-options">
                    <div class="role-btn selected" data-role="client">
                        <i class="fas fa-user"></i>
                        Client
                    </div>
                    <div class="role-btn" data-role="dietitian">
                        <i class="fas fa-user-md"></i>
                        Dietitian
                    </div>
                </div>
                <input type="hidden" id="role" name="role" value="client">
            </div>

            <!-- Client Form -->
            <div id="clientForm" class="form-section active">
                <div class="form-divider">
                    <div class="form-divider-title">Personal Information</div>
                </div>

                <div class="input-group">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" min="18" max="120">
                    <div class="error-message" id="ageError"></div>
                </div>

                <div class="input-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">Select gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                    <div class="error-message" id="genderError"></div>
                </div>
                <div class="input-group">
        <label for="clientHeight">Height (cm)</label>
        <div class="input-group">
            <i class="fas fa-ruler-vertical"></i>
            <input type="number" id="clientHeight" name="height" placeholder="Height in cm" min="100" max="250" required>
        </div>
        <div class="error-message" id="clientHeightError"></div>
    </div>
    <div class="input-group">
        <label for="clientWeight">Weight (kg)</label>
        <div class="input-group">
            <i class="fas fa-weight"></i>
            <input type="number" id="clientWeight" name="weight" placeholder="Weight in kg" min="30" max="300" required>
        </div>
        <div class="error-message" id="clientWeightError"></div>
    </div>


<div class="input-group">
    <label for="clientActivityLevel">Activity Level</label>
    <div class="input-group">
        <i class="fas fa-running"></i>
        <select id="clientActivityLevel" name="activityLevel" required>
            <option value="">Select activity level</option>
            <option value="sedentary">Sedentary (little or no exercise)</option>
            <option value="light">Lightly active (light exercise 1-3 days/week)</option>
            <option value="moderate">Moderately active (moderate exercise 3-5 days/week)</option>
            <option value="very">Very active (hard exercise 6-7 days/week)</option>
            <option value="extra">Extra active (very hard exercise and physical job)</option>
        </select>
    </div>
    <div class="error-message" id="clientActivityLevelError"></div>
</div>

<div class="input-group">
    <label for="clientGoals">Health Goals</label>
    <div class="input-group">
        <i class="fas fa-bullseye"></i>
        <select id="clientGoals" name="goals" required>
            <option value="">Select your primary goal</option>
            <option value="weight_loss">Weight Loss</option>
            <option value="muscle_gain">Muscle Gain</option>
            <option value="maintenance">Maintenance</option>
            <option value="improve_health">Improve Health</option>
            <option value="sports_performance">Sports Performance</option>
        </select>
    </div>
    <div class="error-message" id="clientGoalsError"></div>
      <div class="input-group">
                    <label for="clientDietaryPreferences">Dietary Preferences</label>
                    <div class="input-group">
                        <i class="fas fa-utensils"></i>
                        <select id="clientDietaryPreferences" name="dietaryPreferences" required>
                            <option value="">Select dietary preference</option>
                            <option value="no_restrictions">No Restrictions</option>
                            <option value="vegetarian">Vegetarian</option>
                            <option value="vegan">Vegan</option>
                            <option value="pescatarian">Pescatarian</option>
                            <option value="gluten_free">Gluten-Free</option>
                            <option value="dairy_free">Dairy-Free</option>
                            <option value="keto">Keto</option>
                            <option value="paleo">Paleo</option>
                        </select>
                    </div>
                    <div class="error-message" id="clientDietaryPreferencesError"></div>
                </div>
</div>
</div>
           

            <!-- Dietitian Form -->
            <div id="dietitianForm" class="form-section">
                <div class="input-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" disabled>
                    <div class="error-message" id="licenseNumberError"></div>
                </div>

                <div class="input-group">
                    <label for="dietitianSpecialization">Specialization</label>
                    <div class="input-group">
                        <i class="fas fa-graduation-cap"></i>
                        <select id="dietitianSpecialization" name="specialization" required>
                            <option value="">Select specialization</option>
                            <option value="weight_management">Weight Management</option>
                            <option value="sports_nutrition">Sports Nutrition</option>
                            <option value="clinical_nutrition">Clinical Nutrition</option>
                            <option value="pediatric_nutrition">Pediatric Nutrition</option>
                            <option value="geriatric_nutrition">Geriatric Nutrition</option>
                            <option value="oncology_nutrition">Oncology Nutrition</option>
                            <option value="diabetes_management">Diabetes Management</option>
                            <option value="eating_disorders">Eating Disorders</option>
                        </select>
                    </div>
                    <div class="error-message" id="dietitianSpecializationError"></div>
                </div>
                
                <div class="input-group">
                    <label for="dietitianExperience">Years of Experience</label>
                    <div class="input-group">
                        <i class="fas fa-clock"></i>
                        <input type="number" id="dietitianExperience" name="experience" placeholder="Years of experience" min="0" max="50" required>
                    </div>
                    <div class="error-message" id="dietitianExperienceError"></div>
                </div>
                
                <div class="input-group">
                    <label for="dietitianBio">Professional Bio</label>
                    <div class="input-group">
                        <i class="fas fa-file-alt"></i>
                        <textarea id="dietitianBio" name="bio" placeholder="Tell us about your professional background and approach" rows="4" style="width: 100%; padding: var(--spacing-sm) var(--spacing-md); border: 1px solid #ddd; border-radius: var(--border-radius-md); font-size: var(--font-size-md); font-family: inherit; resize: vertical;"></textarea>
                    </div>
                    <div class="error-message" id="dietitianBioError"></div>
                </div>
               
            </div>

            <button type="submit" class="signup-button">Create Account</button>
        </form>
    </div>

    <script>
        // Role Selection Logic
        document.querySelectorAll('.role-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                document.querySelectorAll('.role-btn').forEach(b => b.classList.remove('selected'));
                this.classList.add('selected');
                const role = this.getAttribute('data-role');
                document.getElementById('role').value = role;

                // Toggle active form
                document.getElementById('clientForm').classList.remove('active');
                document.getElementById('dietitianForm').classList.remove('active');
                document.querySelectorAll('#clientForm input, #clientForm select, #dietitianForm input, #dietitianForm select')
                    .forEach(field => field.disabled = true);

                if (role === 'client') {
                    document.getElementById('clientForm').classList.add('active');
                    document.querySelectorAll('#clientForm input, #clientForm select')
                        .forEach(field => field.disabled = false);
                } else {
                    document.getElementById('dietitianForm').classList.add('active');
                    document.querySelectorAll('#dietitianForm input, #dietitianForm select')
                        .forEach(field => field.disabled = false);
                }
            });
        });

        // Password Toggle
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const icon = field.nextElementSibling.querySelector('i');
            field.type = field.type === 'password' ? 'text' : 'password';
            icon.classList.toggle('fa-eye-slash');
        }

        // Validation
        document.getElementById('signupForm').addEventListener('submit', function (e) {
            let isValid = true;
            const role = document.getElementById('role').value;

            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

            const validateField = (id, message) => {
                const field = document.getElementById(id);
                if (!field.disabled && !field.value.trim()) {
                    document.getElementById(`${id}Error`).textContent = message;
                    isValid = false;
                }
            };

            // Common fields
            validateField('firstName', 'First name is required');
            validateField('lastName', 'Last name is required');
            validateField('email', 'Email is required');
            validateField('username', 'Username is required');
            validateField('password', 'Password is required');
            validateField('confirmPassword', 'Confirm password is required');
            
            // Password match check
            if (document.getElementById('password').value !== document.getElementById('confirmPassword').value) {
                document.getElementById('confirmPasswordError').textContent = 'Passwords do not match';
                isValid = false;
            }

            // Role specific fields
            if (role === 'client') {
    validateField('age', 'Age is required');
    validateField('gender', 'Gender is required');
    validateField('clientHeight', 'Height is required');
    validateField('clientWeight', 'Weight is required');
    validateField('clientActivityLevel', 'Activity level is required');
    validateField('clientGoals', 'Health goal is required');
    validateField('dietaryPreferences','dietary Preferences is required ');
} else {
                validateField('licenseNumber', 'License number is required');
                validateField('specialization', 'Specialization is required');
                validateField('experience', 'experience is required');
                validateField('bio', 'bio is required');
            }

            if (!isValid) e.preventDefault();
        });
    </script>
</body>

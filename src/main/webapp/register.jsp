<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-image: url('bg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }
        
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1.5rem;
            padding: 2.5rem;
            width: 100%;
            max-width: 50rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .form-container h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1f2937;
            text-align: center;
            margin-bottom: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            position: relative;
        }
        
        .form-group.full-width {
            grid-column: 1 / -1;
        }
        
        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-wrapper i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 1rem;
            z-index: 1;
        }
        
        .form-group input {
            width: 100%;
            padding: 1rem 1rem 1rem 2.5rem;
            border: 2px solid #e5e7eb;
            border-radius: 0.75rem;
            font-size: 1rem;
            color: #1f2937;
            transition: all 0.3s ease;
            background: #ffffff;
            box-sizing: border-box;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }
        
        .form-group input.error {
            border-color: #ef4444;
            box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
        }
        
        .form-group input[type="date"] {
            padding-left: 2.5rem;
        }
        
        .error-message {
            color: #ef4444;
            font-size: 0.75rem;
            margin-top: 0.5rem;
            display: none;
            font-weight: 500;
        }
        
        .radio-group {
            display: flex;
            gap: 2rem;
            align-items: center;
            margin-top: 0.5rem;
        }
        
        .radio-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            transition: background-color 0.3s ease;
        }
        
        .radio-item:hover {
            background-color: #f3f4f6;
        }
        
        .radio-item input[type="radio"] {
            width: 1.25rem;
            height: 1.25rem;
            margin: 0;
            accent-color: #667eea;
        }
        
        .radio-item label {
            margin: 0;
            font-weight: 500;
            cursor: pointer;
        }
        
        .submit-btn {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }
        
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }
        
        .submit-btn:active {
            transform: translateY(-1px);
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }
        
        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        .login-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .server-error {
            color: #ef4444;
            font-size: 0.875rem;
            text-align: center;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            border-radius: 0.5rem;
            display: <%= request.getAttribute("error") != null ? "block" : "none" %>;
        }
        
        .success-message {
            color: #10b981;
            font-size: 0.75rem;
            margin-top: 0.5rem;
            display: none;
            font-weight: 500;
        }
        
        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.75rem;
        }
        
        .strength-bar {
            height: 4px;
            border-radius: 2px;
            margin-top: 0.25rem;
            transition: all 0.3s ease;
        }
        
        .strength-weak { background-color: #ef4444; width: 33%; }
        .strength-medium { background-color: #f59e0b; width: 66%; }
        .strength-strong { background-color: #10b981; width: 100%; }
        
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .form-container {
                padding: 1.5rem;
                margin: 10px;
            }
            
            .form-container h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1><i class="fas fa-user-plus"></i> Create Account</h1>
        <div class="server-error"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></div>
        
        <form action="registeruser" method="post" id="registerForm" onsubmit="return validateForm()">
            <div class="form-row">
                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Full Name</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="username"><i class="fas fa-at"></i> Username</label>
                    <div class="input-wrapper">
                        <i class="fas fa-at"></i>
                        <input type="text" id="username" name="username" placeholder="Choose a username" required>
                    </div>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Email Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="your.email@example.com" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone"><i class="fas fa-phone"></i> Phone Number</label>
                    <div class="input-wrapper">
                        <i class="fas fa-phone"></i>
                        <input type="text" id="telephone" name="telephone" placeholder="10-digit phone number" required pattern="[0-9]{10}" title="Please enter a 10-digit phone number">
                    </div>
                    <div class="error-message" id="telephone-error">Please enter a valid 10-digit phone number</div>
                    <div class="success-message" id="telephone-success">Phone number looks good!</div>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="dob"><i class="fas fa-calendar"></i> Date of Birth</label>
                    <div class="input-wrapper">
                        <i class="fas fa-calendar"></i>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-venus-mars"></i> Gender</label>
                    <div class="radio-group">
                        <div class="radio-item">
                            <input type="radio" id="male" name="gender" value="male" required>
                            <label for="male">Male</label>
                        </div>
                        <div class="radio-item">
                            <input type="radio" id="female" name="gender" value="female" required>
                            <label for="female">Female</label>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-group full-width">
                <label for="address"><i class="fas fa-home"></i> Address</label>
                <div class="input-wrapper">
                    <i class="fas fa-home"></i>
                    <input type="text" id="address" name="address" placeholder="Enter your complete address" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Create a strong password" required>
                    </div>
                    <div class="password-strength">
                        <div class="strength-bar" id="strength-bar"></div>
                        <span id="strength-text"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cpassword"><i class="fas fa-lock"></i> Confirm Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required>
                    </div>
                    <div class="error-message" id="cpassword-error">Passwords do not match</div>
                    <div class="success-message" id="cpassword-success">Passwords match!</div>
                </div>
            </div>
            
            <button type="submit" class="submit-btn">
                <i class="fas fa-user-plus"></i> Create Account
            </button>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login here</a>
            </div>
        </form>
    </div>
    
    <script>
        function validateForm() {
            let isValid = true;
            const telephone = document.getElementById('telephone');
            const password = document.getElementById('password');
            const cpassword = document.getElementById('cpassword');
            const telephoneError = document.getElementById('telephone-error');
            const cpasswordError = document.getElementById('cpassword-error');

            // Reset error states
            telephone.classList.remove('error');
            cpassword.classList.remove('error');
            telephoneError.style.display = 'none';
            cpasswordError.style.display = 'none';

            // Validate phone number
            const phonePattern = /^[0-9]{10}$/;
            if (!phonePattern.test(telephone.value)) {
                telephone.classList.add('error');
                telephoneError.style.display = 'block';
                isValid = false;
            }

            // Validate password match
            if (password.value !== cpassword.value) {
                cpassword.classList.add('error');
                cpasswordError.style.display = 'block';
                isValid = false;
            }

            return isValid;
        }

        // Password strength checker
        function checkPasswordStrength(password) {
            const strengthBar = document.getElementById('strength-bar');
            const strengthText = document.getElementById('strength-text');
            
            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[a-z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            
            strengthBar.className = 'strength-bar';
            if (strength <= 2) {
                strengthBar.classList.add('strength-weak');
                strengthText.textContent = 'Weak password';
                strengthText.style.color = '#ef4444';
            } else if (strength <= 4) {
                strengthBar.classList.add('strength-medium');
                strengthText.textContent = 'Medium password';
                strengthText.style.color = '#f59e0b';
            } else {
                strengthBar.classList.add('strength-strong');
                strengthText.textContent = 'Strong password';
                strengthText.style.color = '#10b981';
            }
        }

        // Real-time validation for confirm password
        document.getElementById('cpassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const cpassword = this.value;
            const cpasswordError = document.getElementById('cpassword-error');
            const cpasswordSuccess = document.getElementById('cpassword-success');
            
            if (cpassword === '') {
                this.classList.remove('error');
                cpasswordError.style.display = 'none';
                cpasswordSuccess.style.display = 'none';
            } else if (password !== cpassword) {
                this.classList.add('error');
                cpasswordError.style.display = 'block';
                cpasswordSuccess.style.display = 'none';
            } else {
                this.classList.remove('error');
                cpasswordError.style.display = 'none';
                cpasswordSuccess.style.display = 'block';
            }
        });

        // Real-time validation for phone number
        document.getElementById('telephone').addEventListener('input', function() {
            const phonePattern = /^[0-9]{10}$/;
            const telephoneError = document.getElementById('telephone-error');
            const telephoneSuccess = document.getElementById('telephone-success');
            
            if (this.value === '') {
                this.classList.remove('error');
                telephoneError.style.display = 'none';
                telephoneSuccess.style.display = 'none';
            } else if (!phonePattern.test(this.value)) {
                this.classList.add('error');
                telephoneError.style.display = 'block';
                telephoneSuccess.style.display = 'none';
            } else {
                this.classList.remove('error');
                telephoneError.style.display = 'none';
                telephoneSuccess.style.display = 'block';
            }
        });

        // Password strength checker
        document.getElementById('password').addEventListener('input', function() {
            checkPasswordStrength(this.value);
        });

        // Form animations
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
    </script>
</body>
</html>
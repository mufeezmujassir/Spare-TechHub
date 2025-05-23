<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Spare TechHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background-image: url('bg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 1rem 0;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        
        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }
        
        nav ul li a {
            text-decoration: none;
            color: #374151;
            font-weight: 600;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            position: relative;
        }
        
        nav ul li a:hover {
            color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }
        
        nav ul li a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            width: 0;
            height: 2px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }
        
        nav ul li a:hover::after {
            width: 80%;
        }
        
        h1 {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #1f2937;
            margin: 2rem 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 200px);
            padding: 2rem;
            gap: 3rem;
        }
        
        .image {
            flex: 1;
            max-width: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .logo5 {
            width: 100%;
            max-width: 350px;
            height: auto;
            border-radius: 1.5rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }
        
        .logo5:hover {
            transform: scale(1.05);
        }
        
        .login {
            flex: 1;
            max-width: 450px;
        }
        
        .form {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1.5rem;
            padding: 2.5rem;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .form h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #1f2937;
            text-align: center;
            margin-bottom: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
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
        
        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }
        
        .register-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        .register-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            text-align: center;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            border-radius: 0.5rem;
            display: <%= request.getAttribute("error") != null ? "block" : "none" %>;
            font-weight: 500;
        }
        
        footer {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            padding: 1.5rem;
            text-align: center;
            color: #6b7280;
            font-size: 0.875rem;
            margin-top: auto;
        }
        
        footer p {
            margin: 0;
            font-weight: 500;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                gap: 2rem;
                padding: 1rem;
            }
            
            .image {
                max-width: 300px;
            }
            
            .form {
                padding: 1.5rem;
                margin: 0 10px;
            }
            
            .form h2 {
                font-size: 1.5rem;
            }
            
            h1 {
                font-size: 2rem;
                margin: 1rem 0;
            }
            
            nav ul {
                gap: 1rem;
                padding: 0 1rem;
            }
            
            nav ul li a {
                font-size: 0.875rem;
                padding: 0.4rem 0.8rem;
            }
        }
        
        @media (max-width: 480px) {
            nav ul {
                flex-direction: column;
                align-items: center;
                gap: 0.5rem;
            }
            
            h1 {
                font-size: 1.5rem;
            }
            
            .form h2 {
                font-size: 1.25rem;
            }
        }
        
        /* Animation for form inputs */
        .form-group input {
            animation: fadeInUp 0.6s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Loading animation for submit button */
        .submit-btn.loading {
            background: linear-gradient(135deg, #9ca3af 0%, #6b7280 100%);
            cursor: not-allowed;
        }
        
        .submit-btn.loading::after {
            content: '';
            width: 16px;
            height: 16px;
            margin-left: 8px;
            border: 2px solid #ffffff;
            border-top: 2px solid transparent;
            border-radius: 50%;
            display: inline-block;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="header">
        <nav>
            <ul>
                <li><a href="#"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="#"><i class="fas fa-info-circle"></i> About Us</a></li>
                <li><a href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
            </ul>
        </nav>
    </div>
    
    <h1><i class="fas fa-desktop"></i> Welcome to Spare TechHub</h1>
    
    <div class="container">
        <div class="image">
            <img src="log1.jpg" class="logo5" alt="Spare TechHub Logo">
        </div>
        
        <div class="login">
            <div class="form">
                <h2><i class="fas fa-sign-in-alt"></i> Login to Your Account</h2>
                
                <div class="error-message">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </div>
                
                <form action="loginuser" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username</label>
                        <div class="input-wrapper">
                            <i class="fas fa-user"></i>
                            <input type="text" id="username" name="username" placeholder="Enter your username" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password</label>
                        <div class="input-wrapper">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="submit-btn" id="submitBtn">
                        <i class="fas fa-sign-in-alt"></i> Get Started
                    </button>
                    
                    <div class="register-link">
                        Don't have an account? <a href="register.jsp"><i class="fas fa-user-plus"></i> Create Account</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2024 Computer Spare TechHub. All rights reserved.</p>
    </footer>
    
    <script>
        // Form animations and interactions
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
        
        // Form submission with loading state
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Logging in...';
        });
        
        // Input validation styling
        document.querySelectorAll('input[required]').forEach(input => {
            input.addEventListener('blur', function() {
                if (this.value.trim() === '') {
                    this.classList.add('error');
                } else {
                    this.classList.remove('error');
                }
            });
            
            input.addEventListener('input', function() {
                if (this.classList.contains('error') && this.value.trim() !== '') {
                    this.classList.remove('error');
                }
            });
        });
        
        // Keyboard navigation enhancement
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                const activeElement = document.activeElement;
                if (activeElement.tagName === 'INPUT') {
                    const form = activeElement.closest('form');
                    const inputs = form.querySelectorAll('input');
                    const currentIndex = Array.from(inputs).indexOf(activeElement);
                    
                    if (currentIndex < inputs.length - 1) {
                        e.preventDefault();
                        inputs[currentIndex + 1].focus();
                    }
                }
            }
        });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customers or Sellers - Computer Spare Parts Management System</title>

		    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 15px 20px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
        }

        .nav {
            background-color: #444;
            overflow: hidden;
        }

        .nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .nav a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            width: 400px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }

        .admin-forms {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .admin-forms .form-container {
            flex: 1;
            margin: 10px;
        }

        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: absolute;
            width: 100%;
            bottom: -300;
        }

        @media (max-width: 768px) {
            .admin-forms {
                flex-direction: column;
            }
            .form-container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

	 <!-- Add Customer Form -->
<div class="form-container">
    <h3>Add Customer</h3>
    <form action="AdminServlet" method="get">
        <input type="hidden" name="action" value="addCustomer" />
        
        <label for="customerUsername">Username:</label>
        <input type="text" id="customerUsername" name="username" required />

        <label for="customerName">Name:</label>
        <input type="text" id="customerName" name="name" required />

        <label for="customerAddress">Address:</label>
        <input type="text" id="customerAddress" name="address" required />

        <label for="customerDob">Date of Birth:</label>
        <input type="date" id="customerDob" name="dob" required />

        <label for="customerGender">Gender:</label>
        <select id="customerGender" name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label for="customerEmail">Email:</label>
        <input type="email" id="customerEmail" name="email" required />

        <label for="customerPhone">Phone:</label>
        <input type="text" id="customerPhone" name="phone" required pattern="[0-9]{10}" title="Eneter 10 digits number only"  />

        <label for="customerPassword">Password:</label>
        <input type="password" id="customerPassword" name="password" required />
        
        <label for="customerPassword">Confirm Password:</label>
        <input type="password" id="customerPassword" name="cpassword" required />
		<input type="hidden" name="id" value="user">
        

        <input type="submit" value="Add Customer" />
    </form>
</div>

            <!-- Add Seller Form -->
<div class="form-container">
    <h3>Add Seller</h3>
    <form action="AdminServlet" method="get">
        <input type="hidden" name="action" value="addSeller" />
        
        <label for="sellerUsername">Username:</label>
        <input type="text" id="sellerUsername" name="username" required />

        <label for="sellerName">Name:</label>
        <input type="text" id="sellerName" name="name" required />

        <label for="sellerAddress">Address:</label>
        <input type="text" id="sellerAddress" name="address" required />

        <label for="sellerDob">Date of Birth:</label>
        <input type="date" id="sellerDob" name="dob" required />

        <label for="sellerGender">Gender:</label>
      

        <label for="sellerEmail">Email:</label>
        <input type="email" id="sellerEmail" name="email" required />

        <label for="sellerPhone">Phone:</label>
        <input type="text" id="sellerPhone" name="phone" required pattern="[0-9]{10}" title="Eneter 10 digits number only"/>

        <label for="sellerPassword">Password:</label>
        <input type="password" id="sellerPassword" name="password" required />
		<input type="hidden" name="id" value="seller">
        

        <input type="submit" value="Add Seller" />
    </form>
</div>
	
	  <div class="footer">
        <p>&copy; 2024 Computer Spare Parts Management System</p>
    </div>
	
</body>
</html>
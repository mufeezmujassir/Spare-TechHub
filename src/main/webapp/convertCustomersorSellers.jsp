<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Convert Customers or Sellers - Computer Spare Parts Management System</title>
	
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
    
	  <!-- Convert Customer to Seller Form -->
            <div class="form-container">
                <h3>Convert Customer to Seller</h3>
                <form action="UpdateCustomerType" method="get">
                    
                    <label for="customerToSellerId">Customer UserName:</label>
                    <input type="text" id="customerToSellerId" name="username" required />
                    <input type="hidden" name="type" value="seller" >
                    <input type="submit" value="Convert to Seller" />
                </form>
            </div>

            <!-- Convert Seller to Customer Form -->
            <div class="form-container">
                <h3>Convert Seller to Customer</h3>
                <form action="UpdateCustomerType" method="get">
                    <input type="hidden" name="action" value="convertSellerToCustomer" />
                    <label for="sellerToCustomerId">Seller UserName:</label>
                    <input type="text" id="sellerToCustomerId" name="username" required />
                    <input type="hidden" name="type" value="user" >
                    <input type="submit" value="Convert to Customer" />
                </form>
            </div>
        </div>
    </div>
    
     <div class="footer">
        <p>&copy; 2024 Computer Spare Parts Management System</p>
    </div>
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            background-color: #f4f4f4; /* Light background color */
        }
        
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: gray; /* Darker green background */
            color: white; /* White text color */
            border-bottom: 2px solid #ddd;
        }

        .header .image img {
            margin-right: 10px;
        }

        .header .name h1 {
            font-size: 24px;
            margin: 0;
            font-weight: 700; /* Bold font */
        }

        .header .shoppingCart {
            margin-right: 10px; /* Reduced space between cart and status */
        }

        .header .shoppingCart a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .header .shoppingCart a img {
            margin-right: 5px;
        }

        .header .status {
            display: flex;
            align-items: center;
        }

        .header .status a {
            color: white;
            text-decoration: none;
            margin-left: 5px; /* Reduced space between links */
        }

        .header .status a:hover {
            text-decoration: underline;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            width: 100%;
        }

        li {
            float: left;
        }

        li a, .dropbtn {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s; /* Smooth transition for hover */
        }

        li a:hover, .dropdown:hover .dropbtn {
            background-color: #575757; /* Darker gray on hover */
        }

        li.dropdown {
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #575757; /* Darker gray on hover */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
<% String Username = (String) request.getSession().getAttribute("username");%>
    <div class="header">
        <div class="image">
            <img src="log1.jpg" width="40px" height="40px" alt="Logo" style="border-radius:100%;">
        </div>
        <div class="name">
            <h1>Spare TechHub</h1>
        </div>
        <div class="shoppingCart">
            <a href="selectServlat?id=<%= Username%>"><img src="shoppingcart.png" width="40px" height="30px" alt="Cart"> Cart</a>
        </div>
        <div class="status">
            <%
            
        
                if (Username != null) {
            %>
            <a href="profileuser?profile=<%= Username %>">Hello, <%= Username %>!</a>
            / <a href="logoutuser"> Logout</a>
            <% } else { %>
                <a href="login.jsp">Login</a> / <a href="register.jsp"> Register</a>
            <% } %>
        </div>
    </div>
	<% String type=(String)request.getSession().getAttribute("type");
	if("user".equals(type)){ %>
	<ul>
        <li><a href="homeservlat">Home</a></li>
        <li><a href="#news">About Us</a></li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Monitors & Displays</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Monitor">Monitor</a>
                <a href="productDetails?id=Projector">Projector</a>
            </div>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Computing Components</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Processor">Processor</a>
                <a href="productDetails?id=Motherboard">Motherboard</a>
                <a href="productDetails?id=Memory">Memory </a>
                <a href="productDetails?id=Graphic Card">Graphic Card </a>
                <a href="productDetails?id=Power Supply">Power Supply </a>
            </div>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Storage Solutions</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Casing">Casing</a>
                <a href="productDetails?id=Cooler">Cooler</a>
            </div>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Input Devices</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Mouse">Mouse</a>
                <a href="productDetails?id=Keyboard">Keyboard</a>
                <a href="productDetails?id=Drawing Pad">Drawing Pad</a>
                <a href="productDetails?id=Webcam">Webcam</a>
            </div>
        </li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Output Devices</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Printers">Printer</a>
                <a href="productDetails?id=Scanner">Scanner</a>
                <a href="productDetails?id=Speaker">Speaker</a>
            </div>
        </li>
    </ul>
    <%}else if("seller".equals(type)){ %>
    <ul>
        <li><a href="homeservlat">Home</a></li>
        <li><a href="#news">About Us</a></li>
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Products</a>
            <div class="dropdown-content">
                <a href="productDetails?id=Monitor">Monitor</a>
                <a href="productDetails?id=Projector">Projector</a>
                <a href="productDetails?id=Processor">Processor</a>
                <a href="productDetails?id=Motherboard">Motherboard</a>
                <a href="productDetails?id=Memory">Memory </a>
                <a href="productDetails?id=Graphic Card">Graphic Card </a>
                <a href="productDetails?id=Power Supply">Power Supply </a>
                <a href="productDetails?id=Casing">Casing</a>
                <a href="productDetails?id=Cooler">Cooler</a>
                <a href="productDetails?id=Mouse">Mouse</a>
                <a href="productDetails?id=Keyboard">Keyboard</a>
                <a href="productDetails?id=Drawing Pad">Drawing Pad</a>
                <a href="productDetails?id=Webcam">Webcam</a>
                <a href="productDetails?id=Printers">Printer</a>
                <a href="productDetails?id=Scanner">Scanner</a>
                <a href="productDetails?id=Speaker">Speaker</a>
            </div>
        </li>
        <li><a href="ordersdetails?username=<%=Username %>">About Us</a></li>
        <li class="dropdown">
            <a href="Dashboard?id=<%= Username %>" class="dropbtn">DashBoard</a>
            <div class="dropdown-content">
                
            </div>
        </li>
        <li class="dropdown">
            <a href="OrderedDetails?id=<%= Username %>" class="dropbtn">Orders</a>
            <div class="dropdown-content">
                
            </div>
        </li>
        
    </ul>
    <%}else if("admin".equals("admin")){ %>
    	<ul>
        <li><a href="homeservlat">Home</a></li>
        <li><a href="#news">About Us</a></li>
       
       <li> <a href="selectUser">Dashboard</a></li>
       <li> <a href="addCustomersorSellers.jsp">Add Customers or Sellers</a></li>
       <li> <a href="deleteCustomersorSellers.jsp">Delete customers or Sellers</a></li>
      <li>  <a href="convertCustomersorSellers.jsp">Convert Customers or Sellers</a></li>
    </ul>
    <%} %>
    
</body>
</html>

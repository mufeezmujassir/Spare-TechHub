<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homeServlat.homeservlat.Product" %> <!-- Update with the correct package name -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Spare Parts Store</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: white;
            padding: 15px 0;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #444;
            padding: 10px 0;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            transition: background-color 0.3s;
            border-radius: 5px;
        }
        nav a:hover {
            background-color: #555;
        }
        .carousel {
            position: relative;
            max-width: 100%;
            overflow: hidden;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .slides {
            display: flex;
            transition: transform 0.5s ease;
        }
        .slide {
            min-width: 100%;
        }
        .slide img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 15px;
            width: calc(30% - 30px);
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
            overflow: hidden; /* Added to prevent overflow of content */
            position: relative; /* For pseudo-element effect */
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }
        .card img {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s; /* Smooth image scale effect */
        }
        .card:hover img {
            transform: scale(1.1); /* Image scale effect on hover */
        }
        .card h3 {
            margin: 10px 0;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.2);
        }
        .intro {
            text-align: center;
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #218838; /* Darker green on hover */
        }
        .message-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #2f80ed;
    border-radius: 50%;
    padding: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1000;
    font-size: 24px;
    color: white;
    text-align: center;
    cursor: pointer;
}

.message-icon a {
    color: white;
    text-decoration: none;
}

.message-icon:hover {
    background-color: #1a60d1;
}
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="carousel">
        <div class="slides" id="slides">
            <div class="slide"><img src="slid1.jpg" alt="Hero Image 1"></div>
            <div class="slide"><img src="slid2.jpg" alt="Hero Image 2"></div>
            <div class="slide"><img src="slid3.jpg" alt="Hero Image 3"></div>
        </div>
    </div>

    <div class="intro">
        <h2>Welcome to Our Online Spare Parts Store!</h2>
        <p>Your one-stop shop for all spare parts needs. We offer a wide range of products to suit your needs and ensure quality and affordability. Explore our latest products and enjoy exclusive deals!</p>
        <p>Looking for something specific? Use our search feature or browse our categories!</p>
        <button class="button" onclick="location.href='categories.jsp'">Browse Categories</button> <!-- Added a button -->
    </div>

    <div class="container">
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <div class="card">
                <img src="${pageContext.request.contextPath}/image/<%= product.getImage() %>" alt="Product Image">
                <h3><%= product.getPname() %></h3>
                <p>Price: Rs.<%= product.getPrice() %></p>
                <button class="button" onclick="location.href='shop.jsp?id=<%= product.getIdproduct() %>'">Shop Now</button>
            </div>
        <%
                }
            } else {
        %>
            <p>No products available.</p>
        <%
            }
        %>
    </div>

    <div class="footer">
        <p>&copy; 2024 Computer Spare Parts Management. All rights reserved.</p>
    </div>
	 <div class="message-icon">
        <a href="message.jsp">💬</a>
    </div>
    <script>
        let currentIndex = 0;
        const slides = document.getElementById('slides');
        const totalSlides = slides.children.length;

        function showNextSlide() {
            currentIndex = (currentIndex + 1) % totalSlides;
            slides.style.transform = 'translateX(' + (-currentIndex * 100) + '%)';
        }

        setInterval(showNextSlide, 3000);
    </script>
    
    
</body>
</html>

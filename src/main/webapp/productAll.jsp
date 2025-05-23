	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homeServlat.productDetails.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }
        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        
        a {
            color: #4CAF50;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <h2>Product Details</h2>
    <table>
        <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("productList");
            if (products != null) {
                for (Product product : products) {
        %>
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/image/<%= product.getImage() %>" 
                     alt="Image of <%= product.getPname() %>" style="width:100px;height:auto;border-radius:8px;">
            </td>
            <td>
                <strong>Name:</strong> <%= product.getPname() %><br>
                <strong>Product Type:</strong> <%= product.getProducttype() %><br>
                <strong>Price:</strong> Rs.<%= product.getPrice() %><br>
                <strong>Quantity:</strong> <%= product.getQuantity() %><br>
                <strong>Description:</strong> <%= product.getDescription() %><br>
                <a href="cart?id=<%= product.getIdproduct() %>">Shop Now</a>
            </td>
        </tr>
        <%
                }	
            } else {
        %>
        <tr>
            <td colspan="2">No product details available.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>

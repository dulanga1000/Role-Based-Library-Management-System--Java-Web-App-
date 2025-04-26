<%-- 
    Document   : dashboard
    Created on : Apr 25, 2025, 9:27:41 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Welcome, <%= user.getUsername() %> [<%= user.getRole() %>]</h2>
    <% if ("Student".equals(user.getRole())) { %>
        <a href="searchBook.jsp">Search & Reserve Books</a><br/>
    <% } else if ("Admin".equals(user.getRole())) { %>
        <a href="addBook.jsp">Add Books</a><br/>
        <a href="viewReservations.jsp">View Reservations</a><br/>
    <% } %>
    <a href="logout">Logout</a>
</body>
</html>


<%-- 
    Document   : addBook
    Created on : Apr 25, 2025, 9:30:41 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Add New Book</h2>
    <form action="addBook" method="post">
        Title: <input type="text" name="title"/><br/>
        Author: <input type="text" name="author"/><br/>
        <input type="submit" value="Add Book"/>
    </form>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>

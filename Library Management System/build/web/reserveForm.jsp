<%-- 
    Document   : reserveForm
    Created on : Apr 25, 2025, 9:30:28 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    String bookId = request.getParameter("bookId");
    if (bookId == null) {
        response.sendRedirect("searchBook.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reserve Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Reserve Book ID: <%= bookId %></h2>
    <form action="reserveBook" method="post">
        <input type="hidden" name="bookId" value="<%= bookId %>"/>
        Student Name: <input type="text" name="studentName" value="<%= user.getUsername() %>" readonly/><br/>
        <input type="submit" value="Confirm Reservation"/>
    </form>
    <a href="searchBook.jsp">Back to Search</a>
</body>
</html>

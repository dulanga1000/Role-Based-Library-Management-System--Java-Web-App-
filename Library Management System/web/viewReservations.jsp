<%-- 
    Document   : viewReservations
    Created on : Apr 25, 2025, 9:30:56 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.User, model.Reservation, dao.ReservationDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    ReservationDAO dao = new ReservationDAO();
    List<Reservation> reservationList = dao.getAllReservations();
%>
<html>
<head>
    <title>All Reservations</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Book Reservations</h2>
    <% for (Reservation r : reservationList) { %>
        <p><b><%= r.getStudentName() %></b> reserved Book ID: <%= r.getBookId() %> on <%= r.getReservationDate() %></p>
    <% } %>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>

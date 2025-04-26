<%-- 
    Document   : bookList
    Created on : Apr 25, 2025, 9:30:04 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Book" %>
<link rel="stylesheet" href="style.css">
<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>

<% if (bookList == null || bookList.isEmpty()) { %>
    <p>No books available.</p>
<% } else { %>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th><th>Title</th><th>Author</th><th>Status</th><th>Action</th>
        </tr>
        <% for (Book book : bookList) { %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getStatus() %></td>
                <td>
                    <% if ("Available".equalsIgnoreCase(book.getStatus())) { %>
                        <a href="reserveForm.jsp?bookId=<%= book.getId() %>">Reserve</a>
                    <% } else { %>
                        Not Available
                    <% } %>
                </td>
            </tr>
        <% } %>
    </table>
<% } %>


<%-- 
    Document   : searchBook
    Created on : Apr 25, 2025, 9:29:47 PM
    Author     : dulan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,dao.BookDAO,model.Book" %>
<link rel="stylesheet" href="style.css">
<%
    BookDAO dao = new BookDAO();
    List<Book> books = dao.getAvailableBooks();
%>
<h2>Available Books</h2>
<table border="1">
<tr><th>Title</th><th>Author</th><th>Action</th></tr>
<% for (Book b : books) { %>
<tr>
    <td><%= b.getTitle() %></td>
    <td><%= b.getAuthor() %></td>
    <td>
        <form action="reserveForm.jsp" method="get">
            <input type="hidden" name="bookId" value="<%= b.getId() %>" />
            <input type="submit" value="Reserve" />
        </form>
    </td>
</tr>
<% } %>
</table>

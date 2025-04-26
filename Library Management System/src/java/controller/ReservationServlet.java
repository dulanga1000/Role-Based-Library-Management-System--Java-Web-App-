/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Reservation;
import dao.ReservationDAO;

@WebServlet("/reserveBook")
public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookIdStr = request.getParameter("bookId");
        if (bookIdStr == null || bookIdStr.isEmpty()) {
            response.sendRedirect("searchBook.jsp");
            return;
        }

        int bookId = Integer.parseInt(bookIdStr);
        String studentName = request.getParameter("studentName");

        Reservation reservation = new Reservation();
        reservation.setBookId(bookId);
        reservation.setStudentName(studentName);
        reservation.setReservationDate(java.time.LocalDate.now().toString()); // today's date

        ReservationDAO dao = new ReservationDAO();
        dao.reserveBook(reservation);

        response.sendRedirect("dashboard.jsp");
    }
}
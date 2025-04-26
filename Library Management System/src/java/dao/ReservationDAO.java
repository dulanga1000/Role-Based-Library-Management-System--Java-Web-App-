/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author dulan
 */
import java.sql.*;
import java.util.*;
import model.Reservation;

public class ReservationDAO {
    private Connection getConnection() throws Exception {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
    }

    public void reserveBook(Reservation reservation) {
        try {
            Connection conn = getConnection();
            String sql = "INSERT INTO reservations (book_id, student_name, reservation_date) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, reservation.getBookId());
            stmt.setString(2, reservation.getStudentName());
            stmt.setString(3, reservation.getReservationDate());
            stmt.executeUpdate();

            // Update book status
            String updateStatus = "UPDATE books SET status = 'Reserved' WHERE id = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateStatus);
            updateStmt.setInt(1, reservation.getBookId());
            updateStmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            String sql = "SELECT * FROM reservations";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setBookId(rs.getInt("book_id"));
                r.setStudentName(rs.getString("student_name"));
                r.setReservationDate(rs.getString("reservation_date"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
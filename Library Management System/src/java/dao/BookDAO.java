/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author dulan
 */
import model.Book;
import java.sql.*;
import java.util.*;

public class BookDAO {
    private Connection getConnection() throws Exception {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
    }

    public void addBook(Book book) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO books (title, author, status) VALUES (?, ?, ?)")) {
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Book> getAvailableBooks() {
        List<Book> books = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE status='Available'")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getString("author"));
                b.setStatus(rs.getString("status"));
                books.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    public void reserveBook(int bookId) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE books SET status='Reserved' WHERE id=?")) {
            ps.setInt(1, bookId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
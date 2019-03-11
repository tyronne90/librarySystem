package com.sgc.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sgc.model.Books;

public class BooksDAO {

	private static Connection con;

    public static int SaveBook(Books book) throws SQLException {
        int status = 0;
        try {
            con = DatabaseConnection.getConnection();
            String addBook = "INSERT INTO books (bookId,bookName,bookDescription,mainclass,subclass,isbn,author) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(addBook);
            ps.setString(1, book.getBookId());
            ps.setString(2, book.getBookName());
            ps.setString(3, book.getBookDescription());
            ps.setString(4, book.getMainClass());
            ps.setString(5, book.getSubClass());
            ps.setString(6, book.getIsbn());
            ps.setString(7, book.getAuthor());
            status = ps.executeUpdate();      
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return status;
    }

    public static List<Books> viewBook() throws SQLException {
        List<Books> books = new ArrayList<>();
        try {
            con = DatabaseConnection.getConnection();
            String viewBook = "SELECT * FROM books";
            PreparedStatement ps = con.prepareStatement(viewBook);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Books book = new Books();
                book.setBookId(rs.getString(2));
                book.setBookName(rs.getString(3));
                book.setBookDescription(rs.getString(4));
                book.setMainClass(rs.getString(5));
                book.setSubClass(rs.getString(6));
                book.setIsbn(rs.getString(7));
                book.setAuthor(rs.getString(8));
                books.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return books;
        
    }
    
    public static List<Books> viewOneBook(String bookid) throws SQLException {
        List<Books> books = new ArrayList<>();
        try {
            con = DatabaseConnection.getConnection();
            String viewBook = "SELECT * FROM books WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(viewBook);
            ps.setString(1,bookid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Books book = new Books();
                book.setBookId(rs.getString(2));
                book.setBookName(rs.getString(3));
                book.setBookDescription(rs.getString(4));
                book.setMainClass(rs.getString(5));
                book.setSubClass(rs.getString(6));
                book.setIsbn(rs.getString(7));
                book.setAuthor(rs.getString(8));
                books.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return books;
    
    
    }public static List<Books> viewOneBook(String cOption, String tSearch) throws SQLException {
        List<Books> books = new ArrayList<>();
        try {
            con = DatabaseConnection.getConnection();
            System.out.print(cOption);
            String viewBook = "SELECT * FROM books WHERE "+cOption+" = ?";
            PreparedStatement ps = con.prepareStatement(viewBook);
            //ps.setString(1,cOption);
            ps.setString(1,tSearch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Books book = new Books();
                book.setBookId(rs.getString(2));
                book.setBookName(rs.getString(3));
                book.setBookDescription(rs.getString(4));
                book.setMainClass(rs.getString(5));
                book.setSubClass(rs.getString(6));
                book.setIsbn(rs.getString(7));
                book.setAuthor(rs.getString(8));
                books.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnection.closeConnection();
        }
        return books;
    }
    
    public static int deleteBook(String bookid) throws SQLException{
      int status = 0;
       con = DatabaseConnection.getConnection();
       String deleteBook = "DELETE FROM books WHERE bookId=?";
       PreparedStatement ps=con.prepareStatement(deleteBook);
       ps.setString(1,bookid);
       status = ps.executeUpdate();
       con.close();
       return status;
    }
    
    
    public static int UpdateBook(Books book) throws SQLException{
        int status = 0;
        try {
            con = DatabaseConnection.getConnection();
            String updateBook = "UPDATE books SET bookName=?, bookDescription=?, mainclass=?, subclass=?, isbn=?, author=? WHERE bookId=?";
            PreparedStatement ps = con.prepareStatement(updateBook);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getBookDescription());
            ps.setString(3, book.getMainClass());
            ps.setString(4, book.getSubClass());
            ps.setString(5, book.getIsbn());
            ps.setString(6, book.getAuthor());
            ps.setString(7, book.getBookId());
            status = ps.executeUpdate();
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ps.toString());

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{DatabaseConnection.closeConnection();}
        return status;

    }
    
}

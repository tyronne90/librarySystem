package com.sgc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgc.data.BooksDAO;
import com.sgc.model.Books;

@WebServlet("/AddBookController")
public class AddBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int status;
		try {
	        String bid = request.getParameter("id");
			status = BooksDAO.deleteBook(bid);
			if(status>0){ out.print("<p>successfully Deleted!</p>");	        }
	        else{out.print("<p>failed!</p>");}
		} catch (SQLException e) {
			out.print(e);
		}
        
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int status=0;
		try {       
        String bookID = request.getParameter("bookId");
        String bookName = request.getParameter("bookName");
        String bookDescription = request.getParameter("bookDescription");
        String mainClassification = request.getParameter("mainClassificationName");
        String subClassification = request.getParameter("subClassificationName");
        String isbn = request.getParameter("isbn");
        String author = request.getParameter("author");
        
        Books book = new Books();
        book.setBookId(bookID);
        book.setBookName(bookName);
        book.setBookDescription(bookDescription);
        book.setMainClass(mainClassification);
        book.setSubClass(subClassification);
        book.setIsbn(isbn);
        book.setAuthor(author);

			status = BooksDAO.SaveBook(book);
        if (status > 0) {
            out.print("<p>Record saved successfully!</p>");
            request.getRequestDispatcher("success.jsp").include(request, response);
        } else {
            out.println("Sorry! unable to save record");
        }
		} catch (SQLException e) {
			out.print(e);
		}
	}

}

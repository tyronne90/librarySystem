package com.sgc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgc.data.BooksDAO;
import com.sgc.model.Books;

/**
 * Servlet implementation class BookController
 */
@WebServlet("/BookController")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            response.setContentType("text/html");
	            //PrintWriter out = response.getWriter();
	            List<Books> books = BooksDAO.viewBook();
	            request.setAttribute("books", books);
	            request.getRequestDispatcher("Books.jsp").include(request, response);
	        } catch (SQLException ex) {
	            System.out.print(ex);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            response.setContentType("text/html");
            //PrintWriter out = response.getWriter();
            String bookid = request.getParameter("bookId");
            List<Books> list = BooksDAO.viewOneBook(bookid);
            request.setAttribute("books", list);
        } catch (SQLException ex) {
        	 System.out.print(ex);
        }
	}

}

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

/**
 * Servlet implementation class UpdateBookController
 */
@WebServlet("/UpdateBookController")
public class UpdateBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s = request.getParameter("editBookId");
		System.out.print(s);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		try {
            String uBookId = request.getParameter("ubookId");
            String uBookName = request.getParameter("ubookName");
            String uBookDescription = request.getParameter("ubookDescription");
            String uMainClassification= request.getParameter("umainClassificationName");
            String uSubClassification = request.getParameter("usubClassificationName");
            String uIsbn = request.getParameter("uisbn");
            String uAuthor = request.getParameter("uauthor");
            
            Books book = new Books();
            book.setBookId(uBookId);
            book.setBookName(uBookName);
            book.setBookDescription(uBookDescription);
            book.setMainClass(uMainClassification);
            book.setSubClass(uSubClassification);
            book.setIsbn(uIsbn);
            book.setAuthor(uAuthor);
            
            int status = BooksDAO.UpdateBook(book);
            if(status>0){
                //out.print("<p>successfully Updated!</p>");
                request.getRequestDispatcher("Books.jsp").include(request, response);
            }else{
                out.print("<p>Failed</p>");
            }
        } catch (SQLException ex) {
        	out.print(ex);
        }
	}

}

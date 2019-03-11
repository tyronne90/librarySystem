package com.sgc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgc.data.SubClassificationDAO;

/**
 * Servlet implementation class DeleteSubClassification
 */
@WebServlet("/DeleteSubClassification")
public class DeleteSubClassification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
		try {
            String sid = request.getParameter("id");
            int status = SubClassificationDAO.deleteSubClassification(Integer.parseInt(sid));
            if(status>0){
                out.print("<p>successfully Deleted!</p>");
            }
            else{out.print("<p>failed!</p>");}
        } catch (SQLException ex) {
        	out.print(ex);
        }
	}

}

package com.sgc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgc.data.MainClassificationDAO;
import com.sgc.model.MainClassification;

/**
 * Servlet implementation class UpdateMainClassification
 */
@WebServlet("/UpdateMainClassification")
public class UpdateMainClassification extends HttpServlet {
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
		try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            
            String id = request.getParameter("uMainClassificationId");
            String mainClassfication = request.getParameter("uMainClassificationName");
            
            MainClassification mainClass = new MainClassification();
            mainClass.setId(Integer.parseInt(id));
            mainClass.setMainClass(mainClassfication);
            
            int status = MainClassificationDAO.UpdateMainClassification(mainClass);
            if(status>0){
                //out.print("<p>successfully Updated!</p>");
                request.getRequestDispatcher("MainClassification.jsp").include(request, response);
            }else{
                out.print("<p>Failed</p>");
            }
        } catch (SQLException ex) {
        	System.out.print(ex);
        }
	}

}

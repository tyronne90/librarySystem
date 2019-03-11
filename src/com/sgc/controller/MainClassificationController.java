package com.sgc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgc.data.MainClassificationDAO;
import com.sgc.model.MainClassification;

/**
 * Servlet implementation class MainClassificationController
 */
@WebServlet("/MainClassificationController")
public class MainClassificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        List<MainClassification> mainclassification;
		try {
			mainclassification = MainClassificationDAO.viewMainClassification();
			request.setAttribute("mainclassifications", mainclassification);
	        request.getRequestDispatcher("MainClassification.jsp").include(request, response);
		} catch (SQLException e) {
			out.println(e);
		}
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String mainClassName = request.getParameter("mainClassificationName");
        
        MainClassification mainClass = new MainClassification();
        mainClass.setMainClass(mainClassName);
       
        int status;
		try {
			status = MainClassificationDAO.AddMainClassification(mainClass);
			 if (status > 0) {
		            out.print("<p>Record saved successfully!</p>");
		            //request.getRequestDispatcher("success.jsp").include(request, response);
		        } else {
		            out.println("Sorry! unable to save record");
		        }
		} catch (SQLException e) {
			 out.println(e);
		}
       
	}

}

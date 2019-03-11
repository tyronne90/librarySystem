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
import com.sgc.model.SubClassification;

/**
 * Servlet implementation class UpdateSubClassification
 */
@WebServlet("/UpdateSubClassification")
public class UpdateSubClassification extends HttpServlet {
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
            String id = request.getParameter("uSubClassificationId");
            String subClassfication = request.getParameter("uSubClassificationName");
            String mainClassfication = request.getParameter("uMainClassificationName");
            
            SubClassification subClass = new SubClassification();
            subClass.setId(Integer.parseInt(id));
            subClass.setSubClass(subClassfication);
            subClass.setMainClass(mainClassfication);
            
            int status = SubClassificationDAO.UpdateSubClassification(subClass);
            if(status>0){
                //out.print("<p>successfully Updated!</p>");
                request.getRequestDispatcher("SubClassification.jsp").include(request, response);
            }else{
                out.print("<p>Failed</p>");
            }
        } catch (SQLException ex) {
        	out.print(ex);
        }
	}

}

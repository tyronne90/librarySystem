<%@page import="java.util.List"%>
<%@page import="com.sgc.data.SubClassificationDAO"%>
<%@page import="com.sgc.model.SubClassification"%>
<%@page import="java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
           String mainClassName = request.getParameter("mainclass");
           //String mainClassName = "Maths";
            SubClassification subClass = new SubClassification();
            subClass.setMainClass(mainClassName);
            List<SubClassification> subclasses = SubClassificationDAO.viewSubClassification(subClass);
            request.setAttribute("subclasses", subclasses);
        %>        
        <select class="subclass">
            <c:forEach items="${subclasses}" var="subclassification">
                <option value="${subclassification.subClass}"> ${subclassification.subClass} </option>
            </c:forEach>
        </select>
        
      
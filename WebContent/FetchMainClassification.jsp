<%@page import="com.sgc.data.MainClassificationDAO"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table class="table" id="mainclassification">
            <thead> 
                <tr>
                    <th>ID</th>
                    <th>Main classification</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
               
                <%
                    List<MainClassification> mainclasses = MainClassificationDAO.viewMainClassification();
                    request.setAttribute("mainclasses", mainclasses);
                %>
                <c:forEach items="${mainclasses}" var="mainclassification">
                    <tr>
                        <td>${mainclassification.id}</td>
                        <td>${mainclassification.mainClass}</td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_mainclassification${mainclassification.id}"><span class="glyphicon glyphicon-trash"></span></button>
                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#edit_mainclassification${mainclassification.id}"><span class="glyphicon glyphicon-edit"></span></button>
                        </td>
                    </tr>
                </c:forEach>
                
        
        </tbody>
    </table>
                
</body>
</html>

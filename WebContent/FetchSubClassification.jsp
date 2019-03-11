<%@page import="com.sgc.data.SubClassificationDAO"%>
<%@page import="com.sgc.model.SubClassification"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table class="table" id="subclassification">
            <thead> 
                <tr>
                    <th>ID</th>
                    <th>Sub classification</th>
                    <th>Main classification</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <%
                    List<SubClassification> subclasses = SubClassificationDAO.viewSubClassification();
                    request.setAttribute("subclasses", subclasses);
                %>
                <c:forEach items="${subclasses}" var="subclassification">
                    <tr>
                        <td>${subclassification.id}</td>
                        <td>${subclassification.subClass}</td>
                        <td>${subclassification.mainClass}</td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_SubClassification${subclassification.id}"><span class="glyphicon glyphicon-trash"></span></button>
                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#edit_SubClassification${subclassification.id}"><span class="glyphicon glyphicon-edit"></span></button>
                        </td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>

    </body>
</html>

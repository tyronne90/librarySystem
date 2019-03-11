<%@page import="java.util.List"%>
<%@page import="com.sgc.data.BooksDAO"%>
<%@page import="com.sgc.model.Books"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table class="table" id="book">
            <thead> 
                <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Book Description</th>
                    <th>Main Classification</th>
                    <th>Sub Classification</th>
                    <th>ISBN</th>
                    <th>Author</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Books> books = BooksDAO.viewBook();
                    request.setAttribute("books", books);
                %>

                <c:forEach items="${books}" var="book">
                <tr>
                        <td>${book.bookId}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookDescription}</td>
                        <td>${book.mainClass}</td>
                        <td>${book.subClass}</td>
                        <td>${book.isbn}</td>
                        <td>${book.author}</td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_book${book.bookId}"><span class="glyphicon glyphicon-trash"></span></button>
                            <a href="UpdateBook.jsp?uid=${book.bookId}" data-target="#edit_book${book.bookId}" id="edit_book" data-id="${book.bookId}">
                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#edit_book${book.bookId}" id="edit_book" data-id="${book.bookId}"><span class="glyphicon glyphicon-edit"></span></button>
                        	</a>
                        </td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>

    </body>
    
    <script type="text/javascript">
    
    </script>
    
</html>




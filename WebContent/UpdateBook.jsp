  
<%@page import="java.util.List"%>
<%@page import="com.sgc.data.BooksDAO"%>
<%@page import="com.sgc.model.Books"%>

<%@page import="com.sgc.model.MainClassification"%>
<%@page import="com.sgc.data.MainClassificationDAO"%>

<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file = "ini/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
        <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
        <link rel="stylesheet" href="assets/css/main.css">

    </head>

<body>


<!-- Edit book  -->
        <%
            List<MainClassification> mainclasses = MainClassificationDAO.viewMainClassification();
            request.setAttribute("mainclasses", mainclasses);
        %>
        <%
        String bookid = request.getParameter("uid");
            List<Books> book = BooksDAO.viewOneBook(bookid);
            request.setAttribute("books", book);
  
        %>
<div class="container">
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-4">
		<c:forEach items="${books}" var="book">
          
                            <form action="UpdateBookController" method="POST" id="form_book">
                                <div class="form-group">
                                    <label>Book ID</label>
                                    <input type="text" name="ubookId" id="ubookId" class="form-control" placeholder="Book ID" value="${book.bookId}" readonly></input>
                                </div>

                                <div class="form-group">
                                    <label>Book Name</label>
                                    <input type="text" name="ubookName" id="ubookName" class="form-control" placeholder="Book Name" value="${book.bookName}"></input>
                                </div>

                                <div class="form-group">
                                    <label>Book Description</label>
                                    <input type="text" name="ubookDescription" id="ubookDescription" class="form-control" placeholder="Book Description" value="${book.bookDescription}"></input>
                                </div>
                                
                                
                                 <div class="form-group">
                                <label>Main Classification</label>
                                <select name='umainClassificationName' id='umainClassificationName' onchange="Umainclass_change()" class='form-control'>
                                    <option> ${book.mainClass} </option>

                                    <c:forEach items="${mainclasses}" var="mainclassification">         
                                        <option value='${mainclassification.mainClass}'> ${mainclassification.mainClass} </option>
                                    </c:forEach>  
                                </select>

                            </div>

                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select name='usubClassificationName' id='usubclass' class='form-control'>
                                <option> ${book.subClass} </option>
                                </select>
                            </div>


                                <div class="form-group">
                                    <label>ISBN</label>
                                    <input type="text" name="uisbn" id="uisbn" class="form-control" placeholder="ISBN" value="${book.isbn}"></input>
                                </div>
                                <div class="form-group">
                                    <label>Author</label>
                                    <input type="text" name="uauthor" id="uauthor" class="form-control" placeholder="Author" value="${book.author}"></input>
                                </div>

                                <div id="result"></div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary" id="edit_book" name="edit_book" value="Update"/>
                                </div>
                            </form> 

        </c:forEach>

</div>
<div class="md"></div>
 </div>  

</div>

</body>

 <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="assets/vendor/jquery/jquery.dataTables.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>


<script type="text/javascript">
function Umainclass_change() {
    var mainclass = $("#umainClassificationName").val();

    $.ajax({
        type: "POST",
        url: "FetchSubClass.jsp",
        data: {mainclass: mainclass},
        cache: false,
        success: function (response)
        {
            $("#usubclass").html(response);
            //alert(mainclass);
        }
    });
    }
</script>
</html>
<%@ include file = "ini/footer.jsp" %>
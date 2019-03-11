<%@page import="java.util.ArrayList"%>
<%@page import="com.sgc.controller.SubClassificationController"%>
<%@page import="com.sgc.data.SubClassificationDAO"%>
<%@page import="com.sgc.model.SubClassification"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page import="com.sgc.data.MainClassificationDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.sgc.data.BooksDAO"%>
<%@page import="com.sgc.model.Books"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file = "ini/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div class="main">
            <div class="main-content">
                <div class="col-md-12">
                    <div id="result"></div>
                    <!-- BASIC TABLE -->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title"> Welcome, Manage Books</h3>
                        </div>
                        <div class="col-sm-5">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_new_book" >Add New</button>
                        </div>
                        <br><br>
                        <div id="table_content" class="panel-body"> 


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            List<MainClassification> mainclasses = MainClassificationDAO.viewMainClassification();
            request.setAttribute("mainclasses", mainclasses);
        %>
        <!-- Add new book --> 
        <div aria-hidden="true"  class="modal fade add_new_book" id="add_new_book" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content for Add Book  -->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add New Book</h4>
                    </div>
                    <div class="modal-body">

                        <form action="" enctype="multipart/form-data" id="book_form">

                            <div class="form-group">
                                <label>Book ID</label>
                                <input type="text" name="bookId" id="bookId" class="form-control" placeholder="Book ID"></input>
                            </div>

                            <div class="form-group">
                                <label>Book Name</label>
                                <input type="text" name="bookName" id="bookName" class="form-control" placeholder="Book Name"></input>
                            </div>

                            <div class="form-group">
                                <label>Book Description</label>
                                <input type="text" name="bookDescription" id="bookDescription" class="form-control" placeholder="Book Description"></input>
                            </div>


                            <div class="form-group">
                                <label>Main Classification</label>
                                <select name='mainClassificationName' id='mainClassificationName' onchange="mainclass_change()" class='form-control'>
                                    <option>  </option>

                                    <c:forEach items="${mainclasses}" var="mainclassification">         
                                        <option value='${mainclassification.mainClass}'> ${mainclassification.mainClass} </option>
                                    </c:forEach>  
                                </select>

                            </div>

                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select name='subClassificationName' id='subclass' class='form-control'> </select>
                            </div>

                            <div class="form-group">
                                <label>ISBN</label>
                                <input type="text" name="isbn" id="isbn" class="form-control" placeholder="ISBN"></input>
                            </div>
                            <div class="form-group">
                                <label>Author</label>
                                <input type="text" name="author" id="author" class="form-control" placeholder="Author"></input>
                            </div>

                            <div id="result"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="add_book" name="add_book">Add</button>
                            </div>
                        </form> 

                    </div>
                </div>
            </div>
        </div>

        

        <!-- Delete Books -->
        <c:forEach items="${books}" var="book">
            <div aria-hidden="true" class="modal fade delete_book" id="delete_book${book.bookId}" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Are you sure ?</h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="dbookId" value="${book.bookId}" hidden="true"/>
                            <p>Want to delete this book ${book.bookId}?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-danger" id="delete_book" data-id="${book.bookId}">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>     

        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="assets/vendor/jquery/jquery.dataTables.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>


        <script type="text/javascript">
    $(document).ready(function () {
    $('#add_book').click(function () {
        var bookId = $('#bookId').val();
        var bookName = $('#bookName').val();
        var bookDescription = $('#bookDescription').val();
        var mainClassificationName = $('#mainClassificationName').val();
        var subClassificationName = $('#subclass').val();
        var isbn = $('#isbn').val();
        var author = $('#author').val();

        // alert(brands);
        $.ajax({
            url: "AddBookController",
            type: "POST",
            data: {bookId: bookId, bookName: bookName, bookDescription: bookDescription, mainClassificationName: mainClassificationName, subClassificationName: subClassificationName, isbn: isbn, author: author},
            dataType: "JSON",
            success: function (res) {
                $('.add_new_book').modal('hide');
                //$('#ajaxGetUserServletResponse').text(res);
                //var book = $.parseJSON(res);
                //aleart(book.bookId);
            }
        });

        $('#book_form').trigger('reset');
    });

   
        $('#table_content').load('FetchBooks.jsp');

    });

    $(document).on('click', '#delete_book', function () {
    var id = $(this).data('id');
    // alert(ids);
    $.ajax({
        url: "AddBookController",
        type: "get",
        data: {id: id},
        success: function (data) {
            $('.delete_book').modal('hide');
        }
    });
    });

    function mainclass_change() {
    var mainclass = $("#mainClassificationName").val();

    $.ajax({
        type: "POST",
        url: "FetchSubClass.jsp",
        data: {mainclass: mainclass},
        cache: false,
        success: function (response)
        {
            $("#subclass").html(response);
            //alert(mainclass);
        }
    });
    }


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
    </body>
</html>

<%@ include file = "ini/footer.jsp" %>
<%@page import="com.sgc.data.MainClassificationDAO"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page import="com.sgc.data.SubClassificationDAO"%>
<%@page import="com.sgc.data.SubClassificationDAO"%>
<%@page import="com.sgc.model.SubClassification"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file = "ini/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/fontawesome/css/font-awesome.min.css">
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
                            <h3 class="panel-title">Welcome, Manage Sub Classification</h3>
                        </div>
                        <div class="col-sm-5">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_new_subclassification" >Add New</button>
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
        <!-- Add new Main Classification --> 
        <div aria-hidden="true"  class="modal fade add_new_subclassification" id="add_new_subclassification" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content for Add Main Classification  -->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add New Main Classification</h4>
                    </div>
                    <div class="modal-body">
                        <form action=""  enctype="multipart/form-data" id="subclassification_form">
                            <div class="form-group">
                                <label>Sub Classification</label>
                                <input type="text" name="subClassificationName" id="subClassificationName" class="form-control" placeholder="Sub Classification Name"></input>
                            </div>
                            <div class="form-group">
                                 <label>Main Classification</label>
                                <select name='mainClassificationName' id='mainClassificationName' class='form-control'>
                                    <option>  </option>

                                    <c:forEach items="${mainclasses}" var="mainclassification">         
                                        <option value='${mainclassification.mainClass}'> ${mainclassification.mainClass} </option>
                                    </c:forEach>  
                                </select>
                            </div>

                            <div id="result"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="add_subclassification" name="add_subclassification">Add</button>
                            </div>
                        </form> 

                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Main Classification  -->
        <%
            List<SubClassification> subclasses = SubClassificationDAO.viewSubClassification();
            request.setAttribute("subclasses", subclasses);
        %>

        <c:forEach items="${subclasses}" var="subclassification">
            <div class="modal fade" id="edit_SubClassification${subclassification.id}" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Main Classification</h4>
                        </div>
                        <div class="modal-body">

                            <form action="UpdateSubClassification" method="POST" id="form_subclassification">

                                <div class="form-group">
                                    <label> ID</label>
                                    <input type="text" name="uSubClassificationId" id="usubclassificationId" class="form-control" placeholder="Main Classification ID"  value="${subclassification.id}" readonly></input>
                                </div>

                                <div class="form-group">
                                    <label>Sub Classification Name</label>
                                    <input type="text" name="uSubClassificationName" id="usubclassificationName" class="form-control" placeholder="Main Classification Name" value="${subclassification.subClass}"></input>
                                </div>
                                <div class="form-group">
                                    <label>Main Classification Name</label>
                                    <select name='uMainClassificationName' id='mainclassificationName' class='form-control'>
                                        <option> ${subclassification.mainClass} </option>

                                        <c:forEach items="${mainclasses}" var="mainclassification">         
                                            <option value='${mainclassification.mainClass}'> ${mainclassification.mainClass} </option>
                                        </c:forEach>  
                                    </select>
                                </div>
                                <div id="result"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" id="edit_subclassification" name="edit_subclassification" value="Update"/>
                                </div>
                            </form> 

                        </div>

                    </div>

                </div>
            </div>
        </c:forEach>

        <!-- Delete Main Classifications -->
        <c:forEach items="${subclasses}" var="subclassification">
            <div aria-hidden="true" class="modal fade delete_subclassification" id="delete_SubClassification${subclassification.id}" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Are you sure ?</h4>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="dsubclassificationId" value="${subclassification.id}" hidden="true"/>
                            <p>Want to delete this Main Classification ${subclassification.id}?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-danger" id="delete_subclassification" data-id="${subclassification.id}">Delete</button>
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
                $('#add_subclassification').click(function () {
                    var subClassificationName = $('#subClassificationName').val();
                    var mainClassificationName = $('#mainClassificationName').val();
                    // alert(brands);
                    $.ajax({
                        url: "SubClassificationController",
                        type: "POST",
                        data: {subClassificationName: subClassificationName, mainClassificationName: mainClassificationName},
                        dataType: "JSON",
                        success: function (res) {
                            $('.add_new_subclassification').modal('hide');
                            //$('#ajaxGetUserServletResponse').text(res);
                            //var subclassification = $.parseJSON(res);
                            //aleart(subclassification.subclassificationId);
                        }
                    });

                    $('#subclassification_form').trigger('reset');
                });

                setInterval(function () {
                    $('#table_content').load('FetchSubClassification.jsp');
                }, 200);
            });

            $(document).on('click', '#delete_subclassification', function () {
                var id = $(this).data('id');
                // alert(ids);
                $.ajax({
                    url: "DeleteSubClassification",
                    type: "post",
                    data: {id: id},
                    success: function (data) {
                        $('.delete_subclassification').modal('hide');
                    }
                });
            });
        </script>
    </body>
</html>

<%@ include file = "ini/footer.jsp" %>
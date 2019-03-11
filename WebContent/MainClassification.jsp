<%@page import="com.sgc.data.MainClassificationDAO"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="ini/header.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="assets/vendor/chartist/css/chartist-custom.css">
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
						<h3 class="panel-title">Welcome, Manage Main Classification</h3>
					</div>
					<div class="col-sm-5">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#add_new_mainclassification">Add New</button>
					</div>
					<br> <br>
					<div id="table_content" class="panel-body"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add new Main Classification -->
	<div aria-hidden="true" class="modal fade add_new_mainclassification"
		id="add_new_mainclassification" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content for Add Main Classification  -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add New Main Classification</h4>
				</div>
				<div class="modal-body">

					<form action="" enctype="multipart/form-data"
						id="mainclassification_form">

						<div class="form-group">
							<label>Main Classification</label> <input type="text"
								name="mainClassificationName" id="mainClassificationName"
								class="form-control" placeholder="mainclassification Name"></input>
						</div>

						<div id="result"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								id="add_mainclassification" name="add_mainclassification">Add</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- Edit Main Classification  -->
	<%
		List<MainClassification> mainclasses = MainClassificationDAO.viewMainClassification();
		request.setAttribute("mainclasses", mainclasses);
	%>

	<c:forEach items="${mainclasses}" var="mainclassification">
		<div class="modal fade"
			id="edit_mainclassification${mainclassification.id}" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Main Classification</h4>
					</div>
					<div class="modal-body">

						<form action="UpdateMainClassification" method="POST"
							id="form_mainclassification">

							<div class="form-group">
								<label> ID</label> <input type="text"
									name="uMainClassificationId" id="uMainClassificationId"
									class="form-control" placeholder="Main Classification ID"
									readonly value="${mainclassification.id}"></input>
							</div>

							<div class="form-group">
								<label>Main Classification Name</label> <input type="text"
									name="uMainClassificationName" id="uMainClassificationName"
									class="form-control" placeholder="Main Classification Name"
									value="${mainclassification.mainClass}"></input>
							</div>

							<div id="result"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary"
									id="edit_mainclassification" name="edit_mainclassification"
									value="Update"> Update </button>
							</div>
						</form>

					</div>

				</div>

			</div>
		</div>
	</c:forEach>

	<!-- Delete Main Classifications -->
	<c:forEach items="${mainclasses}" var="mainclassification">
		<div aria-hidden="true" class="modal fade delete_mainclassification"
			id="delete_mainclassification${mainclassification.id}" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Are you sure ?</h4>
					</div>
					<div class="modal-body">
						<input type="text" id="dmainclassificationId"
							value="${mainclassification.id}" hidden="true" />
						<p>Want to delete this Main Classification
							${mainclassification.id}?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-danger"
							id="delete_mainclassification" data-id="${mainclassification.id}">Delete</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/vendor/jquery/jquery.dataTables.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>


	<script type="text/javascript">
	$(document).ready(function () {
        $('#add_mainclassification').click(function () {
            var mainClassificationName = $('#mainClassificationName').val();
            $.ajax({
                url: "MainClassificationController",
                type: "POST",
                data: {mainClassificationName: mainClassificationName},
                dataType: "JSON",
                success: function (res) {
                    $('.add_new_mainclassification').modal('hide');
                }
            });

            $('#mainclassification_form').trigger('reset');
        });

        setInterval(function () {
            $('#table_content').load('FetchMainClassification.jsp');
        }, 200);
    });

		$(document).on('click', '#delete_mainclassification', function() {
			var id = $(this).data('id');
			// alert(ids);
			$.ajax({
				url : "DeleteMainClassification",
				type : "post",
				data : {
					id : id
				},
				success : function(data) {
					$('.delete_mainclassification').modal('hide');
				}
			});
		});
	</script>
</body>
</html>

<%@ include file="ini/footer.jsp"%>
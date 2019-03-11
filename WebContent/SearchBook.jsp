<%@ include file = "ini/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<form>
     <div class="container">
     <div class="row">
     <div class="form-group">
     <div class="col-sm-2"> </div>
	     <div class="col-sm-3"> 
	     	 <select name='cOption' id='cOption' class='form-control'>
		        <option value='bookId'> Book ID </option>
			     <option value='bookName'> Book Name </option>
			     <option value='mainclass'> Main Classification </option>
			     <option value='subclass'> Sub Classification </option>
			     <option value='isbn'> ISBN </option>
			     <option value='author'> Author </option>
		     </select>
	     </div>
	     	<div class="col-sm-3">
	     		<input type="text" name="tSearch" id="tSearch"	class="form-control"/>
	     	</div>
			<div class="col-sm-3">
				<button type="button" name="submit" class="btn btn-default" id="sButton">Search</button>
			</div>
	 </div>
     </div>
     </div>
     
     <div id="table_content" class="panel-body"> </div>
    
     
</form>

</body>
<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/vendor/jquery/jquery.dataTables.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(document).on('click', '#sButton', function() {
	var cOption = $('#cOption').val();
	var tSearch = $('#tSearch').val();
	alert(cOption + "-" + tSearch);
	$.ajax({
		url : "FetchSearchBook.jsp",
		type : "get",
		data : {cOption : cOption, tSearch : tSearch },
		success : function(data) {	
			$('#table_content').load('FetchSearchBook.jsp');
		}
	});
	
});

</script>

</html>
<%@ include file = "ini/footer.jsp" %>
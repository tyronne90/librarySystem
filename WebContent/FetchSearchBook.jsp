<%@page import="java.util.List"%>
<%@page import="com.sgc.data.BooksDAO"%>
<%@page import="com.sgc.model.Books"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String cOption = request.getParameter("cOption");
		String tSearch = request.getParameter("tSearch");
		//String cOption = "bookId";
		//String tSearch = "B002";
		System.out.print(cOption);
		System.out.print(tSearch);
		List<Books> books = BooksDAO.viewOneBook(cOption, tSearch);
		request.setAttribute("books", books);
	%>


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
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${books}" var="book">
				<tr>
					<td>${book.bookId}</td>
					<td>${book.bookName}</td>
					<td>${book.bookDescription}</td>
					<td>${book.mainClass}</td>
					<td>${book.subClass}</td>
					<td>${book.isbn}</td>
					<td>${book.author}</td>
				</tr>
			</c:forEach>


		</tbody>
	</table>

</body>
</html>
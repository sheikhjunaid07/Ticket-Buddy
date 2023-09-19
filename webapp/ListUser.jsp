<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body>
	<a href="userRegistration.jsp"><button>Home</button></a>
	<table border="1" style="border-collapse: collapse;" cellpadding="5px">
		<tr>
			<th>User Id</th>
			<th>User Name</th>
			<th>User Address</th>
			<th>User Mobile</th>
			<th>User Email</th>
			<th>Action</th>
		</tr>

		<c:forEach items="${users}" var="user">
			<tr>
				<td><c:out value="${user.userId}" /></td>
				<td><c:out value="${user.userName}" /></td>
				<td><c:out value="${user.userAddress}" /></td>
				<td><c:out value="${user.userMobile}" /></td>
				<td><c:out value="${user.userEmail}" /></td>
				<td><a href="/TicketBuddy/editUser?userId=${user.userId}">Edit</a>
					| <a href="/TicketBuddy/deleteUser?userId=${user.userId}">Delete</a></td>
			</tr>
		</c:forEach>


	</table>


</body>
</html>
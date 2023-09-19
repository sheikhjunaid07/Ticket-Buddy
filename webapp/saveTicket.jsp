<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if (request.getSession().getAttribute("userId") == null) {
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
<title>Save Ticket</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<form action="/TicketBuddy/saveTicket" method="POST"
		enctype="multipart/form-data">
		Browse file here: <input type="file" name="ticketImage"><br>
		<select name="ticketType">
			<option>Match</option>
			<option>Concert</option>
			<option>Movie</option>
		</select><br> <input type="date" name="ticketExpiry"><br>
		<textarea name="ticketDescription"></textarea>
		<br> <input type="submit" value="Save">
	</form>
</body>
</html>
<!doctype html>
<%@page import="com.ccavenue.model.StudentRegistration"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Response Page</title>


</head>


<%
StudentRegistration p = (StudentRegistration) request.getAttribute("student");
%>

<body>
	<h4>Response Details:</h4>
	<table border="1">
		<tr>
			<th>Parameter Name</th>
			<th>Parameter Value</th>
		</tr>
		<tr>
			<th><%=p.getStuId() %></th>
			<th><%=p.getMobileNo() %></th>
		</tr>
		<tr>
			<th><%=p.getStuName() %></th>
			<th><%=p.getStuEmail() %></th>
		</tr>
		<tr>
			<th><%=p.getStuCity() %></th>
			<th><%=p.getTestAmount() %></th>
		</tr>
		<tr>
			<th><%=p.getEncTestCode() %></th>
			<th><%=p.getStatus() %></th>
		</tr>
		<tr>
			<th colspan="2"><%=p.getResponseLog() %></th>
		</tr>

	</table>
</body>
</html>
<%@page import="com.ccavenue.model.StudentRegistration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order_Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<%
StudentRegistration stu = (StudentRegistration) request.getAttribute("stu");
String encRequest = (String) request.getAttribute("encRequest");
String accessCode = (String) request.getAttribute("accessCode");

/* String defaultPath = application.getRealPath("/"); */
%>
<body>
	<%-- <%=defaultPath %> --%>
	<!-- <h2>
		Proceed to payment
		<button type="button" onclick="document.redirectForm.submit();">Submit</button>
	</h2> -->
	<div class="container">
		<div class="row m-5">
			<div class="col-12">
				<!-- <form action="https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction" -->
				<form
					action="https://secure.ccavenue.com/transaction.do?command=initiateTransaction"
					class="horizontol-form" method="POST" name="redirectForm"
					id="redirectForm">
					<input type="hidden" id="encRequest" name="encRequest"
						value="<%=encRequest%>"> <input type="hidden"
						name="access_code" id="access_code" value="<%=accessCode%>">
					<script>
						document.redirectForm.submit();
					</script>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
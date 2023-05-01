<!doctype html>
<%@page import="com.ccavenue.model.TestMock"%>
<%@page import="com.ccavenue.model.StudentRegistration"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css"> --%>
</head>
<%
TestMock testMock = (TestMock) request.getAttribute("testMock");
StudentRegistration studentRegistration = (StudentRegistration) request.getAttribute("student");
if (studentRegistration == null) {
	studentRegistration = new StudentRegistration();
}
String studentStatus = studentRegistration.getStatus();
%>
<body>
<body style="background: rgb(14, 21, 73); color: white;">
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col">
			<p style="font-size:35px;"><b>ExamFactor</b></p>
		</div>
		<div class="col-2"></div>
	</div>

	<div class="row">
		<div class="col">
		
			<div class="row mt-5">
					<div class="col"></div>
					<div class="col-5">
	
		<% if ("Success".equals(studentStatus)) { %>
<script type="text/javascript">
setInterval(() => {
	window.location.href="<%=testMock.getMockLink() %>";
}, 5000);

</script>		
		<div class="bg-success text-center p-5">
			<p>We are pleased to inform you that your recent transaction was
				successful and the payment has been processed.</p> 
			<p>Thank you for choosing us and for entrusting us with your CUET preparation.
			<br />You will be redirected to the test in 5 seconds. If you are not redirected,please click on below to go the test.</p>
			<p>All the best.</p>
		</div>
		<div class="mt-5 text-center">
			<a href="<%=testMock.getMockLink() %>" class="btn btn-success">Take Test</a>
		</div>
		<%} else {%>
		<h2 class="mb-5">Uh Oh! Sorry</h2>
		<div class="bg-success text-center p-5">
			<p>We regret to inform you that there was a payment failure while processing your recent transaction. 
			<br />Please try again using an alternate payment method.</p>
			<p>We apologize for any inconvenience this may have caused and appreciate your understanding in this matter.</p>
		</div>
		<div class="mt-5 text-center">
			<a href="${pageContext.request.contextPath}/student-registration/<%=studentRegistration.getEncTestCode()%>" class="btn btn-success">Try Again</a>
		</div>
		<%}%>
		</div>
		
				<div class="col"></div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
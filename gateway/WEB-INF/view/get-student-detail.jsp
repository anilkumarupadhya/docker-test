<!doctype html>
<%@page import="com.ccavenue.model.TestMock"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	
	

	
</head>

<%
TestMock testMock = (TestMock) request.getAttribute("testMock");
if (testMock == null) {
	testMock = new TestMock();
}

%>
<body>
	<div id="login-box">
	<h1>Student Registration Form</h1>
		<div class="left">
			<form action="student-register" id="myForm" class="horizontol-form" method="POST">

				<input type="hidden" name="encTestCode" value="<%=testMock.getEncTestCode()%>" />
				
				
				
				<input type="hidden" name="testId" 	value="<%=testMock.getTestId()%>" /> 
				    <input type="text" 
					id="stuName" name="stuName" value=""  
					placeholder="Enter Student Name" maxlength="50"  autocomplete="off"  required > 
					<span id="name-error"></span>
					<input
					type="number" id="mobileNo" name="mobileNo"
					placeholder="Enter Mobile Number" maxlength="10" autocomplete="off" required>
					<span id="mobile-error"></span> 
					<input
					type="text" name="stuEmail" id="stuEmail"
					placeholder="Enter Email Id" maxlength="40" autocomplete="off" required> 
					<span id="email-error"></span> 
					<input
					type="text" name="stuCity" id="stuCity"
					placeholder="Enter Student City" maxlength="100" autocomplete="off" required> 
					<input
					type="number" name="testAmount" id="testAmount"
					placeholder="Enter Payable Amount" autocomplete="off" required>
				<button id="btn1" type="submit">Register and Proceed for
					Payment</button>

			</form>
		</div>

		<div class="right">
			<img src="${pageContext.request.contextPath}/images/student.jpeg"
				alt="Background image">
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	

	
	</script>
</body>
</html>
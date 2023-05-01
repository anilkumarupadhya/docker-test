<%@page import="com.ccavenue.model.TestMock"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function validateForm() {
		var IndNum = /^[0]?[789]\d{9}$/;
		var re = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
		if(document.myForm.mobileNo.value != "" && !IndNum.test(document.myForm.mobileNo.value)) {
			alert("Please enter valid mobile number");
			document.myForm.mobileNo.focus();
			return false;
		} else if(document.myForm.stuEmail.value != "" && !re.test(document.myForm.stuEmail.value)) {
			alert("Please enter valid email id");
			document.myForm.stuEmail.focus();
			return false;
		}
	}
</script>

</head>
<%
TestMock testMock = (TestMock) request.getAttribute("testMock");
if (testMock == null) {
	testMock = new TestMock();
}

int testId = testMock.getTestId();
%>
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
				<!-- <h1>Student Registration Form</h1> -->
				<div class="row">
					<div class="col"></div>
					<div class="col-5">
					<div class="alert bg-success" role="alert"><p>3000+ learners trust Exam Factor for CUET Preparation</p></div>
						<%if (testId == 0) {%>
						<p style="color: red;">You cannot proceed for this test.</p>
						<%} else {%>
						<p>Test Title: <%=testMock.getMockName() %></p>
						<%}%>

						<form action="${pageContext.request.contextPath}/student-register" id="myForm" name="myForm"
							class="horizontol-form" method="POST" onsubmit="return validateForm()">
							<input type="hidden" name="encTestCode"
								value="<%=testMock.getEncTestCode()%>" /> 
							<input type="hidden"
								name="testId" value="<%=testMock.getTestId()%>" />
							<input type="hidden" name="testAmount" id="testAmount" value="<%=testMock.getMockPrice()%>">
							<div class="mb-3">
								<input type="text" id="stuName" name="stuName" value=""
									placeholder="Enter Student Name" maxlength="50"
									autocomplete="off" class="form-control" required> <span
									id="name-error"></span>
							</div>
							<div class="mb-3">
								<input type="text" id="mobileNo" name="mobileNo"
									placeholder="Enter Mobile Number" maxlength="10"
									autocomplete="off" class="form-control" required> <span
									id="mobile-error"></span>
							</div>
							<div class="mb-3">
								<input type="text" name="stuEmail" id="stuEmail"
									placeholder="Enter Email Id" maxlength="40" autocomplete="off"
									class="form-control" required> <span id="email-error"></span>
							</div>
							<div class="mb-3">
								<input type="text" name="stuCity" id="stuCity"
									placeholder="Enter Student City" maxlength="100"
									autocomplete="off" class="form-control" required>
							</div>
							<div class="mb-3 d-grid">
						<% if (testId == 0) {%>
						<button class="btn btn-primary" type="submit" disabled="disabled">PAY NOW</button>
						<% } else { %>
						<button class="btn btn-primary" type="submit">PAY &#8377;<%=testMock.getMockPrice()%> NOW</button>
						<%}%>
							</div>
						</form>
					</div>
					<div class="col"></div>
				</div>
				<div class="text-center" style="margin-top: 60px">
						<p>After Clicking on Pay Now,you will be redirected to final
					payment page to complete the payment</p>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>
</body>
</html>
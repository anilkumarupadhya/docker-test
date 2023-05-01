<%@page import="java.util.List"%>
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
<%
List<StudentRegistration> stuList = (List<StudentRegistration>) request.getAttribute("stuList");
String orderStatus = (String) request.getAttribute("orderStatus");
%>
<script type="text/javascript">
function orderReload(val) {
	document.orderForm.action = "${pageContext.request.contextPath}/get-payment-detail/"+val;
	document.orderForm.submit();
	//alert("Hello");
}
document.orderForm.orderStatus.value = "<%=orderStatus%>";
</script>
</head>

<body>
	<div class="container-fluid">
		
		<div class="row mt-2">
			<div class="col-3"><img src="${pageContext.request.contextPath}/images/ef-logo.png" style="width:45%" class="img-fluid" alt="ExamFactor"></div>
			<div class="col-6 pt-5">
				<div class="text-center">
				<form action="${pageContext.request.contextPath}/get-payment-detail/all" name="orderForm" id="orderForm">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="orderStatus" id="orderStatus1" value="all" onclick="orderReload('all')" <%=("all".equals(orderStatus)?"checked":"") %>>
				  <label class="form-check-label" for="orderStatus1">ALL</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="orderStatus" id="orderStatus2" value="Success" onclick="orderReload('Success')" <%=("Success".equals(orderStatus)?"checked":"") %>>
				  <label class="form-check-label" for="orderStatus2">Success</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="orderStatus" id="orderStatus3" value="Failure" onclick="orderReload('Failure')" <%=("Failure".equals(orderStatus)?"checked":"") %>>
				  <label class="form-check-label" for="orderStatus3">Failure</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="orderStatus" id="orderStatus4" value="Aborted" onclick="orderReload('Aborted')" <%=("Aborted".equals(orderStatus)?"checked":"") %>>
				  <label class="form-check-label" for="orderStatus4">Aborted</label>
				</div>
				</form>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-3">
			<div class="col-12">
			<div class="card">
  				<div class="card-header">Payment order details</div>
  				<div class="table-responsive">
  				<table class="table mb-0">
				  <thead>
				    <tr>
				      <th>#</th>
				      <th>Order Id</th>
				      <th>Student Name</th>
				      <th>Mobile No.</th>
				      <th>Student email</th>
				      <th>City</th>
				      <th>Test id</th>
				      <th>Order Status</th>
				      <th>Amount</th>
				      <th>Record date</th>
				    </tr>
				  </thead>
				  <tbody>
				
<% 
	int orderCnt = 0;
	int sumAmount = 0;
	for(StudentRegistration stu:stuList) {
		orderCnt++;
		sumAmount += stu.getTestAmount();
%>
	<tr>
		<td><input type="hidden" value="<%=stu.getResponseLog() %>"><%=orderCnt %></td>
		<td><%=stu.getStuId() %></td>
		<td><%=stu.getStuName() %></td>
		<td><%=stu.getMobileNo() %></td>
		<td><%=stu.getStuEmail() %></td>
		<td><%=stu.getStuCity() %></td>
		<td><%=stu.getTestId() %></td>
		<td><%=stu.getStatus() %></td>
		<td><%=stu.getTestAmount() %></td>
		<td><%=stu.getRecordDate() %></td>
	</tr>
<%		
	} if(orderCnt == 0) {
		%>
		<tr>
			<td colspan="10" class="text-center">No record Found</td>
		</tr>
	<%			
	} else {
	%>
		<tr>
			<td colspan="8" class="text-center"><b>Total Amount</b></td>
			<td><b><%=sumAmount %></b></td>
			<td>&nbsp;</td>
		</tr>
	<%		
	}
%>				
			</tbody>
			</table>
			</div>
			</div>
			</div>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<div class="text-center">
				<p>Copyright &#169; 2023. All rights reserved.  </p>
			</div>
		</div>
	</div>
</body>
</html>
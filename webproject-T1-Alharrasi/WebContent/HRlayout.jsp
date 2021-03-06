<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Page level plugin JavaScript-->
<script
	src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>

<script
	src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>


<script
	src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
<script
	src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>

<script type="text/javascript" src="HRApp.js"></script>

<style type="text/css">
</style>

<title>Insert title here</title>
</head>
<body>
	${wronginput}

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.html");
		}

		if (session.getAttribute("hr") == null && session.getAttribute("username") != null) {
			response.sendRedirect("layout.jsp");
		}
	%>


	<div class="container">
		<h2>HR layout</h2>
		<br><br>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">Settings</a></li>
			<li><a data-toggle="tab" href="#menu2">Add Employee</a></li>
			<li><a data-toggle="tab" href="#menu3">Show Employees Table</a></li>
			<li><a data-toggle="tab" href="#menu4">Punch Hours</a></li>

			<li>
				<form action="Logout">
					<button type="submit">Logout</button>
				</form>
			</li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>
				<p>Welcome back ${user}.</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Change Password</h3>

				<div class="container">
					
					<form action="ChangePass" method="post">
						
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="pass"
								placeholder="Password">
						</div>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="confirm"
								placeholder="Confirm Password">
						</div>
						<br>
						<div class="input-group">
							<input type="submit" value="Change Password">
						</div>
					</form>
				</div>

			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>Add Employee</h3>
				<form class="form-horizontal" action="AddEmployee" method="post">



					<div class="form-group">
						<label for="Fname">First Name : </label> <input type="text"
							class="form-control" name="FIRST_NAME"> <br> <label
							for="Lname">Last Name : </label> <input type="text"
							class="form-control" name="LAST_NAME"> <br> <label
							for="JobRole">Job Role : </label> <input type="text"
							class="form-control" name="POSITION"> <br> <label
							for="Age">Age : </label> <input type="text" class="form-control"
							name="AGE"> <br> <label for="Date">Start
							date : </label> <input type="date" class="form-control" name="DATE">
						<br> <label for="Phone">Phone : </label> <input type="text"
							class="form-control" name="PHONE"> <br> <label
							for="email">Email : </label> <input type="email"
							class="form-control" name="EMAIL"> <br> <label
							for="pass">Password : </label> <input type="text"
							class="form-control" name="PASSWORD"> <br> <label
							for="salary">Salary : </label> <input type="text"
							class="form-control" name="SALARY"> <br>

						<button type="submit">Add Employee</button>
					</div>
				</form>
			</div>
			<div id="menu3" class="tab-pane fade">
				<h3>Employees Table</h3>
				<p>Double click to remove an employee.</p>

				<script>
					fetchEmployees();
				</script>






				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Edit Employee</h4>
							</div>
							<div class="modal-body">
								<div id="add_to_me"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>


				<table id="myTable"
					class="table table-striped table-bordered table-sm" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th class="th-sm">Name</th>
							<th class="th-sm">Position</th>
							<th class="th-sm">Phone</th>
							<th class="th-sm">Email</th>
							<th class="th-sm">Age</th>
							<th class="th-sm">Start date</th>
							<th class="th-sm">Salary</th>
							<th class="th-sm"></th>

						</tr>
				</table>


			</div>
			
			
			
			<div id="menu4" class="tab-pane fade">
				<br>
				<a class="btn btn-warning btn-rounded btn-sm my-0" href="/webproject-T1-Alharrasi/Attend"> Punch Hour </a>

			</div>
			
			
		</div>
	</div>
</body>
</html>
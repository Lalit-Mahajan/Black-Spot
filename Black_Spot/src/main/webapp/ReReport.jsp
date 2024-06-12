<%@page import="java.sql.*"%>
<%@page import="com.root.dbConnect.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DarkPan - Bootstrap 5 Admin Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="index.html" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-user-edit me-2"></i>View
					</h3>
				</a>

				<div class="navbar-nav w-100">
					<a href="BlackSpot.html" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a> <a
						href="ReReport.jsp" class="nav-item nav-link active"><i
						class="fa fa-table me-2"></i>View Reason Report</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="ZReport.jsp" class="dropdown-item">Yellow</a> <a
								href="ZReport.jsp" class="dropdown-item">Orange</a> <a
								href="ZReport.jsp" class="dropdown-item">Red</a>
						</div>
						<center>
							<a href="BlackSpot.html">Back</a>
						</center>

					</div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
				<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-user-edit"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>

				<div class="navbar-nav align-items-center ms-auto"></div>
			</nav>
			<!-- Navbar End -->


			<!-- Table Start -->
			<div class="col-12">
				<div class="bg-secondary rounded h-100 p-4">
					<h6 class="mb-4">Criminal Report Table</h6>
					<div class="table-responsive">
						<table class="table">

							<tr>
								<th scope="col">ID</th>
								<th scope="col">Location Name</th>
								<th scope="col">Address</th>
								<th scope="col">Reason</th>
								<th scope="col">Latitude</th>
								<th scope="col">Longitude</th>
								<th scope="col">Level</th>
								<th scope="col">Zone</th>
								<th scope="col">City</th>
							</tr>


							</div>
							</div>
							</div>


							<%
							try {
								//String city= UserData.getCity();
								//String rsn=request.getParameter("zone");	 
								Connection con = ConnectDB.getConnect();
								PreparedStatement ps = con.prepareStatement("select * from addspot where reason='Criminal' ");
								// ps.setString(1, rsn);
								ResultSet rs = ps.executeQuery();
								while (rs.next()) {
							%>

							<tr>
								<td><%=rs.getInt(1)%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getString(5)%></td>
								<td><%=rs.getString(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=rs.getString(8)%></td>
								<td><%=rs.getString(9)%></td>
							</tr>




							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</table>
						<div class="col-12">
							<div class="bg-secondary rounded h-100 p-4">
								<h6 class="mb-4">Danger Report Table</h6>
								<div class="table-responsive">
									<table class="table">

										<tr>
											<th scope="col">ID</th>
											<th scope="col">Location Name</th>
											<th scope="col">Address</th>
											<th scope="col">Reason</th>
											<th scope="col">Latitude</th>
											<th scope="col">Longitude</th>
											<th scope="col">Level</th>
											<th scope="col">Zone</th>
											<th scope="col">City</th>

										</tr>


										</div>
										</div>
										</div>


										<%
										try {
											//String city= UserData.getCity();
											//String rsn=request.getParameter("zone");	 
											Connection con = ConnectDB.getConnect();
											PreparedStatement ps = con.prepareStatement("select * from addspot where reason='Danger' ");
											// ps.setString(1, rsn);
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
										%>

										<tr>
											<td><%=rs.getInt(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td><%=rs.getString(5)%></td>
											<td><%=rs.getString(6)%></td>
											<td><%=rs.getString(7)%></td>
											<td><%=rs.getString(8)%></td>
											<td><%=rs.getString(9)%></td>
										</tr>




										<%
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</table>

									<div class="col-12">
										<div class="bg-secondary rounded h-100 p-4">
											<h6 class="mb-4">Accident Report Table</h6>
											<div class="table-responsive">
												<table class="table">

													<tr>
														<th scope="col">ID</th>
														<th scope="col">Location Name</th>
														<th scope="col">Address</th>
														<th scope="col">Reason</th>
														<th scope="col">Latitude</th>
														<th scope="col">Longitude</th>
														<th scope="col">Level</th>
														<th scope="col">Zone</th>
														<th scope="col">City</th>
													</tr>


													</div>
													</div>
													</div>


													<%
													try {
														//String city= UserData.getCity();
														//String rsn=request.getParameter("zone");	 
														Connection con = ConnectDB.getConnect();
														PreparedStatement ps = con.prepareStatement("select * from addspot where reason='Accident' ");
														// ps.setString(1, rsn);
														ResultSet rs = ps.executeQuery();
														while (rs.next()) {
													%>

													<tr>
														<td><%=rs.getInt(1)%></td>
														<td><%=rs.getString(2)%></td>
														<td><%=rs.getString(3)%></td>
														<td><%=rs.getString(4)%></td>
														<td><%=rs.getString(5)%></td>
														<td><%=rs.getString(6)%></td>
														<td><%=rs.getString(7)%></td>
														<td><%=rs.getString(8)%></td>
														<td><%=rs.getString(9)%></td>
													</tr>




													<%
													}
													} catch (Exception e) {
													e.printStackTrace();
													}
													%>
												</table>


											</div>
										</div>



										<!-- Table End -->


										<!-- Footer Start -->

										<!-- Footer End -->
									</div>
									<!-- Content End -->


									<!-- Back to Top -->
									<a href="#"
										class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
										class="bi bi-arrow-up"></i></a>
								</div>

								<!-- JavaScript Libraries -->
								<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
								<script src="lib/chart/chart.min.js"></script>
								<script src="lib/easing/easing.min.js"></script>
								<script src="lib/waypoints/waypoints.min.js"></script>
								<script src="lib/owlcarousel/owl.carousel.min.js"></script>
								<script src="lib/tempusdominus/js/moment.min.js"></script>
								<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
								<script
									src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

								<!-- Template Javascript -->
								<script src="js/main.js"></script>
</body>

</html>


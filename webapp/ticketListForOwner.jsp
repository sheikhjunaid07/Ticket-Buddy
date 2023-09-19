<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(request.getSession().getAttribute("userId") == null){
	response.sendRedirect("index.jsp");
}
%>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ticket List</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/sell form.css">
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

.container{
	padding-bottom: 20px;
}

/* Style the counter cards */
.card { 
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2) !important
  padding: 10px !important
  text-align: center !important
  background-color: #f1f1f1 !important
  margin-top: 10px !important
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
img {
  border-radius: 5px 5px 0 0;
  height: 100px;
}
</style>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle waves-effect waves-dark"
					data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i
					class="large material-icons"></i><strong>Ticket Buddy</strong></a>

				<div id="sideNav" href="">
					<i class="material-icons dp48">toc</i>
				</div>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<li><a class=" waves-effect waves-dark" data-toggle="modal"
					data-target="#myModal"><b>Post New Tickets</b></a></li>
				<li><a class=" waves-effect waves-dark"
					href="/TicketBuddy/ticketListByUserId"><b>My Tickets</b></a></li>
				<li><a class="dropdown-button waves-effect waves-dark"
					href="#!" data-activates="dropdown1"><i
						class="fa fa-user fa-fw"></i> <b><c:out
								value="${sessionScope.user.userName}"></c:out></b> <i
						class="material-icons right">arrow_drop_down</i></a></li>
			</ul>
		</nav>
		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
			</li>
			<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
			<li><a href="/TicketBuddy/logout"><i
					class="fa fa-sign-out fa-fw"></i> Logout</a></li>
		</ul>

		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a class="active-menu waves-effect waves-dark"
						href="index.html"><i class="fa fa-dashboard"></i> Dashboard</a></li>
					<li><a class=" waves-effect waves-dark" href=""><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="#" class="waves-effect waves-dark"><i
							class="fa fa-sitemap"></i>Category<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">Night Club</a></li>
							<li><a href="#">Match</a></li>
							<li><a href="#">Event</a></li>
							<li><a href="#">Concert</a></li>
						</ul></li>
					<li><a href="form.html"><i class="fa fa-sign-in"></i>Login</a>
					</li>
					<li><a href="aboutUs.jsp" class="waves-effect waves-dark"><i
							class="fa fa-info"></i>About Us </a></li>
					<li><a href="contactUs.jsp" class="waves-effect waves-dark"><i
							class="fa fa-phone"></i>Contact Us</a></li>

				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE-->

		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">Dashboard</h1>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Dashboard</a></li>
					<li class="active">Data</li>
				</ol>

			</div>
			<div id="page-inner">
					<div class="row">
						<c:forEach items="${tickets}" var="ticket">
							<div class="column">
							<div>
								<div class="card">
									<a href="${ticket.filePath}"><img src="${ticket.filePath}" alt="Image could not loaded"
										style="width: 100%"></a>
									<div class="container">
										<h4>
											<b>${ticket.ticketType}</b>
										</h4>
										<p>${ticket.ticketExpiry}</p>
										<div style="max-width: 200px;">
										<p>${ticket.ticketDiscription}</p>
										</div>
										<c:if test="${ticket.ticketStatus==1 }">
											<button class="btn btn-success" disabled="disabled">Sold</button>
										</c:if>
										<c:if test="${ticket.ticketStatus==0 }">
											<a href="/TicketBuddy/updateTicket?ticketId=${ticket.ticketId}">
												<button class="btn btn-warning">Sell</button>
											</a>
										</c:if>
										<a href="/TicketBuddy/deleteTicket?ticketId=${ticket.ticketId}">
										<button class="btn btn-danger">Delete</button></a><br>
									</div>
								</div>
								</div>
							</div>


						</c:forEach>
					</div>
			</div>
		</div>

		<footer> </footer>
	</div>

	<!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>

    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>

    <script src="assets/materialize/js/materialize.min.js"></script>

    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>


    <script src="assets/js/easypiechart.js"></script>
    <script src="assets/js/easypiechart-data.js"></script>

    <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>

        <!--sell form-->
        <!-- Trigger the modal with a button -->
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <h3 class="col-lg-offset-5">Fill Ticket Details</h3>
            <div class="modal-body">
                <div class="tab-content">
                    <div id="myForm">
                        <form action="/TicketBuddy/saveTicket" method="POST" enctype = "multipart/form-data">
                            <div class="top-row">
                                <div class="field-wrap">
                                <label>Choose Ticket Image</label><br>
                                    <input type="file" name="ticketImage" required autocomplete="off" /><br>
                                </div>
                                <div class="field-wrap">
                                <label>Ticket Expiry Date</label><br>
                                    <input type="date" name="ticketExpiry" required autocomplete="off" />
                                </div>
                            </div>
                            <div class="field-wrap">
                                <div class="input-field col s12">
                                    <textarea id="textarea1" name="ticketDescription" class="materialize-textarea"></textarea>
                                    <label for="textarea1">Ticket Description</label>
                                </div>
                            </div>
                            <div class="field-wrap">
									<input type="radio" name="ticketType" id="exampleRadios1" value="Match"> 
									<label for="exampleRadios1">Match</label>
									<input type="radio" name="ticketType" id="exampleRadios2" value="Concert">
									<label for="exampleRadios2">Concert</label>
									<input type="radio" name="ticketType" id="exampleRadios3" value="Night Club"> 
									<label for="exampleRadios3">Night Club</label>
							</div>
							<div class="field-wrap">
                            	<button type="submit" class="button button-block">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>


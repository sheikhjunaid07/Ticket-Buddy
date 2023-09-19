<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login/Register</title>

<link rel="stylesheet" href="assets/css/form.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand waves-effect waves-dark" href="index.jsp">
					<strong>Ticket Buddy</strong>
				</a>

				<div id="sideNav" href="">
					<i class="material-icons dp48">toc</i>
				</div>
			</div>

			<ul class="nav navbar-top-links navbar-right">
                <li><a class=" waves-effect waves-dark" href="/TicketBuddy/loginRegistrationForm?action=login"><b><i class="fa fa-sign-in"></i> Login</b></a></li>
                <li><a class=" waves-effect waves-dark" href="/TicketBuddy/loginRegistrationForm?action=register"><b>Register</b></a></li>
			</ul>
		</nav>
		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
			</li>
			<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
			<li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
			</li>
		</ul>
		<!--/. NAV TOP  -->
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

		
					<li><a class=" waves-effect waves-dark" href="index.jsp"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="#" class="waves-effect waves-dark"><i
							class="fa fa-sitemap"></i>Category<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
                        <li>
                            <a href="/TicketBuddy/ticketListByTicketType?ticketType=Night Club">Night Club</a>
                        </li>
                        <li>
                            <a href="/TicketBuddy/ticketListByTicketType?ticketType=Match">Match</a>
                        </li>
                        <li>
                            <a href="/TicketBuddy/ticketListByTicketType?ticketType=Event">Event</a>
                        </li>
                        <li>
                            <a href="/TicketBuddy/ticketListByTicketType?ticketType=Concert">Concert</a>
                        </li>
                       
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
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header">Login</h1>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Data</li>
				</ol>

			</div>

			<div id="page-inner">
				<!--Form -->
				<div class="form">
					<ul class="tab-group">
						<li class="${login}"><a href="#login">Log In</a></li>
						<li class="${register}"><a href="#signup">Sign Up</a></li>
					</ul>
					<div class="tab-content">
						<div id="login">
							<form id="myForm" action="/TicketBuddy/login" method="POST">

								<div class="field-wrap">
									<label> Email Address<span class="req">*</span>
									</label> <input type="email" name="email" required autocomplete="off" />
								</div>

								<div class="field-wrap">
									<label> Password<span class="req">*</span>
									</label> <input type="password" name="password" required
										autocomplete="off" />
								</div>
								<div><b><c:out value="${errMsg}"></c:out></b></div>
								<p class="forgot">
									<a href="#">Forgot Password?</a>
								</p>

								<button type="submit" class="button button-block">
								Log In
								</button>

							</form>

						</div>
						<div id="signup">
							<form id="myForm" action="/TicketBuddy/saveUser" method="POST">
								<div class="field-wrap">
									<label> Name<span class="req">*</span>
									</label> <input type="text" name="name" value="${user.userName}" required autocomplete="off" />
								</div>
								<div class="field-wrap">
									<label> Mobile<span class="req">*</span>
									</label> <input type="tel" name="mobile" value="${user.userMobile}" pattern="[0-9]{10}" maxlength="10"
										title="Mobile number must be digits only" required
										autocomplete="off" />
								</div>
								<div class="field-wrap">
									<label> Email Address<span class="req">*</span>
									</label> <input type="email" name="email" value="${user.userEmail}" required autocomplete="off" />
								</div>

								<div class="field-wrap">
									<label> Set A Password<span class="req">*</span>
									</label> <input type="password" name="password" value="${user.password}" required autocomplete="off" />
								</div>
								<div class="field-wrap">
									<label> Address<span class="req">*</span>
									</label> <input type="text" name="address" value="${user.userAddress}" required autocomplete="off" />
								</div>
								<div><b><c:out value="${duplicateUserErrMsg}"></c:out></b></div><br>
								<button type="submit" class="button button-block">Get
									Started</button>

							</form>

						</div>
					</div>
					<!-- tab-content -->

				</div>
				<!-- /form -->

			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->



	<!-- JS Scripts-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- jQuery Js -->
	<script src="assets/js/form.js"></script>
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
	<!--  -->
</body>

</html>
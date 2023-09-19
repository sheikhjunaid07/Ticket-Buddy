<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Index</title>
    <link rel="stylesheet" type="text/css" href="assets/css/sell form.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
    <link rel="stylesheet" href="assets/css/index.css">
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
.row {
	margin: 0 -5px;
}

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

.container {
	padding-bottom: 20px;
}

/* Style the counter cards */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2) !important padding: 10px
		!important text-align: center !important background-color: #f1f1f1
		!important margin-top: 10px !important
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

img {
	border-radius: 5px 5px 0 0;
	height: 100px;
}

h1 {
	display: block;
	padding-top: 10px;
	margin-top: 10px;
	font-weight: bold;
	text-align: center;
}
</style>
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="index.html"><i class="large material-icons"></i> <strong>Ticket Buddy</strong></a>
                <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li><a class=" waves-effect waves-dark" href="/TicketBuddy/loginRegistrationForm?action=login"><b><i class="fa fa-sign-in"></i> Login</b></a></li>
                <li><a class=" waves-effect waves-dark" href="/TicketBuddy/loginRegistrationForm?action=register"><b>Register</b></a></li>
            </ul>
        </nav>
    </div>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
        </li>
        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
        </li>
        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
        </li>
    </ul>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a class="active-menu waves-effect waves-dark" href="index.jsp"><i class="fa fa-home"></i>Home</a>
                </li>
                <li>
                    <a class=" waves-effect waves-dark" href="dashboard.html"><i class="fa fa-dashboard"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i>Category<span class="fa arrow"></span></a>
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
                        <li>
                            <a href="/TicketBuddy/ticketListByTicketType?ticketType=Movie">Movie</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/TicketBuddy/loginRegistrationForm?action=login"><i class="fa fa-sign-in"></i>Login</a>
                </li>
                <li>
                    <a href="aboutUs.jsp" class="waves-effect waves-dark"><i class="fa fa-info"></i>About Us </a>
                </li>
                <li>
                    <a href="contactUs.jsp" class="waves-effect waves-dark"><i class="fa fa-phone"></i>Contact Us</a>
                </li>

            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE-->
    <div id="page-wrapper">
    <h1>Tickets available for ${ticketType}</h1>
        <div id="page-inner">
			
			<div class="row">
						<c:forEach items="${tickets}" var="ticket">
							<div class="column">
							<div>
								<div class="card">
									<a href="${ticket.ticket.filePath}"><img src="${ticket.ticket.filePath}" alt="Image could not loaded"
										style="width: 100%"></a>
									<div class="container">
										<h4>
											<b>${ticket.ticket.ticketType}</b>
										</h4>
										<p><b>Ticket Expiry:</b> ${ticket.ticket.ticketExpiry}</p>
										<p><b>Seller Name:</b> ${ticket.userName }</p>
										<p><b>Seller Mobile:</b> ${ticket.userMobile }</p>
										<div style="display:table;float: left;width: 45%;max-width: 200px;">
											<p><b>Ticket Description:</b> ${ticket.ticket.ticketDiscription}</p>
										</div>
									</div>
								</div>
								</div>
							</div>

						</c:forEach>
					</div>
			
            <footer>
            </footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <script src="assets/js/index.js"></script>
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
</body>

</html>
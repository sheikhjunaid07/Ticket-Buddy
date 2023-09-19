<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Index</title>
    <link rel="stylesheet" type="text/css" href="assets/css/` form.css">
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
                <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons"></i> <strong>Ticket Buddy</strong></a>
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
        <div class="header">
            <!--Carousel silder top-->
            <section class="awSlider body">
                <div class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target=".carousel" data-slide-to="0" class="active"></li>
                        <li data-target=".carousel" data-slide-to="1"></li>
                        <li data-target=".carousel" data-slide-to="2"></li> 
                        <li data-target=".carousel" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="https://www.sportsadda.com/static-assets/waf-images/46/9f/58/16-9/u2Dhkn77fl.jpg?v=1.1&w=420%20420w">

                            <div class="carousel-caption">Match</div>
                        </div>
                        <div class="item">
                            <img src="http://www.aal-europe.eu/wp-content/uploads/2013/12/events_medium.jpg">
                            <div class="carousel-caption">Event</div>
                        </div>
                        <div class="item">
                            <img src="https://c1.wallpaperflare.com/preview/2/536/16/dj-night-life-night-club-rave.jpg">
                            <div class="carousel-caption">Night Club</div>
                        </div>
                        <div class="item">
                            <img src="https://ak.picdn.net/shutterstock/videos/4774832/thumb/11.jpg">
                            <div class="carousel-caption">Concert</div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Geri</span>
                    </a>
                    <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">İleri</span>
                    </a>
                </div>
            </section>
            <!--Carousel silder bottom-->
        </div>
        <div id="page-inner">

            <!--Card design Top-->
            <div class="dashboard-cards">
                <h3 class="col-lg-offset-5">Category</h3>
                <div class="row ">
                    <div class="col-md-3 col-sm-3">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                                <img class="activator" src="https://c1.wallpaperflare.com/preview/2/536/16/dj-night-life-night-club-rave.jpg">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Night Club<i class="material-icons right">more_vert</i></span>
                                <p><a href="/TicketBuddy/ticketListByTicketType?ticketType=Night Club">Night Club link</a></p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Night Club Description<i class="material-icons right">close</i></span>
                                <p>Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                                <img class="activator" src="https://www.sportsadda.com/static-assets/waf-images/46/9f/58/16-9/u2Dhkn77fl.jpg?v=1.1&w=420%20420w">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Match<i class="material-icons right">more_vert</i></span>
                                <p><a href="/TicketBuddy/ticketListByTicketType?ticketType=Match">Match link</a></p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Match Description<i class="material-icons right">close</i></span>
                                <p>Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                                <img class="activator" src="http://www.kamilgrzybek.com/wp-content/uploads/2019/06/events_bricks.jpg">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Event<i class="material-icons right">more_vert</i></span>
                                <p><a href="/TicketBuddy/ticketListByTicketType?ticketType=Event">Event link</a></p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Event Description<i class="material-icons right">close</i></span>
                                <p>Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                                <img class="activator" src="https://ak.picdn.net/shutterstock/videos/4774832/thumb/11.jpg">
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">Concert<i class="material-icons right">more_vert</i></span>
                                <p><a href="/TicketBuddy/ticketListByTicketType?ticketType=Concert">Concert link</a></p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">Concert Description<i class="material-icons right">close</i></span>
                                <p>Here is some more information about this product that is only revealed once clicked on.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Card design bottom-->



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
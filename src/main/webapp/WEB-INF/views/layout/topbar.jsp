<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div class="topbar">

            <!-- LOGO -->
            <div class="topbar-left">
                <!--<a href="index.html" class="logo"><span>Code<span>Fox</span></span><i class="mdi mdi-layers"></i></a>-->
                <!-- Image logo -->
                <a href="index.html" class="logo">
                    <span>
                                            <img src="assets/images/logo.png" alt="" height="25">
                                        </span>
                    <i>
                            <img src="assets/images/logo_sm.png" alt="" height="28">
                        </i>
                </a>
            </div>

            <!-- Button mobile view to collapse sidebar menu -->
            <div class="navbar navbar-default" role="navigation">
                <div class="container">

                    <!-- Navbar-left -->
                    <ul class="nav navbar-nav navbar-left nav-menu-left">
                        <li>
                            <button type="button" class="button-menu-mobile open-left waves-effect">
                                    <i class="dripicons-menu"></i>
                                </button>
                        </li>
                    </ul>

                    <!-- Right(Notification) -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs">
                            <form role="search" class="app-search">
                                <input type="text" placeholder="Search..." class="form-control">
                                <a href=""><i class="fa fa-search"></i></a>
                            </form>
                        </li>


                        <li class="dropdown user-box">
                            <a href="" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                <img src="assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle user-img">
                            </a>

                            <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                <li><a href="javascript:void(0)">Profile</a></li>
                                <li><a href="javascript:void(0)"><span class="badge badge-info pull-right">4</span>Settings</a></li>
                                <li><a href="javascript:void(0)">Lock screen</a></li>
                                <li class="divider"></li>
                                <li><a href="javascript:void(0)">Logout</a></li>
                            </ul>
                        </li>

                    </ul>
                    <!-- end navbar-right -->

                </div>
                <!-- end container -->
            </div>
            <!-- end navbar -->
        </div>
        <!-- Top Bar End -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<c:url value="/resources/imagegallery.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/login.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script 
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> -->
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
h1 {
	height: 100px;
	width: 100%;
	background-color: #c3c3c3;
	text-align: center;
	padding-top: 20px;
	padding-bottom:20px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 80%;
	margin: auto;
}
</style>
<style>
.dropdown-submenu {
	position: relative;
}

.dropdown-submenu .dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -1px;
}
</style>

</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="Home"><img alt="logo" src="D:\images\R1.jpg" width="50"
				height="50"></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><span
					class="glyphicon glyphicon-th" align="right"></span></a>
				<ul class="dropdown-menu">
				
					<li>
						<c:forEach items="${categoryList}" var="category">
				<a href="navproduct/${category.id }"><c:out value="${category.name}" /><span
								class="glyphicon glyphicon-menu-right"></span></a>
							<br>
						
					</c:forEach>
				</li>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="Cart">
          <span class="glyphicon glyphicon-shopping-cart"></span>Cart
        </a>
        
<sec:authorize access="isAuthenticated()">
	<li><a href="<c:url value="/perform_logout" />">Logout</a></li>
	<li><a href="">Welcome  <sec:authentication property="principal.username"/></a></li>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
<li><a href="registration">Sign Up</a>
			<li><a href="#" data-toggle="modal" data-target="#login-modal">
					Login</a></li>
				
					</sec:authorize>
		</ul>
	</div>
	</nav>

	
	<div ng-view></div>
<script>
var app = angular.module("myapp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/Home", {
        templateUrl :"Welcome"
    })
    .when("/registration",{
    	templateUrl : "registration"
    })
     .when("/Cart",{
    	templateUrl : "Cart"
    })
    .when("/Product", {
        templateUrl : "Product"
    });
});
</script>  
	<!-- <script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script> -->
	<%-- <c:if test="${UserClickedLogin}">
<jsp:include page="login.jsp"></jsp:include>
</c:if> --%>
	<%-- <c:choose>
		<c:when test="${UserClickedadmin}">
			<c:import url="/WEB-INF/views/Admin.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${UserClickedlogin}">
			<c:import url="/WEB-INF/views/login.jsp"></c:import>
		</c:when>
	</c:choose> --%>
	<c:choose>
		<c:when test="${UserClickedwelcome}">
			<c:import url="/WEB-INF/views/Welcome.jsp"></c:import>
		</c:when>
		</c:choose>
	<c:choose>
		<c:when test="${UserClickeduser}">
			<c:import url="/WEB-INF/views/registration.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${Clickedshowproduct}">
			<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${Clickedcatproduct}">
			<c:import url="/WEB-INF/views/catproducts.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${UserClickedCart}">
	<c:import url="/WEB-INF/views/Cart.jsp"></c:import>
	</c:when>
	</c:choose> 
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h2>Login to Your Account</h2><br>
				  <form action="perform_login"  method="post">
					<input type="text" name="username" placeholder="Username">
					<input type="password" name="password" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					<a href="registration">Register</a> - <a href="#">Forgot Password</a>
				  </div>
				</div>
			</div>
		  </div>
</body>
</html>
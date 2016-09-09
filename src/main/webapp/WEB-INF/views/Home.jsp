<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
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
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
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

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="#"><img alt="logo" src="D:\images\R1.jpg" width="50"
				height="50"></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-th" align="right"></span></a>
				<ul class="dropdown-menu">
					<li><c:forEach items="${categoryList}" var="category">
							<a href="#"><c:out value="${category.name}" /><span
								class="glyphicon glyphicon-menu-right"></span></a>
							<br>
						</c:forEach></li>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="Admin">Admin</a>
			<li><a href="registration"><span
					class="glyphicon glyphicon-user"></span>Register Here</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" align="center" style="font-size: 20;">
		<h1>
			<img alt="logo" src="D:\images\R-edit.jpg" width="35" height="35"><b>RISH
				e-Store </b>
		</h1>

	</div>

	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="D:\images\cam2.jpg" alt="Chania" width="320" height="240">
				</div>

				<div class="item">
					<img src="D:\images\mobile.jpg" alt="Chania" width="320"
						height="240">
				</div>

				<div class="item">
					<img src="D:\images\pc.jpg" alt="Flower" width="320" height="240">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<c:forEach items="${productList}" var="product">
		<c:out value="${product.name}" />
		<div class="thumbnail">

			<img height="100px" width="100px" alt="${product.id }"
				src="<c:url value="/resources/images/${product.id }.jpg"></c:url>">
		</div>

	</c:forEach>

	<div ng-view></div>

	<script>
		var app = angular.module("myapp", [ "ngRoute" ]);
		app.config(function($routeProvider) {
			$routeProvider.when("/", {
				templateUrl : "Home"
			}).when("/login", {
				templateUrl : "login"
			}).when("/registration", {
				templateUrl : "registration"
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script>
	<%-- <c:if test="${UserClickedLogin}">
<jsp:include page="login.jsp"></jsp:include>
</c:if> --%>
	<c:choose>
		<c:when test="${UserClickedadmin}">
			<c:import url="/WEB-INF/views/Admin.jsp"></c:import>
		</c:when>
	</c:choose>
</body>
</html>
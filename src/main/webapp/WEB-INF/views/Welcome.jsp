<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>"> 
	<link rel="stylesheet" href="<c:url value="/resources/imagegallery.css"/>">
<title>Insert title here</title>
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
<div class="container" align="center" style="font-size: 20;margin-top:40px;">
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
				<div class="item">
					<img src="D:\images\cam2.jpg" alt="Chania" width="320" height="240">
				</div>

				<div class="item active">
					<img src="D:\images\mobile1.jpg" alt="Chania" width="320"
						height="240">
				</div>

				<!-- <div class="item">
					<img src="D:\images\pc3.jpg" alt="Flower" width="320" height="240">
				</div> -->
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
	
		<c:forEach items="${productList}" var="product" end="3">
			<div class="responsive">
              <div class="img">

						<a href="ShowProduct/${product.id}"> <img height="200px"
							width="200px" alt="${product.id }"
							src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
				
			<div class="desc">
			<c:out value="${product.name}" />
			<c:url var="action" value="addtocart/${product.id}/${userid }"></c:url>
			<form:form action="${action}" modelAttribute="cart">
			<input type="submit" class="btn btn-primary" value="Add To Cart" />
			</form:form>
			</div>
			</div>
			</div>
		</c:forEach>
	
</body>
</html>
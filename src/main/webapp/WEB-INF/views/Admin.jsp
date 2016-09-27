<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Admin</title>
<style>
 .navbar-nav {
    width: 100%;
    text-align: center;
    > li {
      float: none;
      display: inline-block;
    }
  }
</style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img alt="logo" src="D:\images\R1.jpg" width="30"
				height="30"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="pull-left"><a href="#">RISH e-Store</a></li>
         <li class="active"><a href="Supplier">Supplier</a></li>
      <li class="active"><a href="Product">Product</a></li>
      <li class="active"><a href="Category">Category</a></li>
        <li class="social pull-right"><a href=<c:url value="perform_logout"/>>logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
${msg}
${msg1 }
<h1>Welcome Admin</h1>

<script>
var app = angular.module("myapp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl :"Home"
    })
    .when("/Supplier",{
    	templateUrl : "Supplier"
    })
     .when("/Category",{
    	templateUrl : "Category"
    })
    .when("/Product", {
        templateUrl : "Product"
    });
});
</script>  
<c:choose>
<c:when test="${UserClickedsupplier}">
<c:import url="/WEB-INF/views/Supplier.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${UserClickedproduct}">
<c:import url="/WEB-INF/views/Product.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${UserClickedcategory}">
<c:import url="/WEB-INF/views/Category.jsp"></c:import>
</c:when>
</c:choose>
</body>
</html>
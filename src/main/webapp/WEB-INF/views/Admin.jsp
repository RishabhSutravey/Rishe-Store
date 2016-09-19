<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <!--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<title>Admin</title>
<style>
ul {
    list-style-type: none;
    margin-top: 10px;
    padding-left: 500px;
    overflow: hidden;
    width:100%;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 4px 30px;
    text-decoration: none;
}

li a:hover {
    background-color: grey;
}


</style>
</head>
<body>
  <div>
    <ul>
      <li><a href="Supplier">Supplier</a></li>
      <li><a href="Product">Product</a></li>
      <li><a href="Category">Category</a></li>
    </ul>
  </div>
${msg}
${msg1 }
<h1>Welcome Admin</h1>
<div align="right"><a href=<c:url value="perform_logout"/>>logout</a></div>
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
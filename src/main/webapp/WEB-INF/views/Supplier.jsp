<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/table1.css" />">
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> -->
<title>Supplier</title>
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body>
	<div class="text-center myForm">
		<c:url var="action" value="editsupplier"></c:url>
		<form:form action="${action}" modelAttribute="supplier">
			<table>
			<c:choose>
			<c:when test="${supplier.id gt 0}">
				 <tr>
					<td>ID:</td>
					<td><form:input class="input1" path="id" readonly="true"/></td>
				</tr> 
				</c:when></c:choose>
				<tr>
					<td>Name:</td>
					<td><form:input class="input1" path="name" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><form:input class="input1" path="address" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary" value="Save" /></td>
				</tr>			</table>
		</form:form>
	</div>
	
		${successmessage }
	
			<div class="container" ng-app="myApp"
				ng-controller="MyController" ng-init="getDataFromServer()">
				 <%-- <form>
					<input
						ng-model="search" type="text" placeholder=" Search Supplier"
						style="width: 20%">
				</form>  --%>
				<br>
			
				<div align="center">
		<table class="table1" style="width: 80%">
			<caption>Suppliers</caption>
			<thead>
				<tr id="tr1">
					<th>Supplier Id</th>
					<th>Supplier Name</th>
					<th>Supplier Address</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${supplierList}" var="supplier">
					<tr id="tr1" data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">
						<td id="td1"><c:out value="${supplier.id}" />
						<td id="td1"><c:out value="${supplier.name}" />
						<td id="td1"><c:out value="${supplier.address}" />
						<td id="td1"><a href="addeditsupplier/${supplier.id }"><img
								alt="Edit" src="D:\images\edit1.jpg"></a>
						<td id="td1"><a href="adddeletesupplier/${supplier.id }"><img
								alt="Delete" src="D:\images\del1.jpg"></a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
			</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/table1.css" />">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
	<div class="text-center myForm">
		<c:url var="action" value="editcategory"></c:url>
		<form:form action="${action}" modelAttribute="category" >
			<table>
			<c:choose>
			<c:when test="${category.id gt 0}">
				<tr>
					<td>ID:</td>
					<td><form:input class="input1" path="id" readonly="true" /></td>
				</tr>
				</c:when></c:choose>
				<tr>
					<td>Name:</td>
					<td><form:input class="input1" path="name" required="true"/></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><form:input class="input1" path="description" required="true"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary" value="Save" /></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div align="center">
		<table class="table1" style="width: 80%">
			<caption>Categories</caption>
			<thead>
				<tr id="tr1">
					<th>Category Id</th>
					<th>Category Name</th>
					<th>Category Description</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categoryList}" var="category">
					<tr id="tr1">
						<td id="td1"><c:out value="${category.id}" />
						<td id="td1"><c:out value="${category.name}" />
						<td id="td1"><c:out value="${category.description}" />
						<td id="td1"><a href="addeditcategory/${category.id }"><img
								alt="Edit" src="D:\images\edit1.jpg"></a>
						<td id="td1"><a href="adddeletecategory/${category.id }"><img
								alt="Delete" src="D:\images\del1.jpg"></a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
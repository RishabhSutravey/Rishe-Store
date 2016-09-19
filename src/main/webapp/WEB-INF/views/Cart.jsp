<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Your Cart</h1>
${emptycart}
<c:forEach items="${cartList }" var="cart">
Product:<c:out value="${cart.productname }"/><br>
Price:Rs.<c:out value="${cart.price }"/><br>
<a href="delete/${cart.id}">delete</a><br>
quantity:<c:out value="${cart.quantity }"></c:out>
<hr>
Total Price:
</c:forEach>
</body>
</html>
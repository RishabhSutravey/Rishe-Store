<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
<c:url var="action" value="adduser"></c:url>
<form:form action="${action }" modelAttribute="userDetails">
<table>
<tr><td>Name:</td><td><form:input path="username" /></td></tr>
<tr><td>Password:</td><td><form:input path="password" type="password"/></td></tr>
<tr><td>E-mail:</td><td><form:input path="mail" /></td></tr>
<tr><td>Mobile:</td><td><form:input path="contact" /></td></tr>
<tr><td>Address:</td><td><form:input path="address" /></td></tr>
<tr><td></td><td><input type="submit" value="Register"/></td></tr>
</table>
</form:form>
${registered}
</body>
</html>
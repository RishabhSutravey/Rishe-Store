<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>All products</h1>
<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="continue">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />

       Enter Card Number <input type="text" name="cardnumber"><br>
       Enter Expiry Date<input type="text" name="date"><br>
       Enter cvv <input type="text" name="cvv"><br>
        <input type="submit" value="Continue">
        </form>

<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="cancel">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
        <input type="submit" value="Cancel">
        </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amazon Login</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>

<body>


	<%@ include file="header.jsp" %>


	<div class="container">
		<h2>Login</h2>
		<form action="/verify-login" method="post">
			<input type="text" name="username" placeholder="Enter username" required>
			<input type="password" name="password" placeholder="Enter Password"
				required>
			<button type="submit" class="btn">Login</button>
		</form>
		<br> <a href="/get-registerpage">Register</a>

	</div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>

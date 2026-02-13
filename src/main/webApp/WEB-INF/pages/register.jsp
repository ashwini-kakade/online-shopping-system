<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
		<h2>Register</h2>
		 <form action="/register-customer" method="post">

        <input type="text" name="name" placeholder="Enter Full Name" required>

        <input type="email" name="email" placeholder="Enter Email" required>

        <input type="text" name="mob" placeholder="Enter Mobile Number" required>

        <input type="text" name="username" placeholder="Enter Username" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit" class="btn">Register</button>

    </form>
		
		<br> <a href="/get-loginPage">Already have an account? Login</a>
	</div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>

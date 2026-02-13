<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update-customer</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<form action="update-customer" method="post">

    <input type="hidden" name="customerId" value="${customer.customerId}"/>

    Name: <input type="text" name="name" value="${customer.name}"><br>
    Email: <input type="email" name="email" value="${customer.email}"><br>
    Mobile: <input type="text" name="mob" value="${customer.mob}"><br>
    Username: <input type="text" name="username" value="${customer.username}"><br>
    Password: <input type="text" name="password" value="${customer.password}"><br>

    <button type="submit">Update</button>
 
</form>
</body>
</html>
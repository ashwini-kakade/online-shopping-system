<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<body>

<h2>Your Cart</h2>

<c:if test="${empty cartlist}">
    <p>Your cart is empty</p>
</c:if>

<c:if test="${not empty cartlist}">
<table border="1">
    <tr>
        <th>Product</th>
        <th>Total Price</th>
    </tr>

    <c:forEach var="p" items="${cartlist}">
        <tr>
            <td>${p.productname}</td>
            <td>₹${p.price}</td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="/generateBill">
<form action="/checkout" method="post">
    <button type="submit">Proceed to Bill</button>
</form>
</a>
</c:if>

</table>









</body>
</html>
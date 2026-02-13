<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amazon - Home</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="product-grid">
		<c:forEach var="p" items="${plist}">
			<div class="product-card">

				<img src="../../images/${p.imagePath}.jpeg"
                     alt="${p.productname}"
                     class="product-image">

                <h3>${p.productname}</h3>
                <p>Category: ${p.category}</p>
                <p>Price: ₹${p.price}</p>

			</div>
		</c:forEach>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>

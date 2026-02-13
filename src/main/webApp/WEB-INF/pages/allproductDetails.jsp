<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Product Details</title>
<link rel="stylesheet" href="../css/style.css">
</head>

<body>

    <%@ include file="header.jsp" %>

    <section class="product-section">
        <h2 class="section-title">Our Products</h2>

        <div class="product-grid">

            <c:forEach var="p" items="${plist}">

                <div class="product-card">

                    <!-- IMAGE -->
                    <div class="img-container">
                        <img src="../../images/${p.imagePath}.jpeg"
                             alt="${p.productname}" class="product-image">
                    </div>

                    <!-- PRODUCT INFO -->
                    <h3 class="product-title">${p.productname}</h3>
                    <p class="product-category">Category: <span>${p.category}</span></p>
                    <p class="product-price">₹${p.price}</p>

                    <!-- QUANTITY UPDATE -->
                    <form action="/update-quantity" method="post" class="qty-form">
                        <input type="hidden" name="productId" value="${p.productid}" />

                        <div class="quantity-control">
                            <button type="submit" name="action" value="decrease" class="qty-btn">−</button>

                            <!-- ALWAYS DISPLAY A QUANTITY -->
                            <input type="text" name="quantity"
                                   value="${cart[p.productid] != null ? cart[p.productid] : 1}"
                                   readonly class="qty-box"/>

                            <button type="submit" name="action" value="increase" class="qty-btn">+</button>
                        </div>
                    </form>

                    <!-- ADD TO CART -->
                    <form action="/addToCart" method="post">
                        <input type="hidden" name="productId" value="${p.productid}">
                        <input type="hidden" name="quantity"
                               value="${cart[p.productid] != null ? cart[p.productid] : 1}">
                        <button type="submit" class="cart-btn">🛒 Add to Cart</button>
                    </form>

                    <!-- BUY NOW (FIXED: ADDED qty FIELD) -->
                    <form action="/generateBill" method="post">
                        <input type="hidden" name="pid" value="${p.productid}">
                        <input type="hidden" name="qty"
                               value="${cart[p.productid] != null ? cart[p.productid] : 1}">
                        <button type="submit" class="buy-btn">⚡ Buy Now</button>
                    </form>

                </div>
            </c:forEach>

        </div>
    </section>

    <%@ include file="footer.jsp" %>

</body>
</html>

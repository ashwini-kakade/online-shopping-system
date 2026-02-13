<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Receipt</title>

<style>
   /* ----------- GLOBAL ----------- */
body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f0f2f5;
    margin: 0;
    padding: 0;
}

/* ----------- BILL CONTAINER ----------- */
.bill-box {
    max-width: 600px;
    background: #ffffff;
    margin: 40px auto;
    padding: 25px 35px;
    border-radius: 16px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
    animation: fadeIn 0.4s ease-in-out;
}

.bill-box h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #222;
    font-size: 28px;
    font-weight: 600;
}

/* ----------- TABLE ----------- */
table {
    width: 100%;
    border-collapse: collapse;
    font-size: 18px;
}

table td {
    padding: 12px 8px;
    border-bottom: 1px solid #e2e2e2;
    color: #333;
}

.total {
    color: #0A66C2;
    font-weight: 700;
    font-size: 20px;
}

/* ----------- RESPONSIVE ----------- */
@media (max-width: 480px) {
    .bill-box {
        padding: 20px;
        margin: 20px;
    }

    table td {
        padding: 10px 5px;
        font-size: 16px;
    }

    .bill-box h2 {
        font-size: 24px;
    }
}

/* ----------- ANIMATIONS ----------- */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(15px); }
    to { opacity: 1; transform: translateY(0); }
}
   
</style>

</head>
<body>

<%@ include file="header.jsp" %>

<div class="bill-box">
    <h2>Bill Receipt</h2>

    <table>
        <tr>
            <td><b>Customer Name:</b></td>
            <td>${customerName}</td>
        </tr>
        <tr>
            <td><b>Product:</b></td>
            <td>${product.productname}</td>
        </tr>
        <tr>
            <td><b>Quantity:</b></td>
            <td>${quantity}</td>
        </tr>
        <tr>
            <td><b>Price:</b></td>
            <td>₹${product.price}</td>
        </tr>
        <tr>
            <td class="total"><b>Total Amount:</b></td>
            <td class="total">₹${total}</td>
        </tr>
    </table>
</div>
	<%@ include file="footer.jsp"%>

</body>
</html>

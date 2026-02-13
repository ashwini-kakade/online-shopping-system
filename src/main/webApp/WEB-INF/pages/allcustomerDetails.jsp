<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Details</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>

<body>
    <%@ include file="header.jsp" %>

<div class="table-container">
    <h2>Customer Details</h2>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="c" items="${clist}">
                <tr>
                    <td>${c.customerId}</td>
                    <td>${c.name}</td>
                    <td>${c.email}</td>
                    <td>${c.mob}</td>
                    <td>${c.username}</td>
                    <td>
                        <a class="edit-btn" href="edit-customer?customerId=${c.customerId}">
                            Edit
                        </a>
                        <a class="delete-btn" 
                           href="delete-customer?customerId=${c.customerId}"
                           onclick="return confirm('Are you sure to delete this customer?');">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer</title>
</head>
<body>

<div class="update-form">
    <h2>Update Customer</h2>

    <form action="update-customer" method="post">

        <input type="hidden" name="customerId" value="${customer.customerId}"/>

        <label>Name</label>
        <input type="text" name="name" value="${customer.name}" required />

        <label>Email</label>
        <input type="email" name="email" value="${customer.email}" required />

        <label>Mobile</label>
        <input type="text" name="mob" value="${customer.mob}" required />

        <label>Username</label>
        <input type="text" name="username" value="${customer.username}" required />

        <label>Password</label>
        <input type="text" name="password" value="${customer.password}" required />

        <button type="submit" class="update-btn">Update</button>
    </form>
</div>



</body>
</html>

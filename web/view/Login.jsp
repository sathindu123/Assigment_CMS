<%--
  Created by IntelliJ IDEA.
  User: SATHI
  Date: 6/13/2025
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="16kb" autoFlush="false"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/LoginStyle.css" rel="stylesheet">
</head>
<body>

<div id="header3">
    <h1>WELCOME TO CMS</h1>
</div>

<div class="page-wrapper">
    <div class="container">
        <div id="imgDIV">
            <img src="assict/4826435.jpg" alt="Login Image">
        </div>

        <div class="login-container">
            <h2>Log in to CMS</h2>
            <form method="POST" action="${pageContext.request.contextPath}/LogIn">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Login</button>
                <label id="Label">Do you want to join CMS</label>
                <button type="button" class="btn btn-secondary btn-signup" onclick="window.location.href='${pageContext.request.contextPath}/view/SignUP.jsp'">Sign Up</button>
            </form>
            <% if (request.getAttribute("error") != null) { %>
            <p class="error-message text-danger"><%= request.getAttribute("error") %></p>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/Login.js"></script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: SATHI
  Date: 6/13/2025
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" buffer="16kb" autoFlush="false"%>
<html>
<head>
    <title>Title</title>
    <script>
        function validateForm() {
            let username = document.forms["loginForm"]["username"].value;
            let password = document.forms["loginForm"]["password"].value;
            if (username == "" || password == "") {
                alert("Username and Password are required!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h2>Login</h2>
<form name="loginForm" action="LoginServlet" method="post" onsubmit="return validateForm()">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>

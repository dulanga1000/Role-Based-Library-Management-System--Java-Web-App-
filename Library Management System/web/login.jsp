<%-- 
    Document   : login
    Created on : Apr 25, 2025, 9:27:24 PM
    Author     : dulan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form action="login" method="post">
           Username: <input type="text" name="username"/><br/>
           Password: <input type="password" name="password"/><br/>
           <input type="submit" value="Login"/>
         </form>

    </body>
</html>

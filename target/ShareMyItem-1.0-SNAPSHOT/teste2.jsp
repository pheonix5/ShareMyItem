<%-- 
    Document   : teste2
    Created on : 4 de out. de 2023, 23:50:28
    Author     : Eliakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{
                margin-left:250px;
                background-color: blue;
            }
        </style>
    </head>
    <body>
        <h1>TELA TESTE </h1>
        <%
            String resposta = request.getAttribute("texto");
        %>
        <h1> <%=resposta%></h1>
    </body>
</html>

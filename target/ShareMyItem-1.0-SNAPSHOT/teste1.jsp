<%-- 
    Document   : teste1
    Created on : 4 de out. de 2023, 23:50:13
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
                background-color: red;
            }
            .body{
                margin-left:250px;
                
            }
        </style>
    </head>
    <body>
        <h1>TELA TESTE 1</h1>
        <form action="enviar.do" mathod="post" class="body">
            <p>
                <input type="text" name="testeParam" />
            </p>
            <input type="submit" value="enviar"/>
        </form>
    </body>
</html>

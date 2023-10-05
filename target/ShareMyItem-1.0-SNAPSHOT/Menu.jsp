<%-- 
    Document   : Home
    Created on : 4 de out. de 2023, 20:37:36
    Author     : lucas
--%>
<%@page import="br.com.controle.Usuario"%>

<%
  Usuario ulogado = new Usuario();
  
   ulogado = (Usuario) session.getAttribute("usuario");
%>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Título da Página</title>
    <link rel="stylesheet" href="style/styleHome.css">
    
</head>
<body>
    <div class="menu">
        <ul>
            <li><a href="teste1.jsp">Página 1</a></li>
            <li><a href="teste2.jsp">Página 2</a></li>
        </ul>
    </div>

    <div class="conteudo">
        <!-- Conteúdo da página aqui -->
    </div>
    
    <script src="script.js"></script>
</body>
</html>

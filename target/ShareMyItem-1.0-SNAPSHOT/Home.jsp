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
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style/styleDash.css">
  <title>Início</title>
</head>
<body>
  <aside class="sidebar">
      <img src="image/logo2.png" alt="Logo share my item">
      <div>
        <span>
          <a href=""></a>
        </span>
      </div>
  </aside>
    <h1><%=ulogado.getNome()%></h1>
    <h1><%=ulogado.getEmail()%></h1>
    <h1><%=ulogado.getCpf()%></h1>
  
</body>
</html>

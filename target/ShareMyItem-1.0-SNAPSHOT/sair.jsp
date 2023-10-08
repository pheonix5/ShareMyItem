<%-- 
    Document   : sair.jsp
    Created on : 8 de out. de 2023, 19:36:44
    Author     : lucas
--%>

<%
    String tipo = request.getParameter("usuario");
    
        session.removeAttribute("usuario");
        response.sendRedirect("Login.jsp");
   
%>
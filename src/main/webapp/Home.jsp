<%-- 
    Document   : Home
    Created on : 5 de out. de 2023, 19:46:00
    Author     : Eliakim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Item"%>
<%@page import="br.com.entidade.ManterItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/styleHome.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <div class="div-geral">
            <div class="menu-lateral">
                <%@include file="Menu.jsp"%>
            </div> 
        </div>

        <div class="body">
            <div class="content">
                <div class="header">
                    <h1 class="h1">Anúncios</h1>
                </div>
                <div class="painel">
                    <%             
                        ArrayList<Item> lista = new ArrayList<Item>();
                        try {
                            ManterItem m = new ManterItem();
                            lista = m.listaDisponivel();

                        } catch (Exception e) {
                            System.out.println("Erro ao lista items: " + e.getMessage());
                        }
                        
                        
                        if(lista.isEmpty()){
                        %>    
                        <p>Nenhum item disponivel</p>
                        <%
                         }

                        for (Item i : lista) {
                    %>  
                    <div class="anuncio">
                        <div class="content-anuncio">
                            <p>Item: <%=i.getNome()%></p>
                            <p>Descrição: <%=i.getDescricao()%></p>
                            <p>Dono: <%=i.getUsuario().getNome()%></p>
                            <p>Categoria: <%=i.getCategoria().getNome()%></p>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

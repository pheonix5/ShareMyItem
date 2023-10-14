<%-- 
    Document   : teste1
    Created on : 4 de out. de 2023, 23:50:13
    Author     : Eliakim
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Item"%>
<%@page import="br.com.entidade.ManterItem"%>
<%@page import="br.com.controle.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/styleHome.css">
        <link rel="stylesheet" href="style/styleMeusAnuncios.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>

        <div class="div-geral">
            <%@include file="Menu.jsp"%>
        </div>

        <div class="body">
            <div class="content">
                <div class="header">
                    <h1 class="h1">Meus Itens</h1>
                    <a href="CadastraItem.jsp" class="btt-cadastra"><p>Cadastrar Item</p></a>
                </div>
                <div class="painel">
                    <div class="anuncio">

                        <% 
                            
                            ArrayList<Item> lista = new ArrayList<Item>();
                            try{  
                                Usuario u = (Usuario) session.getAttribute("usuario");
                                ManterItem mi = new ManterItem();
                                lista = mi.listar(u.getUsuario_id());
                            }catch(Exception e){
                                out.print("Erro: " + e);
                            }
                            
                            for(Item i: lista){
                            
                        %>

                        <div class="content-anuncio">
                            <p>
                                <%=i.getNome()%>
                            </p>
                            <p>
                                <%=i.getDescricao()%>
                            </p>
                            <p>
                                <%=i.getCategoria().getNome()%>
                            </p>                           
                        </div>

                        <%}%>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>

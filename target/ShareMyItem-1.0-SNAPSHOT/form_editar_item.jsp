<%-- 
    Document   : CadastraItem
    Created on : 10 de out. de 2023, 16:35:51
    Author     : Eliakim

--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Categoria"%>
<%@page import="br.com.entidade.ManterCategoria"%>
<%@page import="br.com.controle.Item"%>
<%@page import="br.com.entidade.ManterItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Item i = new Item();
    try{
        int item_id = Integer.parseInt(request.getParameter("item_id"));
        ManterItem mi  = new ManterItem();
        i = mi.carregaPorId(item_id);
    
    }catch(Exception e){
        out.print("erro: " + e);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar-Item</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="style/styleCadastraItem.css"
    </head>
    <body>
        <div class="div-geral">
            <%@include file="Menu.jsp"%>
        </div>

        <div class="body">
            <div class="content">
                <div class="header">
                    <h1 class="h1">Editar Item</h1>                    
                </div>
                <div class="painel">                    
                    <h2>Preencha os campos para Editar o seu item</h2>
                    <form action="alterarItem.do" method="post" class="form">

                        <div class="content-input">
                            <input type="hidden" name="item_id" value="<%=i.getItem_id()%>">
                            <label>
                                <input type="text" placeholder="Nome" name="nome" value="<%=i.getNome()%>" required>
                            </label>

                            <label>
                                <input type="text" placeholder="Descrição" name="descricao" value="<%=i.getDescricao()%>"required>
                            </label>
                            
                             <label>
                                <input type="number" placeholder="Situação" name="situacao" value="<%=i.getSituacao()%>"required>
                            </label>


                            <select class="categorias" name="categoria_id" required>
                                <option value=<%=i.getCategoria().getCategoria_id()%> > <%=i.getCategoria().getNome()%> </option>
                                <%
                                    ArrayList<Categoria> lista = new ArrayList<Categoria>();
                                    try{
                                        ManterCategoria mc = new ManterCategoria();
                                        lista = mc.listar();
                                    }catch(Exception e){
                                    out.print("Erro: " + e);
                                    }
                                    
                                    for (Categoria c: lista) {
                                %>
                                <option value=<%=c.getCategoria_id()%> > <%=c.getNome()%> </option>
                                <%
                                    }
                                %>   
                            </select>

                        </div>
                        <button type="submit" class="form-button">Anunciar</button>
                    </form>                    
                </div>
                <div class="footer" id="footer-id">  
                    <a href="MeusAnuncios.jsp"> <p>Cancelar </p></a>
                    <script>
                        document.getElementById('footer-id').addEventListener('click', function () {
                            window.location.href = 'MeusAnuncios.jsp';
                        });
                    </script>
                </div>  
            </div>
        </div>
    </div>
</body>
</html>

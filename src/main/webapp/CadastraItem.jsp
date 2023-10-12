<%-- 
    Document   : CadastraItem
    Created on : 10 de out. de 2023, 16:35:51
    Author     : Eliakim

--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Categoria"%>
<%@page import="br.com.entidade.ManterCategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <h1 class="h1">Anunciar Item</h1>                    
                </div>
                <div class="painel">                    
                    <h2>Preencha os campos para anunciar o seu item</h2>
                    <form action="CadastrarItem.do" method="post" class="form">

                        <div class="content-input">

                            <label>
                                <input type="text" placeholder="Nome" name="nome" required>
                            </label>

                            <label>
                                <input type="text" placeholder="Descrição" name="descricao" required>
                            </label>
                            <select class="categorias" name="categoria_id" required>
                                <option value="" disabled selected>Selecione uma categoria</option>
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

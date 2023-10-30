<%-- 
    Document   : teste2
    Created on : 4 de out. de 2023, 23:50:28
    Author     : Eliakim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/stylePerfil.css">
        <link rel="stylesheet" href="style/styleHome.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>

        <div class="div-geral">
            <%@include file="Menu.jsp"%>
        </div>
        <div class="body">
            <div class="content">
                <div class="header">
                    <h1 class="h1">Perfil</h1>
                </div>
                <div class="painel">
                    <form action="AlterarPerfil.do" method="post">
                        <div class="content-input">
                            <input type="hidden" name="id" value=<%=uLogado.getUsuario_id()%> >
                            <label>
                                <input type="text" placeholder="Nome" value="<%=uLogado.getNome()%>" name="nome" required>
                                <div class="material-symbols-outlined">
                                    person
                                </div>
                            </label>

                            <label>
                                <input type="email" placeholder="E-mail"  value=<%=uLogado.getEmail()%> name="email" required>
                                <div class="material-symbols-outlined">
                                    mail
                                </div>
                            </label>

                            <label>
                               
                                <input type="tel" placeholder="Telefone" value="<%=uLogado.getTelefone()%>" name="telefone" onkeypress="$(this).mask('(00) 00000-0000');"
                                       required>
                                <div class="material-symbols-outlined">
                                    phone_iphone
                                </div>
                            </label>

                            <label>
                                <input type="text" placeholder="CPF" value=<%=uLogado.getCpf()%> name="cpf" onkeypress="$(this).mask('000.000.000-00');" required>
                                <div class="material-symbols-outlined">
                                    123
                                </div>
                            </label>

                            <label>
                                <input type="text" placeholder="Senha" value=<%=uLogado.getSenha()%> name="senha" required>
                                <div class="material-symbols-outlined">
                                    password
                                </div>
                            </label>

                                <button type="submit" class="form-button">Salvar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

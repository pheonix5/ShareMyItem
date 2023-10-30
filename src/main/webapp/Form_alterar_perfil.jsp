<%-- 
    Document   : teste2
    Created on : 4 de out. de 2023, 23:50:28
    Author     : Lucas Felix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/stylePerfil.css">
        <link rel="stylesheet" href="style/styleHome.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
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
                    <div class="content-input">


                        <label>
                            <input type="text" placeholder="Nome" name="nome" required>
                            <div class="material-symbols-outlined">
                                person
                            </div>
                        </label>

                        <label>
                            <input type="email" placeholder="E-mail" name="email" required>
                            <div class="material-symbols-outlined">
                                mail
                            </div>
                        </label>

                        <label>
                            <input type="text" placeholder="Telefone" name="telefone" onkeypress="$(this).mask('(00) 00000-0000')"
                                   required>
                            <div class="material-symbols-outlined">
                                phone_iphone
                            </div>
                        </label>

                        <label>
                            <input type="text" placeholder="CPF" name="cpf" onkeypress="$(this).mask('000.000.000-00');" required>
                            <div class="material-symbols-outlined">
                                123
                            </div>
                        </label>

                        <label>
                            <input type="password" placeholder="Senha" name="senha" required>
                            <div class="material-symbols-outlined">
                                password
                            </div>
                        </label>
                        <label>
                            <input type="submit" value="Salvar">

                        </label>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

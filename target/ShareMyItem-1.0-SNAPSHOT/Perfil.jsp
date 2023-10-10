<%-- 
    Document   : teste2
    Created on : 4 de out. de 2023, 23:50:28
    Author     : Eliakim
--%>

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
                <div class="menu">
                    <img src="image/logo2.png" />
                    <ul>
                        <li class="li-menu" id="anuncios-li">
                            <div>
                                <span class="material-symbols-outlined">
                                    newspaper
                                </span>
                                <a href="Home.jsp"><p>Anúncios</p></a>
                            </div>
                        </li>
                        <script>
                            document.getElementById('anuncios-li').addEventListener('click', function () {
                                window.location.href = 'Home.jsp';
                            });
                        </script>
                        <li class="li-menu" id="meus-anuncios-li">
                            <div>
                                <span class="material-symbols-outlined">
                                    forms_add_on
                                </span>
                                <a href="MeusAnuncios.jsp">
                                    Meus Anúncios
                                </a>
                            </div>
                        </li>
                        <script>
                            document.getElementById('meus-anuncios-li').addEventListener('click', function () {
                                window.location.href = 'MeusAnuncios.jsp';
                            });
                        </script>
                        <li class="li-menu" id="perfil-li">
                            <div>
                                <span class="material-symbols-outlined">
                                    account_circle
                                </span>
                                <a href="Perfil.jsp">Perfil</a>
                            </div>
                        </li>
                        <script>
                            document.getElementById('perfil-li').addEventListener('click', function () {
                                window.location.href = 'Perfil.jsp';
                            });
                        </script>
                        <li class="li-menu" id="logout-li">
                            <div>
                                <span class="material-symbols-outlined">
                                    logout
                                </span>
                                <a href="Login.jsp">Sair</a>
                            </div>
                        </li>
                        <script>
                            document.getElementById('logout-li').addEventListener('click', function () {
                                window.location.href = 'Login.jsp';
                            });
                        </script>
                    </ul>
                </div>

                <div class="conteudo">
                    <!-- Conteúdo da página aqui -->
                </div>

            </div>
            <div class="body">
                <div class="content">
                    <div class="header">
                        <h1 class="h1">Perfil</h1>
                    </div>
                    <div class="painel">
                        <div class="anuncio">
                            <div class="content-anuncio">
                                <p>
                                    Titulo XXXXXXXX
                                </p>
                                <p>
                                    Titulo XXXXXXXX
                                </p>
                                <p>
                                    Titulo XXXXXXXX
                                </p>                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

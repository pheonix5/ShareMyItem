<%-- 
    Document   : Menu
    Created on : 8 de out. de 2023, 19:45:34
    Author     : lucas
--%>
<%@page import="br.com.controle.Usuario" %>

<% 
    Usuario uLogado = new Usuario();
    
    uLogado = (Usuario) session.getAttribute("usuario");
    if(uLogado == null){
       response.sendRedirect("Login.jsp");
       return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/menu.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <div class="menu">
            <img src="image/logo2.png" />
            <ul>
                <li class="li-menu" id="anuncios-li">
                    <div>
                        <span class="material-symbols-outlined">
                            newspaper
                        </span>
                        <a href="Home.jsp">
                            <p>Anúncios</p>
                        </a>
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
                        <a href="sair.jsp?usuario=usuario">Sair</a>
                    </div>
                </li>
                <script>
                    document.getElementById('logout-li').addEventListener('click', function () {
                        window.location.href = 'sair.jsp?usuario=usuario';
                    });
                </script>
            </ul>
        </div>
    </body>
</html>
<%-- 
    Document   : Login
    Created on : 30 de set. de 2023, 17:42:14
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style/style.css">
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <title>Login - MyShare</title>
</head>

<body>
  <main>
    <img src="image/logo.png" />

    <div class="container-login">
      <h2>Faça login para acessar a aplicação!</h2>
      <form action="ValidarLogin.do" method="post" class="form">

        <div class="content-input">

          <label>
            <input type="email" placeholder="E-mail" name="email" required>
            <div class="material-symbols-outlined">
              mail
            </div>
          </label>

          <label>
            <input type="password" placeholder="Senha" name="senha" required>
            <div  class="material-symbols-outlined">
              password
            </div>
          </label>

        </div>
        <button type="submit" class="form-button">Entrar</button>
        <a href="FormCadastraUsuario.jsp" class="form-link">Criar nova conta</a>
      </form>
    </div>
  </main>

  
</body>

</html>

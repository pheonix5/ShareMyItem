<%-- Document : FormCadastraUsuario Created on : 30 de set. de 2023, 17:42:37 Author : lucas --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="style/style.css">
      <title>Cadastra Usuário</title>
    </head>

    <body>
      <main>
        <img src="image/logo.png" />

        <div class="container-login">
          <h2>Cadastre-se</h2>
          <form action="cadastrar.do" method="post"></form>

          <div class="content-input">

            <input type="text" placeholder="Nome" name="nome" required>
            <input type="email" placeholder="E-mail" name="email" required>
            <input type="text" placeholder="Telefone" name="telefone" required>
            <input type="text" placeholder="CPF" name="cpf" required>
            <input type="password" placeholder="Senha" name="senha" required>
            <button type="submit">Cadastrar</button>
            <a href="Login.jsp">Voltar para tela de login</a>
          </div>
          </form>
        </div>
      </main>
    </body>

    </html>
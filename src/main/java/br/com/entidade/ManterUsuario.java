/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author lucas
 */
public class ManterUsuario extends DAO {

    public void inserir(Usuario u) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO usuario (usuario_id,nome,cpf,telefone,email,senha) "
                    + "VALUES (null,?,?,?,?,?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, u.getNome());
            pst.setString(2, u.getCpf());
            pst.setString(3, u.getTelefone());
            pst.setString(4, u.getEmail());
            pst.setString(5, u.getSenha());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao inserir: " + e.getMessage());
        }
    }

    public Usuario logar(String email, String senha) throws Exception {

        String sql = "SELECT * FROM usuario where email =?";
        this.abrirBanco();
        pst = con.prepareStatement(sql);
        pst.setString(1, email);
        ResultSet rst = (ResultSet) pst.executeQuery();
        Usuario u = new Usuario();
        if (rst.next()) {
            if (senha.equals(rst.getString("senha"))) {
                u.setUsuario_id(rst.getInt("usuario_id"));
                u.setNome(rst.getString("nome"));
                u.setCpf(rst.getString("cpf"));
                u.setTelefone(rst.getString("telefone"));
                u.setEmail(rst.getString("email"));
            }
        }
        this.fecharBanco();
        return u;
    }

    public Usuario carregaPorId(int id_usuario) throws Exception {
        String query = "SELECT * FROM usuario WHERE usuario_id = ?";
        abrirBanco();
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setInt(1, id_usuario);
        ResultSet rst = pst.executeQuery();
        Usuario u = new Usuario();
        if (rst.next()) {
            u.setUsuario_id(rst.getInt("categoria_id"));
            u.setNome(rst.getString("nome"));
            u.setCpf(rst.getString("cpf"));
            u.setTelefone(rst.getString("telefone"));
            u.setEmail(rst.getString("email"));
            u.setSenha(rst.getString("senha"));
        }
        fecharBanco();
        return u;
    }
}

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
        ResultSet rs = (ResultSet) pst.executeQuery();
        Usuario u = new Usuario();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                u.setUsuario_id(rs.getInt("usuario_id"));
                u.setNome(rs.getString("nome"));
                u.setCpf(rs.getString("cpf"));
                u.setTelefone(rs.getString("telefone"));
                u.setEmail(rs.getString("email"));
            }
        }
        this.fecharBanco();
        return u;
    }

}
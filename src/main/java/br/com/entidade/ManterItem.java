/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Item;
import java.sql.PreparedStatement;

/**
 *
 * @author lucas
 */
public class ManterItem  extends DAO{
    
    public void inserir(Item i) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO item (item_id,nome,descricao,situacao,id_usuario,id_categoria) "
                    + "VALUES (null,?,?,?,?,?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1, i.getNome());
            pst.setString(2, i.getDescricao());
            pst.setInt(3, i.getSituacao());
            pst.setInt(4, i.getUsuario().getUsuario_id());
            pst.setInt(5, i.getCategoria().getCategoria_id());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao inserir: " + e.getMessage());
        }
    }
}

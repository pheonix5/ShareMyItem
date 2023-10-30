/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lucas
 */
public class ManterAnuncio extends DAO{
    
    public Boolean Anunciar(int item_id, int situacao) throws Exception{
        String query = "UPDATE item SET situacao=? WHERE item_id=?";
        try {
           abrirBanco();
           pst = (PreparedStatement) con.prepareStatement(query);
           pst.setInt(1, situacao);
           pst.setInt(2, item_id);
           pst.executeUpdate();
           fecharBanco();
        } catch (SQLException e) {
            System.out.println("Erro ao anunciar: " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public Boolean removerAnuncio(int item_id) throws Exception{
      String query = "UPDATE item SET situacao=? WHERE item_id=?";
        try {
           abrirBanco();
           pst = (PreparedStatement) con.prepareStatement(query);
           pst.setInt(1, 0);
           pst.setInt(2, item_id);
           pst.executeUpdate();
           fecharBanco();
        } catch (SQLException e) {
            System.out.println("Erro ao anunciar: " + e.getMessage());
            return false;
        }
        return true;
    }
    
}

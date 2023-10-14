/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Item;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class ManterItem extends DAO {

    public void inserir(Item i) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO item (item_id,nome,descricao,situacao,id_usuario,categoria_id) "
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

    public ArrayList<Item> listar(int id_usuario) throws Exception {
        abrirBanco();
        String query = "SELECT * FROM item WHERE id_usuario = ?";
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setInt(1, id_usuario);
        ResultSet rs = pst.executeQuery();
        ArrayList<Item> lista = new ArrayList<>();
        while (rs.next()) {
            Item i = new Item();
            i.setItem_id(rs.getInt("item_id"));
            i.setNome(rs.getString("nome"));
            i.setDescricao(rs.getString("descricao"));
            ManterCategoria mc = new ManterCategoria();
            i.setCategoria(mc.carregaPorId(rs.getInt("categoria_id")));
            i.setSituacao(rs.getInt("situacao"));
            ManterUsuario mu = new ManterUsuario();
            i.setUsuario(mu.carregaPorId(rs.getInt("id_usuario")));

            lista.add(i);
        }
        fecharBanco();
        return lista;
    }

    public Item carregaPorId(int item_id) throws Exception {
        String query = "SELECT * FROM item WHERE  item_id = ?";
        abrirBanco();
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setInt(1, item_id);
        ResultSet rst = pst.executeQuery();
        Item i = new Item();
        if (rst.next()) {
            i.setItem_id(rst.getInt("item_id"));
            i.setNome(rst.getString("nome"));
            i.setDescricao(rst.getString("descricao"));
            i.setSituacao(rst.getInt("situacao"));
            ManterCategoria mc = new ManterCategoria();
            i.setCategoria(mc.carregaPorId(rst.getInt("categoria_id")));
            ManterUsuario mu = new ManterUsuario();
            i.setUsuario(mu.carregaPorId(rst.getInt("id_usuario")));
        }
        fecharBanco();
        return i;
    }
    
     public void alterar(Item i) throws Exception {
        String query = "UPDATE item SET nome=?, descricao=?, situacao=?, id_usuario=?, categoria_id=?  WHERE item_id=?";
        abrirBanco();
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setString(1, i.getNome());
        pst.setString(2, i.getDescricao());
        pst.setInt(3, i.getSituacao());
        pst.setInt(4, i.getUsuario().getUsuario_id());
        pst.setInt(5, i.getCategoria().getCategoria_id());
        pst.setInt(6, i.getItem_id());
        pst.executeUpdate();
        fecharBanco();
    }
    
    public void excluir(int item_id) throws Exception {
        String query = "DELETE FROM item WHERE item_id=?";
        abrirBanco();
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setInt(1, item_id);
        pst.execute();
        fecharBanco();
    }

}

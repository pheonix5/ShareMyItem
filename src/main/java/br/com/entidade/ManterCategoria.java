/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Categoria;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;

/**
 *
 * @author lucas
 */
public class ManterCategoria extends DAO {

    public ArrayList<Categoria> listar() throws Exception {
        String query = "SELECT * FROM categoria";
        abrirBanco();
        PreparedStatement pstm = con.prepareStatement(query);
        ResultSet rst = pstm.executeQuery();
        ArrayList<Categoria> lista = new ArrayList<>();
        while (rst.next()) {
            Categoria cat = new Categoria();
            cat.setCategoria_id(rst.getInt("categoria_id"));
            cat.setNome(rst.getString("nome"));
            lista.add(cat);
        }
        fecharBanco();
        return lista;
    }

    public Categoria carregaPorId(int id_categoria) throws Exception {
        String query = "SELECT * FROM categoria WHERE categoria_id=?";
        abrirBanco();
        pst = (PreparedStatement) con.prepareStatement(query);
        pst.setInt(1, id_categoria);
        ResultSet rst = pst.executeQuery();
        Categoria c = new Categoria();
        if (rst.next()) {
            c.setCategoria_id(rst.getInt("categoria_id"));
            c.setNome(rst.getString("nome"));
        }
        fecharBanco();
        return c;
    }
}

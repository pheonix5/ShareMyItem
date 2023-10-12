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
    
    public ArrayList<Categoria> listar() throws Exception{
        String sql = "SELECT * FROM categoria";
        abrirBanco();
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rst = pstm.executeQuery();
        ArrayList<Categoria> lista = new ArrayList<>();
        while (rst.next()){
            Categoria cat = new Categoria();
            cat.setCategoria_id(rst.getInt("categoria_id"));
            cat.setNome(rst.getString("nome"));
            lista.add(cat);
        }
        fecharBanco();
        return lista;
    }
    
}

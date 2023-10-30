/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.bean;

import br.com.controle.Categoria;
import br.com.controle.Item;
import br.com.controle.Usuario;
import br.com.entidade.ManterItem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author lucas
 */
public class ServletItem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
                int cat_id = Integer.parseInt(request.getParameter("categoria_id"));
                int sit = 0;

                Item i = new Item();
                i.setNome(nome);
                i.setDescricao(descricao);
                i.setSituacao(sit);
                i.setUsuario(u);

                Categoria c = new Categoria();
                c.setCategoria_id(cat_id);
                i.setCategoria(c);

                //System.out.println( i.getSituacao() + "|" + u.getUsuario_id() + "|" + nome + "|" + descricao + "|" + cat_id);
                ManterItem m = new ManterItem();
                m.inserir(i);

                out.println("<script type='text/javascript'>");
                out.println("alert('Sucesso ao Cadastrar!')");
                out.println("</script>");
                response.sendRedirect("MeusItens.jsp");
            } catch (Exception e) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Erro ao Cadastrar!')");
                out.println("</script>");
                System.out.println("Erro " + e);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServletItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

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
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;

@WebServlet("/ServletItem")
@MultipartConfig(maxFileSize = 16177216)//lembra lucas aceita so 16mbs;
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
            /* TODO output your page here. You may use the following sample code. */
            HttpSession session = (HttpSession) request.getSession();
            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
                int cat_id = Integer.parseInt(request.getParameter("categoria_id"));
                int sit = 0;

                Part filePart = request.getPart("imagem");

                String fileName = getSubmittedFileName(filePart);

                String savePath = getServletContext().getRealPath("/")  + "uploads/" ;

                File directory = new File(savePath);
                if (!directory.exists()) {
                    if (directory.mkdirs()) {
                        System.out.println("Diretório criado com sucesso: " + savePath);
                    } else {
                        System.out.println("Falha ao criar o diretório: " + savePath);
                    }
                }

                String filePath = savePath + File.separator + fileName;

                try (InputStream input = filePart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {
                    int bytesRead;

                    byte[] buffer = new byte[8192];

                    while ((bytesRead = input.read(buffer, 0, 8192)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                } catch(IOException e){
                    System.out.println("Erro durante a operações de arquivo" + e.getMessage());
                }

                String pathString = "http://localhost:8080" + request.getContextPath() + "/uploads/" + fileName;

                System.out.println("Arquivo salvo em: " + filePath);

                Item i = new Item();
                i.setNome(nome);
                i.setDescricao(descricao);
                i.setSituacao(sit);
                i.setUsuario(u);

                Categoria c = new Categoria();
                c.setCategoria_id(cat_id);
                i.setCategoria(c);
                i.setImagem(pathString);

                ManterItem m = new ManterItem();

                if (m.inserir(i)) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Sucesso ao Cadastrar!')");
                    out.println("</script>");
                    System.out.println(i.getImagem());
                    response.sendRedirect("MeusItens.jsp");
                }

            } catch (Exception e) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Erro ao Cadastrar!')");
                out.println("</script>");
                System.out.println("Erro " + e);
            }
        }
    }

    private String getSubmittedFileName(Part part) {
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(content.indexOf('=') + 1)
                          .trim()
                          .replace("\"", "")
                          .substring(content.lastIndexOf('/') + 1)
                          .substring(content.lastIndexOf('\\') + 1);
        }
    }
    return null;
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

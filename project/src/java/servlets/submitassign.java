/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.resultdao;

/**
 *
 * @author Udit
 */
@WebServlet(name = "submitassign", urlPatterns = {"/submitassign"})
@MultipartConfig
public class submitassign extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InputStream inputStream = null;
        Part filePart = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            resultdao rdao= new resultdao();
            String sol=request.getParameter("sol");
            int result_id=Integer.parseInt(request.getParameter("result_id"));
            HttpSession session=request.getSession();
            String sub_name=(String) session.getAttribute("sub_name");
            String sub_code=request.getParameter("sub_code"); 
            
            filePart = request.getPart("myFile");
            
            if(filePart.getSize()==0){
                if(rdao.submitassignment(sol, result_id)){
                    response.sendRedirect("./examples/stuassignment.jsp?sub_code="+sub_code);
                    return;
            }
            }
            else{
                inputStream = filePart.getInputStream();
                
                if(rdao.submitassignment(inputStream, result_id)){
                    response.sendRedirect("./examples/stuassignment.jsp?sub_code="+sub_code);
                    }
            }
            if (filePart != null) {
            // prints out some information for debugging
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
                    
                    
                }
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet submitassign</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet submitassign at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        finally{
            if(inputStream!=null)
               inputStream.close(); 
            if(filePart!=null)
                filePart.delete();
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
        processRequest(request, response);
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
        processRequest(request, response);
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

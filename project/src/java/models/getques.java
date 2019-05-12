/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.assignment;

/**
 *
 * @author Udit
 */
@WebServlet(name = "getques", urlPatterns = {"/getques"})
public class getques extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int y=Integer.parseInt(request.getParameter("year"));
            String sub_code= request.getParameter("sub_code");
            assignmentdao adao=new assignmentdao();
            ArrayList<assignment> asmnt=adao.getSubAsgnmnt(sub_code, y);
            
            out.print("<div class='col-md-12'>"+
                                "<div class='card  card-plain'>"+
                                
                                "<div class='card-body'>"+
                                "<div class=''>"+
                                "<table class='table tablesorter ' id=''>"+
                                "<thead class=' text-primary'>"+
                                "<tr>"+
                                "<th class='text-center'><font color='#febb36'>"+
                                "Questions</font>"+
                                "</th>"+
                                
                                "</tr>"+
                                "</thead>"+
                                "<tbody>"); 
            for(int i=0;i<asmnt.size();++i){
                
               out.print("<tr>"+
                                    "<td class='text-center' style='color:whitesmoke;'>"+
                                    "<p id='q"+i+"' onclick='putinbox("+i+")'>"+asmnt.get(i).getQues() +"</p>"+
                                    "</td>"+
                                    "</tr>"+
                       "<p id='e"+i+"' hidden >"+asmnt.get(i).getExpec_sol()+"</p"
               );
            }
            out.print("</tbody></table>"+
                                "</div>"+
                                "</div>"+
                                "</div>"+
                                 "</div>");
                            }
            //System.out.print(request.getParameter("year"));
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet getques</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getques at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        
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

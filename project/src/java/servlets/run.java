/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Udit
 */
@WebServlet(name = "run", urlPatterns = {"/run"})
public class run extends HttpServlet {

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
        try{
    		
    	    //create a temp file
    	    //File temp = File.createTempFile("tempfile", ".cpp"); 
            File file = new File("testFile1.cpp");
	    //write it
            System.out.println("Temp file : " + file.getAbsolutePath());
    		
		//Get tempropary file path
            String absolutePath = file.getAbsolutePath();
            String tempFilePath = absolutePath.
            substring(0,absolutePath.lastIndexOf(File.separator));
            System.out.println("Temp file path : " + tempFilePath);
    	    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
            bw.write(request.getParameter("sol"));
    	    bw.close();
            System.out.println("Done");
            Runtime runtime = Runtime.getRuntime();
            String[] s = new String[] {"C:\\Program Files (x86)\\Dev-Cpp\\devcpp.exe", absolutePath};
            Process p=runtime.exec(s);
            //file.deleteOnExit();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet run</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+"Your Code is currently running on Dev CPP. Compile,Run and Submit accordingly." + "</h1>");
            out.print("<h3>After compiling and running successfully,Click <a href='./modifyandsubmit'>here </a></h3>"
                    + " </button>");
            out.println("</body>");
            out.println("</html>");
            HttpSession session= request.getSession();
            session.setAttribute("p", p);
            // p.destroy();
            
                         
    	}catch(IOException e){
               e.printStackTrace();
               response.sendRedirect("./examples/err.jsp");

    		
    	}
    	
        
//getting Runtime object
        

            
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

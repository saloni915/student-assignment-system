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
import java.io.PrintWriter;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;
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
@WebServlet(name = "modifyandsubmit", urlPatterns = {"/modifyandsubmit"})
public class modifyandsubmit extends HttpServlet {

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
            HttpSession session= request.getSession();
            Process p=(Process) session.getAttribute("p");
            p.destroy();
            String str,ans="";
            BufferedReader br = new BufferedReader(new FileReader("testFile1.cpp")); 
            while((str = br.readLine()) != null) {
                ans+=str;
                ans+="\n";
                System.out.println(str);
            } 
            br.close();
            Integer assign_id=(Integer) session.getAttribute("assign_id");
            session.setAttribute("ans", ans);
            /*File file = new File("testFile1.cpp");
            boolean exists = file.exists(); 
        if(exists == true) 
        { 
            // printing the permissions associated with the file 
            System.out.println("Executable: " + file.canExecute()); 
            System.out.println("Readable: " + file.canRead()); 
            System.out.println("Writable: "+ file.canWrite()); 
        } 
        else
        { 
            System.out.println("File not found."); 
        } */
            
            try
        { 
            Files.deleteIfExists(Paths.get("C:\\Users\\DELL\\AppData\\Roaming\\NetBeans\\8.0.2\\config\\GF_4.1\\domain1\\config\\testFile1.cpp")); 
        } 
        catch(NoSuchFileException e) 
        { 
            System.out.println("No such file/directory exists"); 
        } 
        catch(DirectoryNotEmptyException e) 
        { 
            System.out.println("Directory is not empty."); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Invalid permissions."); 
            System.out.println(e);             
        } 
          
        System.out.println("Deletion successful."); 
                response.sendRedirect("examples/stustudentpersonal.jsp?assign_id="+assign_id);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet modifyandsubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet modifyandsubmit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

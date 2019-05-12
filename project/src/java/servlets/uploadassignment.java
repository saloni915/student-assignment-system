/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.assignmentdao;
import models.resultdao;
import models.studentdao;
import pojo.student;

/**
 *
 * @author Udit
 */
@WebServlet(name = "uploadassignment", urlPatterns = {"/uploadassignment"})
public class uploadassignment extends HttpServlet {

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
            String res = request.getParameter("res");
            String sub_code= request.getParameter("sub_code");
            String sub_name= request.getParameter("sub_name");
            int assign_no=Integer.parseInt(request.getParameter("assign_no"));
            int week_no=Integer.parseInt(request.getParameter("week_no"));
            String due=request.getParameter("duedate");
            
            assignmentdao adao= new assignmentdao();
            String ques=request.getParameter("ques");
            String expec=request.getParameter("expecsol");
            int max_marks=Integer.parseInt(request.getParameter("max_marks"));
            String issue=request.getParameter("issuedate");
            if( adao.uploadassign(week_no,ques,expec,max_marks,issue,due,sub_code) && res.equals("Upload") ){
                
                HttpSession Session= request.getSession();
                int sem=(Integer)Session.getAttribute("sem");
                studentdao sdao= new studentdao();
                Calendar now = Calendar.getInstance(); 
                Integer year=(Integer) now.get(Calendar.YEAR);
                ArrayList<student> st=sdao.getStuBySub(sub_name,year,sem);
                for(int i=0;i<st.size();++i){
                    String regno=sdao.getregno(st.get(i).getSch_no(),sub_code);
                    System.out.println(regno);
                    resultdao rdao=new resultdao();
                    String assign=adao.getAsgnmntID(ques);
                    System.out.println(assign);
                    rdao.insertEntry(regno,assign,sub_code);
                    System.out.println(i);
                }
            
                response.sendRedirect("./examples/subassign.jsp"  );
            }
            if(res.equals("Add")){
                HttpSession Session= request.getSession();
                int sem=(Integer)Session.getAttribute("sem");
                studentdao sdao= new studentdao();
                Calendar now = Calendar.getInstance(); 
                Integer year=(Integer) now.get(Calendar.YEAR);
                ArrayList<student> st=sdao.getStuBySub(sub_name,year,sem);
                for(int i=0;i<st.size();++i){
                    String regno=sdao.getregno(st.get(i).getSch_no(),sub_code);
                    System.out.println(regno);
                    resultdao rdao=new resultdao();
                    String assign=adao.getAsgnmntID(ques);
                    System.out.println(assign);
                    rdao.insertEntry(regno,assign,sub_code);
                }
                response.sendRedirect("./examples/uploadassign2.jsp?sub_code="+sub_code+"&assign_no="+(assign_no+1)+"&week_no="+week_no+"&due_date="+due);

                  
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

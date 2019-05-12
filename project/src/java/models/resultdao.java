/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import DBUtil.DBConnection;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import pojo.result;

/**
 *
 * @author Udit
 */
public class resultdao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public int getNumAttempt(String sub_name,int sch_no){
        try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="Select count(A.ques) "
                    + "From student S, faculty F, assignment A, result R, student_has_subject U, subject T "
                    + "Where S.scholar_no = U.sch_no and U.reg_no = R.reg_no and F.id_faculty = T.faculty_id and A.id_assignmnt = R.assignment_id and U.subject_id = R.sub_id and U.subject_id = R.sub_id "
                    + "and R.sub_id = T.id_sub and T.name=? and S.scholar_no=? and R.submitted_sol is NOT null" ;
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, sub_name);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch(Exception e){
            System.out.print(e);
        }
        return 0;
    }
    public int getTotalQues(String sub_name,int sch_no){
        
        try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="Select count(A.ques) "
                    + "From student S, faculty F, assignment A, result R, student_has_subject U, subject T "
                    + "Where S.scholar_no = U.sch_no and U.reg_no = R.reg_no and F.id_faculty = T.faculty_id and A.id_assignmnt = R.assignment_id and U.subject_id = R.sub_id and U.subject_id = R.sub_id "
                    + "and R.sub_id = T.id_sub and T.name=? and S.scholar_no=? " ;
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, sub_name);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch(Exception e){
            System.out.print(e);
        }
        return 0;
        
    }
    public int getTotalMarks(String sub_name,int sch_no){
        try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="Select sum(A.max_marks) "
                    + "From student S, faculty F, assignment A, result R, student_has_subject U, subject T "
                    + "Where S.scholar_no = U.sch_no and U.reg_no = R.reg_no and F.id_faculty = T.faculty_id and A.id_assignmnt = R.assignment_id and U.subject_id = R.sub_id and U.subject_id = R.sub_id "
                    + "and R.sub_id = T.id_sub and T.name=? and S.scholar_no=? " ;
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, sub_name);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch(Exception e){
            System.out.print(e);
        }
        return 0;
        
    }
    public int getMarks(String sub_name,int sch_no){
        try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="Select sum(R.marks) "
                    + "From student S, faculty F, assignment A, result R, student_has_subject U, subject T "
                    + "Where S.scholar_no = U.sch_no and U.reg_no = R.reg_no and F.id_faculty = T.faculty_id and A.id_assignmnt = R.assignment_id and U.subject_id = R.sub_id and U.subject_id = R.sub_id "
                    + "and R.sub_id = T.id_sub and T.name=? and S.scholar_no=? " ;
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, sub_name);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch(Exception e){
            System.out.print(e);
        }
        return 0;
        
    }
    public int getNumEval(String sub_name,int sch_no){
        try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="Select count(R.stats) "
                    + "From student S, faculty F, assignment A, result R, student_has_subject U, subject T "
                    + "Where S.scholar_no = U.sch_no and U.reg_no = R.reg_no and F.id_faculty = T.faculty_id and A.id_assignmnt = R.assignment_id and U.subject_id = R.sub_id and U.subject_id = R.sub_id "
                    + "and R.sub_id = T.id_sub and T.name=? and S.scholar_no=? and R.stats='evaluated' " ;
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, sub_name);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch(Exception e){
            System.out.print(e);
        }
        return 0;
        
    }
    public result getResult(int asmnt_id,int sch_no){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT * from result R,student_has_subject T,student S where R.assignment_id=? and S.scholar_no=? and S.scholar_no=T.sch_no and T.reg_no=R.reg_no";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,asmnt_id);
            ps.setInt(2, sch_no);
            ResultSet rs=ps.executeQuery();
            result r=new result();
            while(rs.next()){
                r.setId(rs.getInt(1));
                r.setReg_no(rs.getString(2));
                r.setAss_id(rs.getInt(3));
                r.setSubmit_sol(rs.getString(4));
                r.setFilesol(rs.getBlob(5));
                r.setSubmit_date(rs.getString(6));
                r.setMarks(rs.getInt(7));
                r.setGrade(rs.getString(8));
                r.setStatus(rs.getString(9));
                r.setSub_id(rs.getString(10));
                
            }
            return r;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public boolean insertmarks(int marks,int res_id){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        String sql="UPDATE result R set marks = ?, stats='evaluated' where id_result=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1, marks);
        ps.setInt(2, res_id);
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
        }
        catch(Exception e) {
            System.out.println(e );
            return false;
            
        }
       
        return false;
        
    }
    public result getSnglStuAsgnmntdetails(int assign_id,int loginid){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT distinct R.submission_date,R.stats,R.submitted_sol from result R,assignment A,student_has_subject T WHERE A.id_assignmnt=? AND T.sch_no=? and A.id_assignmnt=R.assignment_id and T.reg_no=R.reg_no";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,assign_id);
            
            ps.setInt(2,loginid);
            ResultSet rs=ps.executeQuery();
            //ArrayList<result> rslt= new ArrayList();
            result rst=new result();
            while(rs.next()){
                
                
                
                rst.setSubmit_date(rs.getString(2));
                rst.setStatus(rs.getString(3));
                rst.setSubmit_sol(rs.getString(4));
                
               
                //rslt.add(rst);
            }
            return rst;
             }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public boolean submitassignment(String sol,int res_id){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        
        String sql="UPDATE result R set submitted_sol = ?,submission_date=? where id_result=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, sol);
        ps.setDate(2, date);
        ps.setInt(3, res_id);
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
        }
        catch(Exception e) {
            System.out.println(e );
            return false;
            
        }
       
        return false;
        
    }
    public boolean insertEntry( String regno, String assign_id, String sub_code){
             try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        String sql="INSERT INTO result (id_result, reg_no, assignment_id,submitted_sol,submission_date,marks,grade,stats ,sub_id) VALUES (NULL, ?, ?, NULL, NULL, NULL, NULL,'not evaluated',?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, regno);
        ps.setString(2, assign_id);
        ps.setString(3, sub_code);
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
        }
        catch(Exception e) {
            System.out.println(e );
        }
             return false;
    }

    public boolean submitassignment(InputStream inputstream, int result_id) {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        
        String sql="UPDATE result R set pdfSol = ?,submission_date=? where id_result=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setBlob(1, inputstream);
        ps.setDate(2, date);
        ps.setInt(3, result_id);
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
        }
        catch(Exception e) {
            System.out.println(e );
            return false;
            
        }
       
        return false;
        //To change body of generated methods, choose Tools | Templates.
    }
}

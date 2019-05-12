/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import DBUtil.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pojo.assignment;
import pojo.student;
import pojo.subject;

/**
 *
 * @author Udit
 */
public class assignmentdao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public ArrayList<assignment> getSubAsgnmnt(String sub_id,int year){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT ques,max_marks,issue_date,due_date,id_assignmnt,week_no,expec_sol from assignment where sub_id=? and year(issue_date)=? order by week_no DESC";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,sub_id);
            ps.setInt(2,year);
            ResultSet rs=ps.executeQuery();
            ArrayList<assignment> assmnt= new ArrayList();
            while(rs.next()){
                assignment asg=new assignment();
                asg.setQues(rs.getString(1));
                asg.setMax_marks(rs.getInt(2));
                asg.setIssue_date(rs.getString(3));
                asg.setDue_date(rs.getString(4));
                asg.setId(rs.getInt(5));
                asg.setWeek_no(rs.getInt(6));
                asg.setExpec_sol(rs.getString(7));
                assmnt.add(asg);
                System.out.print(asg.getQues());
            }
            return assmnt;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public assignment getSnglAsgnmnt(int assign_id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT ques,max_marks,issue_date,due_date,id_assignmnt,week_no,expec_sol,sub_id from assignment where id_assignmnt=?";
            PreparedStatement ps=con.prepareStatement(sql);
            
            ps.setInt(1, assign_id);
            ResultSet rs=ps.executeQuery();
            assignment asg=new assignment();
            while(rs.next()){
                
                asg.setQues(rs.getString(1));
                asg.setMax_marks(rs.getInt(2));
                asg.setIssue_date(rs.getString(3));
                asg.setDue_date(rs.getString(4));
                asg.setId(rs.getInt(5));
                asg.setWeek_no(rs.getInt(6));
                asg.setExpec_sol(rs.getString(7));
                asg.setSub_id(rs.getString(8));
            }
            return asg;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }

    public boolean insertassign(int week,String ques,int max_marks,String expec_sol,String issue,String due,int assign_id) {
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        String sql="UPDATE assignment set week_no = ?,ques=?,max_marks=?,expec_sol=?,issue_date=?,due_date=? where id_assignmnt=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1, week);
        ps.setString(2, ques);
        ps.setInt(3,max_marks);
        ps.setString(4, expec_sol);
        ps.setString(5,issue);
        ps.setString(6, due);
        ps.setInt(7, assign_id);
        
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

    public boolean uploadassign(int week, String ques, String expec, int max_marks, String issue, String due, String sub_code) {
             try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DBConnection.getConnection();
        String sql="INSERT INTO assignment (id_assignmnt, week_no, ques, max_marks,expec_sol,issue_date,due_date,sub_id) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1, week);
        ps.setString(2, ques);
        ps.setInt(3,max_marks);
        ps.setString(4, expec);
        ps.setString(5,issue);
        ps.setString(6, due);
        ps.setString(7, sub_code);
        
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
        }
        catch(Exception e) {
            System.out.println(e );
        }
             return false;
    }
     public String getAsgnmntID(String ques){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT id_assignmnt from assignment where ques=? and year(issue_date)=year(CURRENT_DATE)";
            PreparedStatement ps=con.prepareStatement(sql);
            
            ps.setString(1, ques);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                
                return rs.getString(1);
            }
            
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    
}

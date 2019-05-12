/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import pojo.faculty;
import pojo.subject;

/**
 *
 * @author Udit
 */
public class subjectdao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public ArrayList<subject> getsub(String year,int loginid,String sem){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            if(sem.equals("odd"))
                sql="SELECT DISTINCT S.id_sub,S.name,S.sem,S.faculty_id,S.course_id from subject S,student_has_subject T WHERE S.id_sub=T.subject_id and S.sem%2=1 and year(T.reg_date)=? and S.faculty_id=?";
            else
                sql="SELECT DISTINCT S.id_sub,S.name,S.sem,S.faculty_id,S.course_id from subject S,student_has_subject T WHERE S.id_sub=T.subject_id and S.sem%2=0 and year(T.reg_date)=? and S.faculty_id=?";
            //sql="select DISTINCT f.fname from faculty f where id_faculty= ?";
            PreparedStatement ps=con.prepareStatement(sql);
            int year2=Integer.parseInt(year)-2;
            int y=Integer.parseInt(year);
            
           
            ps.setInt(1, y);
            ps.setInt(2,loginid);
            //ps.setInt(1,loginid);
            ResultSet rs=ps.executeQuery();
            ArrayList<subject> sub= new ArrayList();
            int i=0;
            faculty[] fac= new faculty[1];
            while(rs.next()){
                subject s=new subject();
                /*System.out.println(rs.getString(1));
                faculty f=new faculty();
                f.setFname(rs.getString(1));*/
                s.setId(rs.getString(1));
                s.setName(rs.getString(2));
                s.setSem(rs.getInt(3));
                s.setFac_id(rs.getInt(4));
                s.setCourse_id(rs.getInt(5));
                sub.add(s);
                ++i;
            }
            
            return sub;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return null;
        
    }
   
    public ArrayList<subject> getStuSub (int loginid){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="SELECT DISTINCT S.id_sub,S.name,S.sem,S.faculty_id,S.course_id from subject S,student_has_subject T WHERE S.id_sub=T.subject_id and T.sch_no=? order by T.reg_date DESC";
                    
            //sql="select DISTINCT f.fname from faculty f where id_faculty= ?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,loginid);
            //ps.setInt(1,loginid);
            ResultSet rs=ps.executeQuery();
            ArrayList<subject> sub= new ArrayList();
            
            for(int i=0;rs.next() && i<6;++i)
            {
                subject s=new subject();
                
                s.setId(rs.getString(1));
                s.setName(rs.getString(2));
                s.setSem(rs.getInt(3));
                s.setFac_id(rs.getInt(4));
                s.setCourse_id(rs.getInt(5));
                
                sub.add(s);
               
            }
            
            return sub;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return null;
        
    }
    public ArrayList<subject> getCurrSub(int loginid){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql1="",sql2="";
            sql1="SELECT month(reg_date) from student_has_subject order by reg_date DESC";
            Statement st=con.createStatement();
            ResultSet rs1;
            rs1 = st.executeQuery(sql1);
            rs1.next();
            if(rs1.getInt(1)>6)
                sql2="SELECT DISTINCT S.id_sub,S.name,S.sem,S.faculty_id,S.course_id from subject S,student_has_subject T WHERE S.id_sub=T.subject_id and S.sem%2=1 and year(T.reg_date)=year(current_date) and S.faculty_id=?";
            else
                sql2="SELECT DISTINCT S.id_sub,S.name,S.sem,S.faculty_id,S.course_id from subject S,student_has_subject T WHERE S.id_sub=T.subject_id and S.sem%2=0 and year(T.reg_date)=year(current_date) and S.faculty_id=?";
            //sql="select DISTINCT f.fname from faculty f where id_faculty= ?";
            PreparedStatement ps=con.prepareStatement(sql2);
            
            ps.setInt(1,loginid);
            //ps.setInt(1,loginid);
            ResultSet rs=ps.executeQuery();
            ArrayList<subject> sub= new ArrayList();
            
            while(rs.next()){
                subject s=new subject();
                s.setId(rs.getString(1));
                s.setName(rs.getString(2));
                s.setSem(rs.getInt(3));
                s.setFac_id(rs.getInt(4));
                s.setCourse_id(rs.getInt(5));
                sub.add(s);
               
            }
            
            return sub;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return null;
        
    }
    
    public ArrayList<subject> getSemSub(int sem){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="SELECT name,id_sub from subject where sem=?";
            
            PreparedStatement ps=con.prepareStatement(sql);
            
            ps.setInt(1,sem);
            //ps.setInt(1,loginid);
            ResultSet rs=ps.executeQuery();
            ArrayList<subject> sub= new ArrayList();
            
            while(rs.next()){
                subject s=new subject();
                s.setId(rs.getString(2));
                System.out.print(s.getId());
                s.setName(rs.getString(1));
                sub.add(s);
            }
            return sub;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return null;
        
    }
}

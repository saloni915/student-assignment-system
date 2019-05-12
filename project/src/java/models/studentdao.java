package models;
import DBUtil.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import pojo.student;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Udit
 */
public class studentdao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public boolean insert(String name,String email,int scholar_id,String year,String pass,String mobile,String dep_id,String course_id){
     try {
            Connection con=DBConnection.getConnection();
        String sql="insert into student values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        String [] names=name.split(" ");
        ps.setInt(1,scholar_id);
        ps.setString(2,names[0]);
        if(names.length==3){
        ps.setString(3,names[1]);
        ps.setString(4,names[2]);
        }
        else{
            ps.setString(3, null);
            ps.setString(4, names[1]);
        }
        ps.setString(5,mobile);
        ps.setString(6,email);
        ps.setString(7,pass);
        ps.setString(8,year);
        ps.setString(9, dep_id);
        ps.setString(10,course_id);
        int rs=ps.executeUpdate();
        if(rs>0)
        return true;
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return false;
    }
    public ArrayList<student> getStuBySub(String sub_name,int year,int sem){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            int y=year;
            /*if(sem==3)
                y-=1;
            else if(sem==5)
                y-=2;*/
            String sql="SELECT * from student S, student_has_subject T, subject U where S.scholar_no = T.sch_no and U.id_sub = T.subject_id and U.name = ? and YEAR(T.reg_date)=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,sub_name);
            ps.setInt(2, y);
            ResultSet rs=ps.executeQuery();
            ArrayList<student> stu=new ArrayList();
            while(rs.next()){
                student st=new student();
                st.setSch_no(rs.getInt(1));
                st.setFname(rs.getString(2));
                st.setMname(rs.getString(3));
                st.setLname(rs.getString(4));
                stu.add(st);
            }
            return stu;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public student getStuName(int sch_id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT * from student where scholar_no=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,sch_id);
            
            ResultSet rs=ps.executeQuery();
            student stu=new student();
            while(rs.next()){
                
                stu.setSch_no(rs.getInt(1));
                stu.setFname(rs.getString(2));
                stu.setMname(rs.getString(3));
                stu.setLname(rs.getString(4));
                
            }
            return stu;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public student getStuDetails(int sch_id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT * from student where scholar_no=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,sch_id);
            
            ResultSet rs=ps.executeQuery();
            //ArrayList <student> st=new ArrayList();
            student stu=new student();
            while(rs.next()){
                
                stu.setSch_no(rs.getInt(1));
                stu.setFname(rs.getString(2));
                stu.setMname(rs.getString(3));
                stu.setLname(rs.getString(4));
                stu.setMob_no(rs.getLong(5));
                stu.setEmail(rs.getString(6));
                stu.setPassword(rs.getString(7));
                stu.setBatch(rs.getString(8));
                stu.setDep_id(rs.getString(9));
                stu.setCourse_id(rs.getString(10));
               //st.add(stu);
               // System.out.print(stu.getBatch());
            }
            return stu;

        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }

public String getregno(int sch_id,String sub_code){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT reg_no from student_has_subject where sch_no=? and subject_id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,sch_id);
            ps.setString(2, sub_code);
            ResultSet rs=ps.executeQuery();
            //ArrayList <student> st=new ArrayList();
            
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

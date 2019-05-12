/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import DBUtil.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import pojo.course;
import pojo.department;

/**
 *
 * @author Udit
 */
public class coursedao {
    public static course getcourse(String course_id){
        try{
            Connection con=DBConnection.getConnection();
            String sql="Select * from course where id_course="+course_id;
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            course c=new course();
            
            
            while(rs.next()){
                c.setCourse_id(rs.getString(1));
                c.setName(rs.getString(2));
                c.setDep_id(rs.getString(3));
                
                //System.out.print(rs.getString(2));
            }
            return c;
        }
        catch (Exception e){
            System.out.print(e);
        }
        return null;
        
    }
    public static ArrayList<course> getall(String dep_id){
        try{
            Connection con=DBConnection.getConnection();
            String sql="Select * from course where id_department="+dep_id;
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            ArrayList<course> dep=new ArrayList();
            
            
            while(rs.next()){
                course d=new course();
                d.setCourse_id(rs.getString(1));
                d.setName(rs.getString(2));
                d.setDep_id(dep_id);
                dep.add(d);
                //System.out.print(rs.getString(2));
            }
            return dep;
        }
        catch (Exception e){
            System.out.print(e);
        }
        return null;
        
    }
}

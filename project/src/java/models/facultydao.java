/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import pojo.faculty;
import DBUtil.*;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author Udit
 */
public class facultydao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public static boolean insert(faculty f) throws SQLException {
        try{
        Connection con=DBConnection.getConnection();
        String sql="insert into faculty values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1,f.getFac_id());
        ps.setString(2,f.getFname());
        ps.setString(3,f.getMname());
        ps.setString(4,f.getLname());
        ps.setString(5,f.getEmail());
        ps.setString(6,f.getPassword());
        ps.setString(7,f.getDesignation());
        ps.setString(8,f.getDep_id());
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
    public faculty getfacName(int id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            sql="select fname,mname,lname from faculty where id_faculty=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            rs.next();
            faculty fac=new faculty();
            fac.setFname(rs.getString(1));
            fac.setMname(rs.getString(2));
            fac.setLname(rs.getString(3));
            return fac;
        }
        catch(Exception E){
            System.out.print(E);
        }
        return null;
    }
    public faculty getFacDetails(int id_fac){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT * from faculty where id_faculty=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,id_fac);
            /*byte[ ] imgData = null;*/
            ResultSet rs=ps.executeQuery();
            faculty f=new faculty();
            while(rs.next()){
                
                f.setFac_id(rs.getInt(1));
                f.setFname(rs.getString(2));
                f.setMname(rs.getString(3));
                f.setLname(rs.getString(4));
                f.setEmail(rs.getString(5));
                f.setDesignation(rs.getString(7));
                f.setDep_id(rs.getString(8));
                //f.setImage(rs.getBlob(9));
                /*Blob image = rs.getBlob(9);
                imgData = image.getBytes(1,(int)image.length());*/
            }
            return f;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
    public Blob getFacImage(int id_fac){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            
            String sql="SELECT image from faculty where id_faculty=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,id_fac);
           // byte[ ] imgData = null;
            ResultSet rs=ps.executeQuery();
            Blob image=null;
            while(rs.next()){
               image = rs.getBlob(1);
                //imgData = image.getBytes(1,(int)image.length());
            }
            return image;
            }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
}

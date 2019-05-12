/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Udit
 */
public class loginDao {
    String url="jdbc:mysql://localhost:3306/portal";
    
    String uname="root";
    String password="";
    public boolean check(int loginid ,String user,String pass ){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="";
            if(user.equals("student")){
                sql="select fname from student where scholar_no=? and passwrd=?";
            }
            else{
                sql="select fname from faculty where id_faculty=? and passwrd=?";
            }
            
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1, loginid);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return false;
    }
    //public boolean insert()
}

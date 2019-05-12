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
import pojo.department;

/**
 *
 * @author Udit
 */
public class departmentdao {
    public static ArrayList<department> getall(){
        try{
            Connection con=DBConnection.getConnection();
            String sql="Select * from department";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            ArrayList<department> dep=new ArrayList();
            
            
            while(rs.next()){
                department d=new department();
                d.setId(rs.getString(1));
                d.setName(rs.getString(2));
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
    public static department getdep(String dep_id){
        try{
            Connection con=DBConnection.getConnection();
            String sql="Select * from department where id_dep="+dep_id;
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            department dep=new department();
            
            
            while(rs.next()){
                dep.setId(rs.getString(1));
                dep.setName(rs.getString(2));
                
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

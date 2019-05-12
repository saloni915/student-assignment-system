/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import DBUtil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import pojo.student_has_sub;
import java.text.SimpleDateFormat;  
import java.util.Date;
import java.time.LocalDate;

/**
 *
 * @author Udit
 */
public class st_has_subdao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public boolean insert(int sch_no,String sub_id) throws SQLException {
        try{
        Connection con=DBConnection.getConnection();
        String sql="insert into student_has_subject values(current_date,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        Integer sch=sch_no;
        Integer y=year;
        Integer m=month;
        String reg_no=y.toString()+m.toString()+sch.toString();
        System.out.print(reg_no);
        ps.setInt(2,sch_no);
        ps.setString(1,sub_id);
        ps.setString(3,reg_no);
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
      public static boolean get_regdate(int loginid)throws SQLException
      {
        try{
        Connection con=DBConnection.getConnection();
        String sql="select reg_date from student_has_subject where sch_no="+loginid;
        PreparedStatement ps=con.prepareStatement(sql);
        Calendar c = Calendar.getInstance();
        ResultSet rs=ps.executeQuery();
        student_has_sub s=new student_has_sub();
        while(rs.next())
        {
            s.setReg_date(rs.getString(1));
        }
        String x=s.getReg_date();
        System.out.println(x); 
        if(x==null)
            return false;
        else
        {
            String [] dateParts = x.split("-");
            String year = dateParts[0];
            String month = dateParts[1];
            String day = dateParts[2];
            //System.out.println(day+" "+month+" "+year);
            int reg_month=Integer.parseInt(month);
            //System.out.println(reg_month);
            int curr_month = c.get(Calendar.MONTH)+1 ;
            LocalDate date = LocalDate.now();
            //System.out.println("curr_month"+curr_month);
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(x);
            Date t=java.sql.Date.valueOf(date);
            if(reg_month<=curr_month && curr_month<(reg_month+6) || date1.compareTo(t)==0)
            return true;
        }
        }
        catch(Exception e) {
            System.out.println(e);
            return false;
        }
        return false;
       }
}

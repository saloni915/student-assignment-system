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
import java.util.ArrayList;
import pojo.student;
import pojo.today;

/**
 *
 * @author Udit
 */
public class todaydao {
    String url="jdbc:mysql://localhost:3306/portal";
    String uname="root";
    String password="";
    public ArrayList<today> gettodayassign(int login_id){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,uname,password);
            String sql="select S.scholar_no, S.fname,S.mname,S.lname,T.name, T.sem,A.week_no,A.id_assignmnt,T.id_sub FROM student S,subject T,student_has_subject U, result R,assignment A WHERE S.scholar_no=U.sch_no and U.subject_id=T.id_sub and T.faculty_id=? and R.reg_no=U.reg_no and R.sub_id=T.id_sub and A.id_assignmnt=R.assignment_id and R.submission_date=CURRENT_DATE and R.stats='not evaluated' ORDER by T.sem";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,login_id);
            
            ResultSet rs=ps.executeQuery();
            ArrayList<today> t=new ArrayList();
            while(rs.next()){
                today ts=new today();
                ts.setSch_no(rs.getInt(1));
                ts.setFname(rs.getString(2));
                ts.setMname(rs.getString(3));
                ts.setLname(rs.getString(4));
                ts.setSub_name(rs.getString(5));
                ts.setSem(rs.getInt(6));
                ts.setWeek_no(rs.getInt(7));
                ts.setAssign_id(rs.getInt(8));
                ts.setSub_id(rs.getString(9));
                t.add(ts);
            }
            return t;
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return null;
        
    }
}

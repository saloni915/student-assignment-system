/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.sql.Blob;

/**
 *
 * @author Udit
 */
public class result {
    int id;
    String reg_no;
    int ass_id;
    String submit_sol;
    Blob filesol;

    public Blob getFilesol() {
        return filesol;
    }

    public void setFilesol(Blob filesol) {
        this.filesol = filesol;
    }
    String submit_date;
    int marks;
    String grade;
    String status;
    String sub_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReg_no() {
        return reg_no;
    }

    public void setReg_no(String reg_no) {
        this.reg_no = reg_no;
    }

    public int getAss_id() {
        return ass_id;
    }

    public void setAss_id(int ass_id) {
        this.ass_id = ass_id;
    }

    public String getSubmit_sol() {
        return submit_sol;
    }

    public void setSubmit_sol(String submit_sol) {
        this.submit_sol = submit_sol;
    }

    public String getSubmit_date() {
        return submit_date;
    }

    public void setSubmit_date(String submit_date) {
        this.submit_date = submit_date;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSub_id() {
        return sub_id;
    }

    public void setSub_id(String sub_id) {
        this.sub_id = sub_id;
    }
    
}

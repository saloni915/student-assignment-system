<%-- 
    Document   : studentpersonal
    Created on : Nov 29, 2018, 8:32:52 AM
    Author     : Udit
--%>

<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
<%@page import="pojo.result"%>
<%@page import="models.resultdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.assignment"%>
<%@page import="models.assignmentdao"%>
<%@page import="pojo.student"%>
<%@page import="models.studentdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <title>
    Assignment Submission Portal
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="../assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <style>
      .button{
          background-color:cyan;
          color:black;
          cursor:pointer;
      }
      .rcorners1 {
  border-radius: 25px;
  border: 2px solid white;
  padding: 20px; 
  width: 900px;
  height: 270px;  
}
  </style>
</head>

<body class="">
    <%
        if(session.getAttribute("loginid")==null){
            response.sendRedirect("../index_login.html");
        }
        facultydao fdao=new facultydao();
        Integer log=(Integer) session.getAttribute("loginid");
        faculty f=fdao.getfacName(log.intValue());
        %>
  <div class="wrapper">
    <div class="sidebar">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <!--<a href="javascript:void(0)" class="simple-text logo-mini">
            AS
          </a>-->
          <center><a href="javascript:void(0)" class="simple-text logo-normal">
            WELCOME <%=f.getFname()%>
              </a></center>
        </div>
        <ul class="nav">
          <li>
            <a href="./facultydashboard.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <!--<li>
            <a href="./notifications.html">
              <i class="tim-icons icon-bell-55"></i>
              <p>Notifications</p>
            </a>
          </li>-->
          <li class="active">
            <a href="./Assignment.jsp">
              <i class="tim-icons icon-align-center"></i>
              <p>Check Assignment</p>
            </a>
          </li>
          <li>
            <a  href="./mysub.jsp">
              <i class="tim-icons icon-world"></i>
              <p>My Subjects</p>
            </a>
          </li>
          <!--<li>
            <a href="./facpage3.html">
              <i class="tim-icons icon-world"></i>
              <p>Upload Assignment</p>
            </a>
          </li>-->
          <li>
            <a href="./facprofile.jsp">
              <i class="tim-icons icon-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split"></i>
                  <span class="d-lg-none d-md-block">Search</span>
                </button>
              </li>
              <li>
              <a href="./facultydashboard.jsp"  class="btn btn-link" id="search-button"> <img  src="../images/home.png"></a>
               </li> 
              <li class="dropdown nav-item">
                <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="notification d-none d-lg-block d-xl-block"></div>
                  <i class="tim-icons icon-sound-wave"></i>
                  <p class="d-lg-none">
                    Notifications
                  </p>
                </a>
                <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">
                  <li class="nav-link">
                    <a href="#" class="nav-item dropdown-item">Week4 Assignment Has Been Uploaded.</a>
                  </li>
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">You have 5 more assignments.</a>
                  </li>
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">You have not completed one question before deadline</a>
                  </li>
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">Another notification</a>
                  </li>
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">Another one</a>
                  </li>
                </ul>
              </li>
              <li class="dropdown nav-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="photo">
                    <img src="../assets/img/anime3.jpg" alt="Profile Photo">
                  </div>
                  <b class="caret d-none d-lg-block d-xl-block"></b>
                  <p class="d-lg-none">
                    Log out
                  </p>
                </a>
                <ul class="dropdown-menu dropdown-navbar">
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">Profile</a>
                  </li>
                  <li class="nav-link">
                    <a href="javascript:void(0)" class="nav-item dropdown-item">Settings</a>
                  </li>
                  <li class="dropdown-divider"></li>
                  <li class="nav-link">
                    <a href="../logout" class="nav-item dropdown-item">Log out</a>
                  </li>
                </ul>
              </li>
              <li class="separator d-lg-none"></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      
              
                  
              
        
              
          
              
            
                
     <br><br><br><br>
        <div  style="margin-left:350px;" class="rcorners1">
            <%
                String sub_name;
                     
                sub_name=(String) session.getAttribute("sub_name");
                
                int sch_no= Integer.parseInt(request.getParameter("sch_id"));
                studentdao stdao=new studentdao();
                student stu=stdao.getStuName(sch_no);
                String sub_code = (String) session.getAttribute("sub_code");
                session.setAttribute("sch_no", sch_no);
                %>
                <form>  <h3 class="title d-inline"> <font size="4pxs"color="   #bafb25  "><b>Subject Name:</b></font>
                          <input type="text" name="name" STYLE="color: #0f0f0f;width:600px; background-color: #d1fc6c; text-align: center;" value=" ${sub_name}"disabled>
                          <input type="text" name="name" STYLE="color: #0f0f0f;width:600px; background-color: #d1fc6c; text-align: center;" value=" ${sub_name}"hidden="">
                        </h3><br><br><br>
                        <h3 class="title d-inline"> <font size="4pxs"color="  #b992fa  "><b>Scholar no:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </b></font>
                        <input type="text" name="scholar_no" STYLE="color: #0f0f0f; background-color: #b992fa; width:150px; text-align: center;" value=" <%=sch_no%>"disabled  ></h3>
                        <input type="text" name="scholar_no" STYLE="color: #0f0f0f; background-color: #b992fa; width:150px; text-align: center;" value=" <%=sch_no%>" hidden=""  ></h3>
                        <h3 class="title d-inline"><font size="4pxs" color="  #e8fd7e   "><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sub Code:</b></font>
                                <input type="text" value="<% out.print(sub_code); %>" name="total" STYLE="color: #0f0f0f; background-color: #e8fd7e ;width:150px; text-align: center; "disabled  ></h3><br><br><br>
                                <input type="text" value="<% out.print(sub_code); %>" name="total" STYLE="color: #0f0f0f; background-color: #e8fd7e ;width:150px; text-align: center; "hidden=""  >

                                <h3 class="title d-inline"><font size="4pxs"color="#82fb9c"><b>Student name:</b></font>
                       <input type="text" name="name" STYLE="color: #0f0f0f; background-color: #82fb9c;width:400px;  text-align: center;" 
                              value=" <%out.print(stu.getFname()+" ");
                        if(stu.getMname()!=null)
                            out.print(stu.getMname()+" ");
                            out.print(stu.getLname());
                        
                            %>"disabled >
                            <input type="text" name="name" STYLE="color: #0f0f0f; background-color: #82fb9c;width:400px;  text-align: center;" 
                              value=" <%out.print(stu.getFname()+" ");
                        if(stu.getMname()!=null)
                            out.print(stu.getMname()+" ");
                            out.print(stu.getLname());
                        
                            %>"hidden="" ></h3><br><br>
                    <!--    <h3 class="title d-inline"><font size="4pxs"color="  #fcb274   "><b>Week no:</b></font>
                        <input type="text" name="weekno" STYLE="color: #0f0f0f; background-color:  #fcb274  ;width:50px;  " >
-->
               </form>
              </div>
     
          <div class="col-lg-6 col-md-12" style="margin-left:350px;">
              <div class="card-body" >
                <div class="table-responsive" style="width:890px;" >
                  <table class="table tablesorter" >
                    <thead class=" text-primary">
                      <tr>
                        <th style="color: #fb25e1 ;">
                          Serial no.
                        </th>
                        <th style="color: #fb25e1;">
                              Questions 
                        </th>
                        <th style="color: #fb25e1; ">
                            Issue date
                        </th>
                        <th style="color: #fb25e1 ">
                          Due date
                        </th>
                        <th style="color: #fb25e1; ">
                          Submission date
                        </th>
                        <th class="text-center" style="color: #fb25e1;">
                          Total Marks
                        </th>
                        <th style="color: #fb25e1 ;">
                            Evaluated
                        </th>
                        <th style="color: #fb25e1;">
                          Marks obtained
                        </th>
                        
                        
                  </tr>
                    </thead>
                    <tbody>
                        <%
                            
assignmentdao adao = new assignmentdao();
String year = (String) session.getAttribute("year");
ArrayList < assignment > asmnt = adao.getSubAsgnmnt(sub_code,Integer.parseInt(year));
resultdao rdao= new resultdao();
int sum=0;int tsum=0;
for (int i = 0; i < asmnt.size(); ++i) {
result r=rdao.getResult(asmnt.get(i).getId(),sch_no);       
 sum+=r.getMarks();
 tsum+=asmnt.get(i).getMax_marks();
 out.print("<tr style='color: #1ffc86;'>" +
  "<td style='color: #1ffc86;'>" +
  (i + 1) + ")" +
  "</td>" +
  "<td style='color: #1ffc86;'> <a href='submitassignfac.jsp?assign_id="+asmnt.get(i).getId()+"'>" +
  asmnt.get(i).getQues() +
  "</a> <br> </td>" +
  "<td  style='width:100px;'>" +
  asmnt.get(i).getIssue_date() +
  "</td>" +
  "<td style='width:100px;'>" +
  asmnt.get(i).getDue_date() +
  "</td>" +
  "<td>"); 
 if(r.getSubmit_date()!=null)
   out.print(r.getSubmit_date());
 else
     out.print("Not submitted yet");

  out.print("</td>" +
  "<td class='text-center'>" +
  asmnt.get(i).getMax_marks() +
  "</td>" +

  "<td>" +
  " <div class='form-check'>" +
  "<label class='form-check-label'>" +
  "<input class='form-check-input' type='checkbox' value='true'");
 if(r.getStatus()!=null && r.getStatus().equals("evaluated"))
     out.print("checked=''");
out.print("><span class='form-check-sign'>" +
  "<span class='check'></span>" +
  "</span>" +
  "</label>" +
  "</div>" +
  "</td>" +

  "<td>" +
  r.getMarks() +
  "</td>" +


  "</tr>");
}
                            %>
                      
                     
                         
                          
                        
                       
                        
                        
                       </tbody>
                  </table>
                </div>
              </div>
            </div>
                            <h3 class="title d-inline" style="margin-left:880px;"><font size="4pxs" color="#e8fd7e"><b>
                                Grand Total:</b></font>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="total" value="<%=tsum%>" STYLE="color: #0f0f0f; background-color: #e8fd7e ;width:50px;text-align: center;  " disabled="" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="totali" value="<%=sum%>" STYLE="color: #0f0f0f; background-color: #e8fd7e ;width:50px;text-align: center;  " disabled="" ></h3><br><br><br>
         
      <footer class="footer">
        <div class="container-fluid"  >
            
          <div class="copyright" style="margin-left:-175px;">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script> made by
            <a href="javascript:void(0)" target="_blank">Ayush Gupta and Saloni Madhan</a> MCA II Yr .
          </div>
        </div>
      </footer>
</div>
  </div>    
  
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/black-dashboard.min.js?v=1.0.0"></script>
  <!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  
</body>

</html>


<%-- 
    Document   : studentrecords
    Created on : Nov 28, 2018, 7:39:26 AM
    Author     : Udit
--%>

<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
<%@page import="models.resultdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.student"%>
<%@page import="java.lang.String"%>
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
        <div class="card-body" >
            <!--    <div class="table-full-width table-responsive">
                  <table class="table" width="300%">
                    <tbody>
                        <tr>
                            
                      
                       
                        
                          
                        
                      
                       <td>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="form-check-input" type="checkbox" value="">
                              <span class="form-check-sign">
                                <span class="check"></span>
                              </span>
                            </label>
                          </div>
                        </td>
                        <td>
                          <p class="title">Release v2.0.0</p>
                          <p class="text-muted">Ra Ave SW, Seattle, WA 98116, SUA 11:19 AM</p>
                        </td>
                        <td class="td-actions text-right">
                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
                            <i class="tim-icons icon-pencil"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="form-check-input" type="checkbox" value="">
                              <span class="form-check-sign">
                                <span class="check"></span>
                              </span>
                            </label>
                          </div>
                        </td>
                        <td>
                          <p class="title">Export the processed files</p>
                          <p class="text-muted">The report also shows that consumers will not easily forgive a company once a breach exposing their personal data occurs. </p>
                        </td>
                        <td class="td-actions text-right">
                          <button type="button" rel="tooltip" title="" class="btn btn-link" data-original-title="Edit Task">
                            <i class="tim-icons icon-pencil"></i>
                          </button>
                        </td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>-->
          <div class="col-lg-6 col-md-12" style="margin-left:350px;margin-right:1px;">
            <div class="card "style="width:900px;">
              <div class="card-header">
                  <h6 class="card-title"><font size="6pxs" color=" #10f509"><b><center>Students records</b></center></font></h6>
                  <form> <h3 class="title d-inline"><font size="5pxs"color="  #a8fbe5  "><b>Subject Name:</b></font>
                        <input type="text" name="Subname" STYLE="color: #0f0f0f;width:400px; background-color: #a8fbe5; text-align:center;" value="<% 
                                   String sub_name=request.getParameter("sub_name");
                                   out.print(sub_name);
                                   session.setAttribute("sub_name", sub_name);
                                   session.removeAttribute("sch_no");
                                   %>" disabled >
               </h3>
               &nbsp; &nbsp; &nbsp;
                  <h3 class="title d-inline"><font size="5pxs"color="  #a8fbe5  "><b>Sub Code:</b></font>
                        <input type="text" name="Subname" STYLE="color: #0f0f0f;width:120px; text-align:center; background-color: #a8fbe5;" value="<% 
                                   String sub_code=request.getParameter("sub_code");
                                   out.print(sub_code);
                                   session.setAttribute("sub_code", sub_code);
                                   %>" disabled >
               </h3></form>
              </div>
              <div class="card-body" >
                <div class="table-responsive" style="width:890px;" >
                  <table class="table tablesorter" >
                    <thead class=" text-primary">
                      <tr>
                    
                        <th style="color:#fde025;">
                            
                          Scholar Number
                        </th>
                        <th style="color:#fde025;">
                          Student <br>Name
                        </th>
                        
                       
                        <th class="text-center"style="color:#fde025;">
                            Total no. of Questions
                        </th>
                        <th class="text-center"style="color:#fde025;">
                            Total Questions Attempted
                        </th>
                         <th class="text-center"style="color:#fde025;">
                          No of Questions Evaluated
                        </th>
                        <th class='text-center' style="color:#fde025;">
                            Total marks
                        </th>
                        <th class='text-center' style="color:#fde025;">
                            Marks obtained
                        </th>
                  </tr>
                    </thead>
                     <tbody>
                    <%
                        studentdao stdao=new studentdao();
                        String year=request.getParameter("year");
                        int sem=Integer.parseInt(request.getParameter("sem"));
                        int y=Integer.parseInt(year);
                        ArrayList<student> stu=stdao.getStuBySub(sub_name,y,sem);
                        for(int i=0;i<stu.size();++i){
                        out.print("<tr style='color: #1ffc86;'>"
                                
                        +"<td style='color: #1ffc86;'> <a href='studentpersonal.jsp?sch_id="+ stu.get(i).getSch_no()+"'>"
                         + stu.get(i).getSch_no()
                        +"</a> </td>"
                        +"<td >"
                         +   stu.get(i).getFname()+" ");
                        
                        if(stu.get(i).getMname()!=null)
                            out.print(stu.get(i).getMname()+" ");
                            out.print(stu.get(i).getLname()
                        +"</td>");
                        
                        resultdao rdao=new resultdao();
                        int numOfAQ=rdao.getNumAttempt(sub_name, stu.get(i).getSch_no());
                        int totalAQ=rdao.getTotalQues(sub_name, stu.get(i).getSch_no());
                        int totalMarks=rdao.getTotalMarks(sub_name,stu.get(i).getSch_no());
                        int marks=rdao.getMarks(sub_name,stu.get(i).getSch_no());
                        int numOfEval=rdao.getNumEval(sub_name, stu.get(i).getSch_no());
                        out.print( 
                        "<td class='text-center'>"
                        + totalAQ
                        +"</td>"
                        +"<td class='text-center'>"
                        +numOfAQ
                        +"</td>"
                        +"<td class='text-center'>"
                         +numOfEval
                        +"</td>"
                        +"<td class='text-center'>"
                        +totalMarks
                        +"</td>"
                        +"<td class='text-center'>"
                         +marks
                        +"</td>"
                      +"</tr>" );
                        }
                                   %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
          
      <footer class="footer">
        <div class="container-fluid"  >
            
          <div class="copyright" >
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


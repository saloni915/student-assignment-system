<%-- 
    Document   : submitassignfac2
    Created on : Nov 30, 2018, 2:38:00 PM
    Author     : Udit
--%>

<%@page import="pojo.assignment"%>
<%@page import="models.assignmentdao"%>
<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
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
  .myBox {
border: none;
padding: 5px;
font: 24px/36px sans-serif;
width: 800px;
height: 800px;
overflow: scroll;

}

/* Scrollbar styles */
::-webkit-scrollbar {
width: 12px;
height: 12px;
}
::-webkit-scrollbar-track {
border: 1px solid white;
border-radius: 10px;
}

::-webkit-scrollbar-thumb {
//background: yellowgreen; 
border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
background: white; } 
.rcorners1 {
  border-radius: 25px;
  border: 2px solid white;
  padding: 20px; 
  width: 850px;
  height: 250px;  
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
                  WELCOME <%=f.getFname()%></center>
            
          </a>
        </div>
        <ul class="nav">
          <li >
            <a href="./facpage1.html">
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
          <li >
            <a href="./Assignment.jsp">
              <i class="tim-icons icon-align-center"></i>
              <p>Check Assignment</p>
            </a>
          </li>
          
          <li class="active">
            <a  href="./mysub.jsp">
              <i class="tim-icons icon-world"></i>
              <p>My Subjects</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
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
            <%
                String sub_name;
                sub_name=(String) session.getAttribute("sub_name");
                %>
            <a class="navbar-brand" href="javascript:void(0)"><%out.print(sub_name);%></a>
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
              <a href="./dashboard.jsp"  class="btn btn-link" id="search-button"> <img  src="../images/home.png"></a>
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
      </div><br><br>
            <div  style="margin-top:50px;margin-left:350px;">
                <div class="rcorners1">
                <%
                   int assign_id=Integer.parseInt(request.getParameter("assign_id"));
                    
                    assignmentdao adao= new assignmentdao();

                    assignment a= adao.getSnglAsgnmnt(assign_id);
                    
                    %>
             <form action="../insertassign" id="question">
                  <h3 class="title d-inline"><font size="5pxs"color=" #ba6bfc ">Week no:&nbsp;&nbsp;</font>
                        <input type="text" value="<% out.print(a.getWeek_no()); %>" name="weekno" STYLE="text-align: center; color: #0f0f0f;width:50px; background-color:#f3d4fc;font-weight: bold;" >
                  </h3><br><br><br>
                  <h3 class="title d-inline"><font size="5pxs"color=" #fdbd61 ">Issue Date:&nbsp;&nbsp;</font>
                     <input type="text" name="issuedate" value="<%=a.getIssue_date() %>" STYLE="text-align: center;color: #0f0f0f;width:200px; background-color:#f3d4fc;font-weight: bold;">
                  </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <h3 class="title d-inline"><font size="5pxs"color="  #ba6bfc  ">Due Date:&nbsp;&nbsp;</font>
                        <input type="text   " name="duedate" value="<%=(a.getDue_date()) %>"STYLE="text-align: center;color: #0f0f0f;width:200px; background-color:#f3d4fc;font-weight: bold;"  >
                  </h3><br><br><br>
                  
                  <h3 class="title d-inline"><font size="5pxs"color=" #fdbd61 ">Max_Marks:&nbsp;&nbsp;</font>
                     <input type="text" name="max_marks" value="<%=a.getMax_marks() %>" STYLE="text-align: center;color: #0f0f0f;width:50px; background-color:#f3d4fc;font-weight: bold;"  >
                  </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <h3 class="title d-inline"><font size="5pxs"color="  #ba6bfc  ">Sub Code:&nbsp;&nbsp;</font>
                        <input type="text   " name="sub_code" value="<%=(a.getSub_id()) %>"STYLE="text-align: center;color: #0f0f0f;width:120px; background-color:#f3d4fc;font-weight: bold;">
                  </h3></div>
                  <br><br><br>
                  <h3 class="title d-inline">
                       
                           <font size="5pxs"color="  #c0fd55  ">Question:<br>  </font>
                        <font size="4pxs">
                        <textarea rows="6" cols="90" name="ques" form="question"  style="background-color:black; color:whitesmoke;"  ><%= a.getQues() %></textarea><br><br></font>
                         
                      <!--   <input type="text" name="question" value="<%= a.getQues() %>" hidden>
                         <input type="text" name="expecsol" value="<%= a %>" hidden>-->
                        <font size="5pxs"color="  #55aefd  ">Expected Solution:</font> <br>
                        <div class="myBox">
                        <textarea rows="100" cols="80" name="expecsol" form="question" style="background-color:black;color:whitesmoke;"><%= a.getExpec_sol() %></textarea></div>
                  </h3>    
                      <br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      
                      <input type="text" name="assign_id" value="<%= assign_id %>" hidden>
                      
                      <h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" value="Update"  style="margin-left:130px; height:40px; " >
                     </h3>
                      
                      
             </form>
                      <br><br>
                      
                   
            </div>
   
    
                        
                       
                      
                       
                      
                        
              
                        
                      
                        
                          
                        
                      
                        
      <footer class="footer">
        <div class="container-fluid" style=" ">
            
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


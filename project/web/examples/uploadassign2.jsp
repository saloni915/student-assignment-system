<%-- 
    Document   : submitassignfac2
    Created on : Nov 30, 2018, 2:38:00 PM
    Author     : Udit
--%>

<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
<%@page import="pojo.assignment"%>
<%@page import="models.assignmentdao"%>
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
      .rcorners2 {
  border-radius: 25px;
  border: 2px solid white;
  padding: 20px; 
  width: 350px;
  height: 200px; 
  
    position: absolute;
    float: right;
    margin-left: 600px;
}
.rcorners3 {
  border-radius: 25px;
  border: 2px solid white;
  padding: 20px; 
  width: 350px;
  height: 300px; 
 
    position: absolute;
    float: right;
    margin-left: 600px;
}
.container {
    height: 100%;
    width: 100%;
    
    position: relative;
   
    //padding-bottom: 30px;   
}
  .myBox {
border: none;
padding: 5px;
font: 24px/36px sans-serif;
width: 600px;
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
background: white;  
}
.rcorners1 {
  border-radius: 25px;
  border: 2px solid white;
  padding: 20px; 
  width: 600px;
  height: 300px;  
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
          <center> <a href="javascript:void(0)" class="simple-text logo-normal">
            WELCOME <%=f.getFname()%>
              </a></center>
        </div>
        <ul class="nav">
          <li >
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
      </div><br><br>
            <div  style="margin-top:50px;margin-left:350px;" class="container" >
                <div class="rcorners1">
                <%
                    String sub_code =request.getParameter("sub_code");
                    String sub_name=(String) session.getAttribute("sub_name");
                    String assign_no =request.getParameter("assign_no");
                    int week_no=Integer.parseInt(request.getParameter("week_no"));
                    String due=request.getParameter("due_date");
                    %>
             <form action="../uploadassignment" id="question">
                 <div  class="rcorners2">
                        <h3 class="title d-inline"><font color="#2dfce6">Previous years questions</font>
                         <br><br>
                         <font color="#febb36">Year:</font>
                           <input type="year" onchange="getquest()" name="year" style="width:100px;background-color:#f3d4fc; text-align:center; ">
                          
                        </h3><br><br>
                     
                  </div>
                 <h3 class="title d-inline"><font size="5pxs"color=" #ba6bfc ">SUBJECT:&nbsp;&nbsp;</font>
                        <input type="text" name="sub_name" value="<%=sub_name%>" STYLE="color: #0f0f0f;width:500px; background-color:#f3d4fc;font-weight: bold;text-align: center; " >
                 </h3><br><br><br>
                  
                 <h3 class="title d-inline"><font size="5pxs"color=" #fdbd61 "></font></h3>
                     <input type="text" name="week_no" value="<%=week_no %>" STYLE="text-align: center;color: #0f0f0f;width:50px; background-color:#f3d4fc;font-weight: bold;" hidden >
                  <h3 class="title d-inline"><font size="5pxs"color="  #fdbd61 ">Assignment No:&nbsp;&nbsp;</font>
                        <input type="text" value="<%=assign_no%>" name="assign_no" STYLE="text-align: center; color: #0f0f0f;width:50px; background-color:#f3d4fc;font-weight: bold;" >
                  </h3>
                 
                  <h3 class="title d-inline"><font size="5pxs"color=" #fdbd61  ">Sub Code:&nbsp;&nbsp;</font>
                        <input type="text   " name="sub_code" value="<%=sub_code%>"STYLE="text-align: center;color: #0f0f0f;width:120px; background-color:#f3d4fc;font-weight: bold;" >
                  </h3>
                  <br><br><br>
                  <h3 class="title d-inline"><font size="5pxs"color=" #ba6bfc">Max_Marks:&nbsp;&nbsp;</font>
                     <input type="text" name="max_marks" value="" STYLE="text-align: center;color: #0f0f0f;width:50px; background-color:#f3d4fc;font-weight: bold;" >
                  </h3>
                  
                  <h3 class="title d-inline"><font size="5pxs"color="#ba6bfc  ">&nbsp;&nbsp;</font>
                      <input type="date" name="duedate" value="<%=due %>" STYLE="text-align: center;color: #0f0f0f;width:200px; background-color:#f3d4fc;font-weight: bold;" hidden  >
                  </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
                  <h3 class="title d-inline"><font size="5pxs"color="   #fdbd61  ">&nbsp;&nbsp;</font>
                        <input type="date" name="issuedate" value="<%=java.time.LocalDate.now()%>" STYLE="text-align: center;color: #0f0f0f;width:200px; background-color:#f3d4fc;font-weight: bold;" hidden  >
                  </h3><br><br><br>
                  <div class="rcorners3">
                      <h3 class="title d-inline"><font color="white">You can select any one from questions below: </font></h3>
                      <div id="ques">
                          
                      </div>
                  </div>
                  
                  <br><br>
                  <h3 class="title d-inline">
                       
                           <font size="5pxs"color="  #c0fd55  ">Question:<br>  </font>
                        <font size="4pxs">
                        <textarea rows="6" cols="62" name="ques" form="question"  style="background-color:black; color:whitesmoke;"  ></textarea><br><br></font>
                         
                     
                        <font size="5pxs"color="  #55aefd  ">Expected Solution:</font> <br>
                        <div class="myBox">
                        <textarea rows="100" cols="50" name="expecsol" form="question" style="background-color:black;color:whitesmoke;"></textarea></div>
                  </h3>    
                      <br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      
                     <h3>
                      <input type="submit" value="Add" name="res"  style=" height:40px; " >
<input type="submit" value="Upload" name="res" style="margin-left:390px; height:40px; " >
                     </h3>
                      
                      
             </form>
                </div>
                      
                      
                   
            </div>
   
    
                        
                       
                      
                       
                      
                        
              
                        
                      
                        
                          
                        
                      
                        
      <footer class="footer">
        <div class="container-fluid" style="margin-top: 980px; ">
            
          <div class="copyright" style="">
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
  <script>
                    //alert("hello");
                    var ajaxreq=new XMLHttpRequest();
                    
                    function getquest(){
                    var y=document.getElementsByName("year")[0].value;
                    var s_c=document.getElementsByName("sub_code")[0].value;
                    ajaxreq.onreadystatechange=processResponse;
                     var reqStr="../getques?year="+y+"&sub_code="+s_c;
                     ajaxreq.open("GET",reqStr,true);
                     ajaxreq.send(null);
                     
                    }
                    function processResponse(){
                        if(ajaxreq.readyState===4){
                                    var resp=ajaxreq.responseText;
                                    var t = document.getElementById("ques");
                                    t.innerHTML=resp;
                                    
                                }
                    }
                    
                    function putinbox(i){
                        var name='q'+i;
                        var expec='e'+i;
                        var src=document.getElementById(name).innerHTML;
                        var dest=document.getElementsByName("ques")[0];
                        var src2=document.getElementById(expec).innerHTML;
                        var dest2=document.getElementsByName("expecsol")[0];
                        dest.value=src;
                        dest2.value=src2;
                    }
                    
                </script> 
 
  
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


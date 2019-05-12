<%-- 
    Document   : facultydashboard
    Created on : Jan 2, 2019, 11:22:29 PM
    Author     : saloni
--%>

<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
<%@page import="pojo.today"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.todaydao"%>
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
          background-color: #fdf271;
          color:  #000206 ;
          cursor:pointer;
          font-size: 12px;
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
          <li class="active">
            <a href="./facultydashboard.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
         <!-- <li>
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
          
          <li>
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
      </div>
      <!-- End Navbar -->
      <br><br><br><br>
          <h6 class="card-title" style="text-decoration:underline; margin-left:165px; "><font size="6pxs" color="#98FF2E"><b><center>Today's  &nbsp; Submissions</b></center></font></h6>
      <% 
      	Integer login_id=(Integer) session.getAttribute("loginid");
                            todaydao tdao=new todaydao();
                            int i=0;
                            ArrayList<today> t= tdao.gettodayassign(login_id.intValue());
                            if(t.size()==0)
                                out.print("<h2 style='margin-left:500px; margin-top:150px;' >No assignment submissions for today !!!</h2>");
                            else{
          			out.print("<div class='col-lg-8 col-md-6' style='margin-left:350px;margin-right:1px;'>"+
            					"<div class='card' style='width:900px;'>"+
              					"<div class='card-header'>"+
              						"<h3 class='title d-inline'><font size='4pxs'color=whitesmoke><b>Subject:</b></font>"+
                        "&nbsp; &nbsp;&nbsp; &nbsp;<input type='text' name='Subname' STYLE='color: #000206;width:400px; background-color:#c7effe; text-align:center;' value='"+t.get(i).getSub_name() +"'disabled>"+
                        "&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;"+
                  "<h3 class='title d-inline'><font size='4pxs' color=white><b>Sem:</b></font>"+
                        "&nbsp; &nbsp;&nbsp; &nbsp;<input type='text' name='sem' STYLE='color: #000206;width:45px; text-align:center; background-color:#c7effe;' value='"+t.get(i).getSem() +"'disabled>"+
               "</h3>"+
              "</div><br>"+
                                        "<div class='card-body' >"+
                                        "<div class='table-responsive' style='width:890px;' >"+
                                        "<table class='table tablesorter' >"+
                                        "<thead class='text-primary'>"+
                                        "<tr>"+
                                        "<th class='text-center' style='color: #fdf271;'>"+
                                         "Scholar Number"+
                                        "</th>"+
                                        "<th class='text-center' style='color:  #fdf271;'>"+
                          "Student Name"+
                                        "</th>"+
                        
                        "<th class='text-center' style='color:  #fdf271 ;'>"+
                          "Week No."+
                        "</th>"+
                  "</tr>"+
                    "</thead>"+
                    "<tbody>");
                        while(i<t.size()&&t.get(i).getSem()==t.get(0).getSem()){
                                out.print("<tr>"+
                                "<td class='text-center'>"+
                                t.get(i).getSch_no()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getFname()+" ");
                                if(t.get(i).getMname()!=null)
                                    out.print(t.get(i).getMname()+" ");
                                    out.print(t.get(i).getLname()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getWeek_no()+
                                "</td>"+
                                "<td>"+
                                "<a href='./submitassignfac.jsp?sch_id="+t.get(i).getSch_no()+"&assign_id="+t.get(i).getAssign_id()+"&sub_id="+t.get(i).getSub_id()+"' ><button class='button' style=''>"+
                                "<b style='color:maroon;'> EVALUATE</b>"+
                                "</button></a>"+
                                "</td>"+
                                "</tr>");
                                    ++i;
                            }
                        out.print("</tbody>"+
                  "</table>"+
                "</div>"+
              "</div>"+
            "</div>"+
          "</div>");
                    }
                           while(i<t.size()){
                               int j;
                               out.print("<br><br><div class='col-lg-6 col-md-12' style='margin-left:350px;margin-right:1px;'>"+
            					"<div class='card' style='width:900px;'>"+
              					"<div class='card-header'>"+
              						"<h3 class='title d-inline'><font size='4pxs'color=white><b>Subject:</b></font>"+
                        "&nbsp; &nbsp;&nbsp; &nbsp;<input type='text' name='Subname' STYLE='color: #000206;width:400px; background-color:#c7effe; text-align:center;' value='"+t.get(i).getSub_name() +"'>"+
                        "&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;"+
                  "<h3 class='title d-inline'><font size='4pxs' color=white><b>Sem:</b></font>"+
                        "&nbsp; &nbsp;&nbsp; &nbsp;<input type='text' name='sem' STYLE='color: #000206;width:45px; text-align:center; background-color:#c7effe;' value='"+t.get(i).getSem() +"'>"+
               "</h3>"+
              "</div><br>"+
                                        "<div class='card-body' >"+
                                        "<div class='table-responsive' style='width:890px;' >"+
                                        "<table class='table tablesorter' >"+
                                        "<thead class='text-primary'>"+
                                        "<tr>"+
                                        "<th class='text-center' style='color: #fdf271;'>"+
                                         "Scholar Number"+
                                        "</th>"+
                                        "<th class='text-center' style='color:  #fdf271;'>"+
                          "Student Name"+
                                        "</th>"+
                        
                        "<th class='text-center' style='color:  #fdf271 ;'>"+
                          "Week No."+
                        "</th>"+
                  "</tr>"+
                    "</thead>"+
                    "<tbody>");
                        for(j=i;j<(t.size()-1)&&t.get(j).getSem()==t.get(j+1).getSem() ;++i,++j){
                            out.print("<tr>"+
                                "<td class='text-center'>"+
                                t.get(i).getSch_no()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getFname()+" ");
                                if(t.get(i).getMname()!=null)
                                    out.print(t.get(i).getMname()+" ");
                                    out.print(t.get(i).getLname()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getWeek_no()+
                                "</td>"+
                                "<td>"+
                                "<a href='./submitassignfac.jsp?sch_id="+t.get(i).getSch_no()+"&assign_id="+t.get(i).getAssign_id()+"&sub_id="+t.get(i).getSub_id()+"' ><button class='button' style=''>"+
                                "<b style='color:maroon;'> EVALUATE</b>"+
                                "</button></a>"+
                                "</td>"+
                                "</tr>");
                        }
                            if(i==(t.size()-1)){
                                out.print("<tr>"+
                                "<td class='text-center'>"+
                                t.get(i).getSch_no()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getFname()+" ");
                                if(t.get(i).getMname()!=null)
                                    out.print(t.get(i).getMname()+" ");
                                    out.print(t.get(i).getLname()+
                                "</td>"+
                                "<td class='text-center'>"+
                                t.get(i).getWeek_no()+
                                "</td>"+
                                "<td>"+
                                "<a href='./submitassignfac.jsp?sch_id="+t.get(i).getSch_no()+"&assign_id="+t.get(i).getAssign_id()+"&sub_id="+t.get(i).getSub_id()+"' ><button class='button' style=''>"+
                                "<b style='color:maroon;'> EVALUATE</b>"+
                                "</button></a>"+
                                "</td>"+
                                "</tr>");
                            }
                              ++i; 
                           } 
                         out.print("</tbody>"+
                  "</table>"+
                "</div>"+
              "</div>"+
            "</div>"+
          "</div>"); 
                            
                        %>
            
          
        
      <footer class="footer">
        <div class="container-fluid" style="margin-top:80px; ">
            
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


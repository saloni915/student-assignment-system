<%-- 
    Document   : dashboard
    Created on : Oct 24, 2018, 11:41:09 PM
    Author     : Udit
--%>

<%@page import="pojo.student"%>
<%@page import="models.studentdao"%>
<%@page import="pojo.faculty"%>
<%@page import="models.facultydao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.subject"%>
<%@page import="models.subjectdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</head>

<body class="">
    <%
        if(session.getAttribute("loginid")==null){
            response.sendRedirect("../index_login.html");
        }
        studentdao sdao=new studentdao();
        Integer log=(Integer) session.getAttribute("loginid");
        student s=sdao.getStuName(log.intValue());
        %>
        
  <div class="wrapper">
    <div class="sidebar">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
         <!-- <a href="javascript:void(0)" class="simple-text logo-mini">
              <% out.print(s.getFname().charAt(0)+""+ s.getLname().charAt(0)); %>
          </a>-->
              <center><a href="javascript:void(0)" class="simple-text logo-normal">
            WELCOME <%=s.getFname()%>
                  </a></center>
        </div>
        <ul class="nav">
          <li class="active ">
            <a href="./dashboard.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <!--<li>
            <a href="#">
              <i class="tim-icons icon-bell-55"></i>
              <p>Notifications</p>
            </a>
          </li>-->
          <li >
              <a href="../checkregister">
              <i class="tim-icons icon-support-17"></i>
              <p>Register</p>
            </a>
          </li>
          <li>
            <a href="./stuprofile.jsp">
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
            <a class="navbar-brand" href="./dashboard.jsp">Dashboard</a>
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
                    <a href="./stuprofile.jsp" class="nav-item dropdown-item">Edit Profile</a>
                  </li>
                  <li class="nav-link">
                    <a href="./register.jsp" class="nav-item dropdown-item">Register</a>
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
      <div class="content">
          <%
            subjectdao subdao=new subjectdao();
            Integer loginid=(Integer)session.getAttribute("loginid");
            //session.setAttribute("loginid",request.getParameter("loginid"));
            ArrayList<subject> sub=subdao.getStuSub(loginid.intValue());
            if(sub.size()==0){
                out.print(" <h3 style='margin-top:250px; margin-left:150px;'>You Have to first complete your registration for this sem...<br><br><br><br><br><br></h3>");
            }
                out.print("<div class='row'>");
                for(int i=0;i<6 && i<sub.size();++i){
                    out.print("<div class='col-lg-6' >"
                    +"<div class='card card-chart' >"
                    +"<div class='card-header'>"
                    +"<div class='row'>"
                    +"<div class='col-sm-24 '>"
                    +"<h5 class='card-category'><font color='white '> SUB CODE: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;"+
                        sub.get(i).getId()+
                            "</br> Sub Co-ordinator:&nbsp; &nbsp; &nbsp;&nbsp;");
                        facultydao facdao=new facultydao();
                        faculty fac=facdao.getfacName(sub.get(i).getFac_id());
                         out.print(fac.getFname()+" ");
                        
                        if(fac.getMname()!=null)
                            out.print(fac.getMname()+" ");
                            out.print(fac.getLname()
                        );
                      out.print("</font></h5><br><br>"+"<h1 style='color:whitesmoke; text-align:center; margin-left:0px; margin-top:10px;'><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  "+
                            sub.get(i).getName()+"</b></h1>"
                    +"</div>"
                    +"</div>"
                    +"</div>"
                    +"<div class='card-body'>"
                    +"<div class='chart-area' style='text-align:center;'>"
                    +"<font color='white' size='4  px'>   All Assignments of "+
                            sub.get(i).getName()+ " can be viewed from here"
                    +"</font>"
                    +"</div>");
                      if(sub.get(i).getName().length()<=19)
                          out.print("<br><br>"); 
                    out.print(" <form action='stuassignment.jsp' > <input type='text' name='sub_name' hidden value='"+sub.get(i).getName()+"'> <input type='text' name='year' hidden value=''> "
                    + "<input type='text' name='sem' hidden value='"+sub.get(i).getSem()+"'>"
                    + "<input type='text' name='sub_code' hidden value='"+sub.get(i).getId()+"'>"
                    + "<input style='color:white; width:100%; background-color:purple; height: 60px;' type='submit' name='View' value='");
            out.print("CLICK HERE");
            out.print("'> </form> </div></div></div>");
                }
            
            %>
        
          
      </div>
    
      <footer class="footer">
        <div class="container-fluid">
          
          <div class="copyright">
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

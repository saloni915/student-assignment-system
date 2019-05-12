<%-- 
    Document   : subassign
    Created on : Nov 30, 2018, 9:02:28 AM
    Author     : Udit
--%>

<%@page import="pojo.student"%>
<%@page import="models.studentdao"%>
<%@page import="java.util.Calendar"%>
<%@page import="pojo.assignment"%>
<%@page import="pojo.result"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.assignmentdao"%>
<%@page import="models.resultdao"%>
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
</head>

<body class="">
    
  <div class="wrapper">
    <div class="sidebar">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <!--  <a href="javascript:void(0)" class="simple-text logo-mini">
            
          </a>-->
        <center>  <a href="javascript:void(0)" class="simple-text logo-normal">
            WELCOME 
            <%studentdao sdao=new studentdao();
        Integer log=(Integer) session.getAttribute("loginid");
        student st=sdao.getStuName(log.intValue());
        out.print(st.getFname());
        %>
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
            <a href="./notifications.html">
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
              <a class="navbar-brand" href="javascript:void(0)"
                 ><% if(request.getParameter("sub_name")!=null)
                        out.print(request.getParameter("sub_name"));
                      else
                        out.print((String) session.getAttribute("sub_name"));
                  %></a>
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
      </div>
      <!-- End Navbar -->
      
      <%
                            assignmentdao adao = new assignmentdao();
                            resultdao rdao=new resultdao();
                            Integer loginid=(Integer)session.getAttribute("loginid");
                            if(session.getAttribute("sub_name")==null)
                            session.setAttribute("sub_name",request.getParameter("sub_name") );
                            String sub_code= (String) request.getParameter("sub_code");
                            Calendar now = Calendar.getInstance(); 
                            ArrayList <assignment> asmnt = adao.getSubAsgnmnt(sub_code,2019);
                       %>
      <div class="content">
        <div class="row">
            
            
            <br>
            
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                  <h4 class="card-title">This Week (Week <% if(asmnt.size()>0) out.print(asmnt.get(0).getWeek_no()); %>)</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th class='text-center'>
                          Assignment 
                        </th>
                        
                        <th class='text-center'>
                          Issue Date
                        </th>
                        <th class='text-center'>
                          Due Date
                        </th>
                        <th class='text-center'>
                          Submission Date
                        </th>
                        <th class='text-center'>
                          Submitted
                        </th>
                        <th class='text-center'>
                          Evaluated
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                        
                        <%
                        int i=0;
                            for(int k=0;i<asmnt.size() && asmnt.get(k).getWeek_no()==asmnt.get(0).getWeek_no();++k,++i){
                                result r=rdao.getResult(asmnt.get(i).getId(),loginid);
                             out.print("<tr>"+
                                    "<td class='text-center'>"+
                                    "<a href='stustudentpersonal.jsp?assign_id="+asmnt.get(k).getId()+"'> Assignment "+(k+1)+"</a>"+
                                    "</td>"+
                                    "<td class='text-center'>"+
                                    asmnt.get(k).getIssue_date()+
                                    "</td>"+
                                    "<td class='text-center'>"+
                                    asmnt.get(k).getDue_date()+
                                    "</td>"+
                                    "<td class='text-center'>");
                                    if(r.getSubmit_date()!=null)
                                        out.print(r.getSubmit_date());
                                    else
                                        out.print("--");
                                    out.print("</td><td class='text-center'>"+
                                    " <div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getSubmit_date()!=null)
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td><td class='text-center'>"+
                                     "<div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getStatus().equals("evaluated"))
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td></tr>");
         
                                    
                            }
                            %>  
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <%
                          
                            while(i<asmnt.size()){
                                int j;
                                out.print("<div class='col-md-12'>"+
                                "<div class='card  card-plain'>"+
                                "<div class='card-header'>"+
                                "<h4 class='card-title'> Week ");
                                out.print(asmnt.get(i).getWeek_no()+
                                        "</h4>"+
                                "</div>"+
                                "<div class='card-body'>"+
                                "<div class='table-responsive'>"+
                                "<table class='table tablesorter ' id=''>"+
                                "<thead class=' text-primary'>"+
                                "<tr>"+
                                "<th class='text-center'>"+
                                "Assignment"+
                                "</th>"+
         
                                "<th class='text-center'>"+
                                "Issue Date"+
                                "</th>"+
                                "<th class='text-center'>"+
                                "Due Date"+
                                "</th>"+
                                "<th class='text-center'>"+
                                "Submission Date"+
                                "</th>"+ 
                                "<th class='text-center'> Submitted </th>"+
                                "<th class='text-center'>"+
                                "Evaluated"+
                                "</th>"+        
                                "</tr>"+
                                "</thead>"+
                                "<tbody>");   
                                int c=1;
                                for(j=i;j<(asmnt.size()-1) && asmnt.get(j).getWeek_no()==asmnt.get(j+1).getWeek_no();++j,++i,++c){
                                    result r=rdao.getResult(asmnt.get(i).getId(),loginid);
                                    out.print("<tr>"+
                                    "<td class='text-center'>"+
                                    "<a href='stustudentpersonal.jsp?assign_id="+asmnt.get(i).getId()+"'> Assignment "+(c)+"</a>"+
                                    "</td>"+
      
                                    "<td class='text-center'>"+
                                    asmnt.get(i).getIssue_date()+
                                    "</td>"+
                                    "<td class='text-center'>"+
                                    asmnt.get(i).getDue_date()+
                                    "</td>"+
                                   "<td class='text-center'>");
                                    if(r.getSubmit_date()!=null)
                                        out.print(r.getSubmit_date());
                                    else
                                        out.print("--");
                                    out.print("</td><td class='text-center'>"+
                                    " <div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getSubmit_date()!=null)
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td><td class='text-center'>"+
                                     "<div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getStatus().equals("evaluated"))
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td>"+ 
                                    "</tr>");
                                }
                                if(i==(asmnt.size()-1)){
                                    result r=rdao.getResult(asmnt.get(i).getId(),loginid);
                                    out.print("<tr>"+
                                    "<td class='text-center'>"+
                                    "<a href='stustudentpersonal.jsp?assign_id="+asmnt.get(i).getId()+"'> Assignment "+(c)+"</a>"+
                                    "</td>"+
                                    
                                    "<td class='text-center'>"+
                                    asmnt.get(i).getIssue_date()+
                                    "</td>"+
                                    "<td class='text-center'>"+
                                    asmnt.get(i).getDue_date()+
                                    "</td>"+
                                    "<td class='text-center'>");
                                    if(r.getSubmit_date()!=null)
                                        out.print(r.getSubmit_date());
                                    else
                                        out.print("--");
                                    out.print("</td><td class='text-center'>"+
                                    " <div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getSubmit_date()!=null)
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td><td class='text-center'>"+
                                     "<div class='form-check'>" +
                                    "<label class='form-check-label'>" +
                                    "<input class='form-check-input' type='checkbox' value='true'");
                                    if(r.getStatus().equals("evaluated"))
                                            out.print("checked=''");
                                    out.print("><span class='form-check-sign'>" +
                                                "<span class='check'></span>" +
                                                "</span>" +
                                                "</label>" +
                                                "</div>" +
                                                "</td>"+
                                    "</tr>");
                                    ++i;
                                }
                               out.print("</table>"+
                                "</div>"+
                                "</div>"+
                                "</div>"+
                                 "</div>");
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

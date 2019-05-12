<%-- 
    Document   : register
    Created on : Dec 5, 2018, 6:42:21 PM
    Author     : saloni
--%>
<%@page import="pojo.subject"%>
<%@page import="pojo.course"%>
<%@page import="pojo.department"%>
<%@page import="models.coursedao"%>
<%@page import="models.departmentdao"%>
<%@page import="pojo.student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.studentdao"%>
<%@page import=" java.util.Date;"%>
<%@page import="java.util.Calendar;"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
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
       </style>
  
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
          <li >
            <a href="./dashboard.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
         <!-- <li>
            <a href="#">
              <i class="tim-icons icon-bell-55"></i>
              <p>Notifications</p>
            </a>
          </li>-->
          <li class="active ">
            <a href="./register.jsp">
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
      </div><br><br><br>
      <div  style="margin-left:250px;" >
          <%
              Integer loginid=(Integer)session.getAttribute("loginid");
              
              student s=sdao.getStuDetails(loginid.intValue());
              Calendar cal = Calendar.getInstance();
              int month = cal.get(Calendar.MONTH) + 1;
              int year = cal.get(Calendar.YEAR);
              int dom = cal.get(Calendar.DAY_OF_MONTH);
              departmentdao ddao=new departmentdao();
              coursedao cdao=new coursedao();
              department dep= ddao.getdep(s.getDep_id());
              course c= cdao.getcourse(s.getCourse_id());
          %>
          <br><br>
          <h1 style="color:whitesmoke;  text-decoration: underline; ">Student Registration Form</h1>
          <br>
          <br>
                <div  STYLE="margin-left:200px;margin-right:250px;" >
                    <form action="../register">
                        <font style="float:left;color:#74faf6;">Scholar no: </font>      
                        <font style="float:right;color: #74faf6; ">Registration date</font>  <br>  
                        <input class="text" type="text" name="scholarno" placeholder="" value="<%out.print(s.getSch_no());%>" STYLE="width:270px;float:left;text-align:center; " >
                        
                        <input type="text" name="date" value="<%out.print(dom+"/"+month+"/"+year);%>" STYLE="width:270px;float:right;font-weight: bold;"disabled ><br>
                        <br> <br>   
                        <font style="color:#74faf6;">Name:</font>
                        <input type="text" name="name" value=" <%out.print(s.getFname()+" ");
                        if(s.getMname()!=null)
                        out.print(s.getMname()+" ");
                        out.print(s.getLname());
                        
                        %>" STYLE="width:380px;text-align:center; font-weight: bold;" disabled><br>
                        <font style="color:#74faf6;"> Email id:</font>          
                        <input type="email" name="email" placeholder=""value="<%out.print(s.getEmail());%>" STYLE="width:380px;text-align:center;font-weight: bold;"required=""><br>
                        <font style="float:left;color:#74faf6;">Department:</font>      
                        <font style="float:right;color:#74faf6;">Course</font>  <br>  
                        <input type="text" name="dept" value="<%=dep.getName() %> "STYLE="font-weight: bold;width:270px;text-align:center; float:left;" disabled >
                        <input type="text" name="course"value="<%=c.getName() %> " STYLE="width:270px;float:right;font-weight: bold;" disabled><br><br><br>
                        <font style="color:#74faf6;">Batch:</font>          
                        <input type="text" name="batch"value="<%out.print(s.getBatch());%>" STYLE="width:375px;text-align:center;font-weight: bold;"disabled ><br>
                        <font style="color:#74faf6;">Mobile no:</font>          
                        <input type="text" name="mobno" value="<%out.print(s.getMob_no());%>"STYLE="width:375px;text-align:center;font-weight: bold;" disabled><br>
                        <font color="yellow">Enter semester, name of subjects along with there respective subject codes.<br><br></font>
                        <font color="#74faf6" size="3px" >Sem:</font>
                        <input type="text" name="sem" value="<%if(request.getParameter("sem")!=null) out.print(request.getParameter("sem")); %>" onchange="fun()" STYLE="width:50px;font-weight: bold;" ><br>
                        <font color="#74faf6" size="3px">Subject Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subject Name</font><br>
                        
                        <script>
                            var ajaxreq=new XMLHttpRequest();
                                 
                            function fun(){
                                var name=document.getElementsByName("sem")[0].value;
                                 //window.open("../getsubjects?sem="+name,'_top');
                                                                  //ajaxreq.open('post',test.php,TRUE);
                                 //ajaxreq.send(data);
                                 
                                 
                                 
                                 ajaxreq.onreadystatechange=processResponse;
                                 var reqStr="../getsubjects?sem="+name;
                                 ajaxreq.open("GET",reqStr,true);
                                 ajaxreq.send(null);
                        }
                        
                            function processResponse(){
                                if(ajaxreq.readyState==4){
                                    var resp=ajaxreq.responseText;
                                    var t = document.getElementById("tables");
                                    t.innerHTML=resp;
                                    
                                }
                                 
                            }
                            
                            
                            
                            </script>
			
                        <div id="tables">
                            
                        </div>
                        <%  
                          /*      for(int i=4;i<6;++i){
                                   out.print("<input type='text' name='SubCode"+(i+1)+"' value='' STYLE='width:110px;font-weight: bold;float:left;' >"+
                        "<input type='text' name='SubName"+(i+1)+"' value='' STYLE='width:450px;font-weight: bold;float:right;' ><br><br>"); 
                                }
                            */
                        %>
                        <br>
                        <br>
                                  <div class="wthree-text">
						
							<input type="checkbox"  required="">
							 <font style="color:#74faf6;">I Confirm</font>   
						
						<div class="clear"> </div>
					</div>
					<input type="submit" value="REGISTER">
                                        <span id="res"></span>
				
                                        </form>
                        
		</div>
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
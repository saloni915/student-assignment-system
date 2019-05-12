<%-- 
    Document   : stu_signup
    Created on : Oct 25, 2018, 3:39:03 PM
    Author     : Udit
--%>

<%@page import="pojo.course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.departmentdao"%>
<%@page import="pojo.department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"  %>

<!DOCTYPE html>
<html>
    <head>
	<title>Sign up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images2/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor2/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css2/util.css">
	<link rel="stylesheet" type="text/css" href="css2/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #999999;">
	
    
    
	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('images2/login.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form action="./signup" class="login100-form validate-form">
					<span class="login100-form-title p-b-59">
						Student Sign Up
					</span>
                                        <%
                                                departmentdao ddao=new departmentdao();
                                                ArrayList<department> dep= ddao.getall();
                                                ArrayList<course> c=(ArrayList) session.getAttribute("c");
                                                
                                            %>    
                                    
                                             

                                        <div class="wrap-input100 validate-input" data-validate = "Department is required">
                                            <span class="label-input100">Department</span><br><br>
                                            <select style="width:100%; height:40px;" name="dep" onchange="fun()" >
                                                <option >Select Department</option>
                                                <%
                                                for(int i=0;i<dep.size();++i){
                                                    out.print("<option value='"+dep.get(i).getId()+"'");
                                                    if(c!=null && c.get(0).getDep_id().equals(dep.get(i).getId()))
                                                        out.print("selected='' ");
                                                            out.print(">"+dep.get(i).getName()+"</option>"
                                                    );
                                                    
                                                }
                                                %>
                                                
                                                </select>
                                                
                                        </div>
                                                
                              <script type="text/javascript" >
            function fun(){
                var name=document.getElementsByName("dep")[0].value;
                    
                    window.open("./getcourse?dep_id="+name,'_top');
               }
    </script>                  
                                    
                                        <div class="wrap-input100 validate-input" data-validate = "course is required">
                                            <span class="label-input100">Course</span><br><br>
                                            <select style="width:100%; height:40px;" name="course_id">
                                                <option >Select Course</option>
                                                 <%
                                                if(c!=null)
                                                for(int i=0;i<c.size();++i){
                                                    out.print("<option value='"+c.get(i).getCourse_id()+"'>"+c.get(i).getName()+"</option>"
                                                    );
                                                    
                                                }
                                                %>
                                                </select>
                                                
                                        </div>
                                    
					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">Full Name</span>
						<input class="input100" type="text" name="name" placeholder="Name...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="email" placeholder="Email address...">
						<span class="focus-input100"></span>
                                        </div>
                                        <div class="wrap-input100 validate-input" data-validate = "Scholar No is required">
						<span class="label-input100">Scholar Number</span>
						<input class="input100" type="text" name="scholar_no" placeholder="Scholar No...">
						<span class="focus-input100"></span>
                                        </div>
                                        
                                        
                                        <div class="wrap-input100 validate-input" data-validate = "Year is required">
						<span class="label-input100">Year of Admission</span>
						<input class="input100" type="text" name="year" placeholder="Year of Joining...">
						<span class="focus-input100"></span>
                                                
                                        </div>
                                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Mobile no.</span>
						<input class="input100" type="text" name="mobile" placeholder="9876543210">
						<span class="focus-input100"></span>
					</div>
                                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="text" name="pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
                                     

					<div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
						<span class="label-input100">Repeat Password</span>
						<input class="input100" type="text" name="repeat-pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Sign Up
							</button>
						</div>

						<a href="../project/index_login.html" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
							Sign in
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="vendor2/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/bootstrap/js/popper.js"></script>
	<script src="vendor2/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/daterangepicker/moment.min.js"></script>
	<script src="vendor2/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js2/main.js"></script>

</body>
</html>

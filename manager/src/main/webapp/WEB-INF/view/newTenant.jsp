<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/style.css" rel="stylesheet">
	    
	    <script src="js/jquery-1.11.1.min.js"></script>
<!-- 	    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css"> -->
		<link rel="stylesheet" href="bootstrap/css/bootstrap-datepicker3.css"/>	    
	    <link rel="stylesheet" href="bootstrap/css/bootstrap-iso.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />	    
	    <link rel="stylesheet" href="bootstrap/css/bootstrap-select.min.css">
		<script src="bootstrap/js/bootstrap-select.min.js"></script>	    
	    <script type="text/javascript" src="bootstrap/js/bootstrap-datepicker.min.js"></script>
	    	
<!-- 	    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<!-- 		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'> -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'> -->
		
		<!-- 	    Date picker -->
<!-- 	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> -->
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> -->
<!-- 	    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> -->
		

		<!--Font Awesome (added because you use icons in your prepend/append)-->
<!-- 		<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" /> -->
		<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>
	    
		<!-- 	    Drop down -->
<!-- 	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"> -->
	    
		<!-- Latest compiled and minified JavaScript -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script> -->
		
	    
	    
	    <style type="text/css">
	
			.main{
			 	margin-top: 30px;
			}
			
			hr{
				width: 10%;
				color: #fff;
			}
			
			.form-group{
				margin-bottom: 15px;
			}
			
			label{
				margin-bottom: 15px;
			}
			
			input,
			input::-webkit-input-placeholder {
			    font-size: 11px;
			    padding-top: 3px;
			}
			
			.main-login{
			 	background-color: #fff;
			    /* shadows and rounded borders */
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			
			}
			
			.main-center{
			 	margin-top: 30px;
			 	margin: 0 auto;
			 	max-width: 330px;
			    padding: 40px 40px;
			
			}
			
			.login-button{
				margin-top: 5px;
			}
			
			.login-register{
				font-size: 11px;
				text-align: center;
			}
			.err{
				color:red;
			}
			.form-group.required .control-label:after { 
			   content:"*";
			   color:red;
			}
	    </style>
	    
	    	    
		<title>New Tenant</title>
	</head>
	<body>
		<div class="container">
			<section id="logo-section" class="text-center">
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="logo text-center  ">
	                            <h1>${hostelName}</h1>
	                            
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</section>
	
	
			<div class="row main">
				<div class="main-login main-center">
					<form class="form-horizontal" role="form" method="post" action="addTenant.LoRe">
					<span class="err" style="text-align:center;"> ${personStatus }</span>
						<form:input path = "newTenant.bId" type = "hidden" value="${bId }" />
						<form:input path = "newTenant.hostelName" type = "hidden" value = "${hostelName }" />
						<div class="form-group required">
								<form:label path="newTenant.name" for="name" class="cols-sm-2 control-label">Name</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.name" type="text" class="form-control" name="name" id="name" placeholder="Enter Name"/>
								</div>
								<form:errors path="newTenant.name" class="err"/>
							</div>
						</div>

						<div class="form-group required">
							<form:label path="newTenant.autoId">
								<spring:message text="Id"/>
							</form:label>
							<form:hidden path="newTenant.autoId"/>						
							<form:label path="newTenant.mobile" for="username" class="cols-sm-2 control-label">Mobile</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.mobile" type="number" min="7000000000" max="9999999999" class="form-control" name="mobile" id="mobile"  placeholder="9876543210"/>
								</div>
								<form:errors path="newTenant.mobile" class="err"/>
							</div>
						</div>
						
						<div class="form-group">
							<form:label path="newTenant.email" for="email" class="cols-sm-2 control-label">Email</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.email" type="text" class="form-control" name="email" id="email"  placeholder="Enter Email"/>
								</div>
								<form:errors path="newTenant.email" class="err"/>
							</div>
						</div>

						<div class="form-group required">
							<form:label path="newTenant.id" for="id" class="cols-sm-2 control-label">Gov. Id</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-university fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.id" type="text" class="form-control" name="id" id="id"  placeholder="Enter Gov. Id Number"/>
								</div>
								<form:errors path="newTenant.id" class="err"/>
							</div>
						</div>

						<div class="form-group required">
							<form:label path="newTenant.doj" for="confirm" class="cols-sm-2 control-label">Date of Join</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-calendar fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.doj" type="text" class="form-control doj" name="doj" id="doj"  placeholder="Enter Date of Join"/>
								</div>
								<form:errors path="newTenant.doj" class="err"/>
							</div>
						</div>
						
						<div class="form-group">
							<form:label path="newTenant.address" for="name" class="cols-sm-2 control-label">Address</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span>
									<form:textarea path="newTenant.address" type="text" class="form-control" name="address" id="address" placeholder="Enter Address"/>
								</div>
							</div>
						</div>
						
						<div class="form-group required">
							<form:label path="newTenant.room" for="room" class="cols-sm-2 control-label">Room Number</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-building fa" aria-hidden="true"></i></span>
									<form:select path="newTenant.room" class="form-control selectpicker show-menu-arrow show-tick ">
										<form:option value="none">Select Room</form:option>
    									<form:options items="${roomNos}" />
									</form:select>
								</div>
								<form:errors path="newTenant.room" class="err"/>
							</div>
						</div>
						
						<div class="form-group">
							<form:label path="newTenant.amount" for="amount" class="cols-sm-2 control-label">Amount</form:label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-inr fa" aria-hidden="true"></i></span>
									<form:input path="newTenant.amount" type="number" class="form-control" name="amount" id="amount"  placeholder="Enter Amount"/>
								</div>
								<form:errors path="newTenant.amount" class="err"/>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button"><span><b>Add Tenant</b></span></button>
							<button type="reset" class="btn btn-link btn-lg btn-block ">Reset</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		


	<script>
	
		$(document).ready(function(){
			var date_input=$('#doj'); //our date input has the name "date"
			var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
			date_input.datepicker({
				format: 'mm/dd/yyyy',
				container: container,
				todayHighlight: true,
				autoclose: true,
			})
		})
	
	</script>
		
	</body>
</html>
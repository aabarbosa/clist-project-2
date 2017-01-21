<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Task Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">HOME</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-category">New Category</a></li>
					<li><a href="new-task">New Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
					<li><a href="contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Task Manager</h1>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_GATEGORY'}">
			<div class="container text-center">
				<h3>CREATE A NEW CATEGORY</h3>
				<hr>
				<!-- <form class="form-horizontal" method="POST" action="save-category">
					<input type="hidden" name="category" value="${category.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Category Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${category.name}"/>
						</div>				
					</div>
			
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>  -->
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>CATEGORY 1</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
									<td>${task.finished}</td>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
							
							
						</tbody>
					</table>
				</div>
			</div>
			<hr>
			<center>${statistics}</center>
			<hr>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${task.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${task.description}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>		
					
					<!-- <div class="form-group">
						<label class="control-label col-md-3">Priority</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="priority" value="true"/>
							<div class="col-sm-1">HIGH</div>
							<input type="radio" class="col-sm-1" name="priority" value="false" checked/>
							<div class="col-sm-1">MED.</div>
							<input type="radio" class="col-sm-1" name="priority" value="false" checked/>
							<div class="col-sm-1">LOW</div>
						</div>				
					</div> -->
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_CONTACT'}">
			<div class="container" id="contactDiv">
				<div class="jumbotron text-center">
					<h3><strong>Contact Information</strong></h3>
					<address>
						<table align="center" border="1" cellpadding="0" cellspacing="0" width="600">
						 <tr>
						  <td><strong>Alekssandro Assis Barbosa</strong><br>
						  	<a href="mailto:alekssandro.barbosa@ccc.ufcg.edu.br">alekssandro.barbosa@ccc.ufcg.edu.br</a>
						  </td>
						 </tr>
						 <tr>
						  <td>
							<cite>Sistemas de Informação 1 - 2016.2 - Lab 03 on <a href="https://github.com/aabarbosa/clist-project">GitHub.</cite>
						  </td>
						 </tr>
						</table>
					 </address>
				</div>
			</div>
		</c:when>	
	</c:choose>
	
	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicación de gestión de usuarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<header class="container">
		<nav class="navbar navbar-expand-lg bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Gestion de usuarios</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>">Usuarios</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</header>
	
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				
				<c:if test="${usuario != null}">
					<form action="update" method="post">					
				</c:if>
				<c:if test="${usuario == null}">
					<form action="insert" method="post">					
				</c:if>
				
				<caption>
					<h2>
						<c:if test="${usuario != null}">
						 	Editar Usuario
						</c:if>
						<c:if test="${usuario == null}">
						 	Agregar Usuario
						</c:if>
					</h2>
				</caption>
				
				<c:if test="${usuario != null}">
				 	<input type="hidden" name="id" value="<c:out value='${usuario.id}'/>"/>
				</c:if>
				
				<fieldset class="form-group">
					<label>Nombre de Usuario</label><input type="text" value="<c:out value='${usuario.nombre}'/>" class="form-control" name="nombre" required="required"/>
				</fieldset>
				<fieldset class="form-group">
					<label>Email de Usuario</label><input type="text" value="<c:out value='${usuario.email}'/>" class="form-control" name="email"/>
				</fieldset>
				<fieldset class="form-group">
					<label>Pais de Usuario</label><input type="text" value="<c:out value='${usuario.pais}'/>" class="form-control" name="pais"/>
				</fieldset>
				
				<button type="submit" class="btn btn-success">Guardar</button>
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
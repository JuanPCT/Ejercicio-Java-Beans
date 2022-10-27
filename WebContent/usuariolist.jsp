<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicación gestión de usuarios</title>
<!-- CSS only -->
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
	<div class= "container">
		<div class="row">
			<div class= "container">
				<h3 class="text-center">Listado de Usuarios</h3>
				<hr>
				<div class="container text-left">
					<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Agregar Nuevo Usuario</a>
				</div>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Email</th>
							<th>Pais</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="usuario" items="${listUsuario}">
							<tr>
								<td><c:out value="${usuario.id}"/></td>
								<td><c:out value="${usuario.nombre}"/></td>
								<td><c:out value="${usuario.email}"/></td>
								<td><c:out value="${usuario.pais}"/></td>
								<td><a href="edit?id=<c:out value="${usuario.id}"/>">Editar</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${usuario.id}'/>">Eliminar</a></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
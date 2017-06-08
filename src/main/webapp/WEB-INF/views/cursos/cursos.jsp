<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!-- Validador de Spring -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Encasula los objetos en un formulario. -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Libreria para el formateo de fechas. -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Se incluye la cabecera del include 'header.jsp' -->
<jsp:include page="../includes/header.jsp" />

<main>
	<!-- Enlace para crear personas. -->
	<a class ="btn btn-primary" href="cursos/addCurso"> Añadir Nuevo Curso</a>
	
	<!-- Caja contenedor de la cabecera. -->
	<div class="row cabecera_datos">
		<span class="col-xs-1">Código.</span>
		<span class="col-xs-3">Nombre</span>
	</div>
	
	<!-- Se comprueba si el listado de empresas no está vacio. 
		 En tal caso se recorre la lista de empresas sobre el objeto empresa.-->	
	<c:choose>
	<c:when test="${not empty listadoCursos}">
		<c:forEach var="curso" items="${listadoCursos}">
			<div class="row lista_datos">
				<!-- Celda con el codigo de la empresa. -->
				<span class="col-xs-1">${curso.codigo}</span>
				<!-- Celda con el nombre del empresa. -->
				<span class="col-xs-3">${curso.nombre}</span>
				
				<span class="col-xs-1">		
					<!-- Se redirecciona con la empresa pasada por parametro 
				     	 de manera que el controlador lo gestione y lo edite. -->
					<a class="col-xs-6 btn btn-xs btn-primary" 
					   href= "<c:url value='cursos/${curso.id}'/>">
					   <!-- Caja que contiene un icono como fuente. -->
					   <span class="glyphicon glyphicon-pencil"></span>
					</a>
					<!-- Se redirecciona con la empresa pasada por parametro 
					     junto con el parametro 'deleteEmpresa' de manera que el 
					     controlador lo gestione y lo borre. -->
					<a class="col-xs-6 btn btn-xs btn-primary" 
					   href="<c:url value='cursos/deleteCurso/${curso.id}'/>">
					     <!-- Caja que contiene un icono como fuente. -->
					   <span class="glyphicon glyphicon-trash"></span>
					</a>
					
					</div>
				</span>
			</div>
		</c:forEach>
	</c:when>	
	<c:otherwise>
		<!-- En caso que la lista de personas este vacia se muestra una texto 
			     ocupando todas las columnas de la tabla. -->
		<div class="row">
			<!-- En caso que la lista de empresas este vacia se muestra una texto 
			     ocupando todas las columnas de la tabla. -->
				<p>No se ha encontrado cursos en la base de datos.<p/> 
		</div>
	</c:otherwise>
	</c:choose>
	
	<!-- Enlace para crear personas. -->
	<a class ="btn btn-primary" href="cursos/addCurso"> Añadir Nuevo Curso</a>
</main>

<!-- Se incluye el pie del include 'footer.jsp' -->
<jsp:include page="../includes/footer.jsp" /> 
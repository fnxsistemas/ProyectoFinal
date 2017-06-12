<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!-- Validador de Spring -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Encasula los objetos en un formulario. -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Se incluye la cabecera del include 'header.jsp' -->
<jsp:include page="../includes/header.jsp" />

<main>
	<!-- Formulario gestionado por spring.
		 En commandName se define el nombre del objeto que va a gestionar el formulario. -->
	<form:form action="save" method="post" commandName="curso">
		<c:if test="${!empty curso}">
		<!-- Control de campo oculto.En el path se recoge el atributo del objeto. -->
			<form:hidden path="id" />
			<!-- Caja para el codigo de la empresa. -->
			<div class="row">
				
				<!-- Etiqueta y control para recoger codigo. -->
				<form:label path="codigo" class="col-xs-1"> Código : </form:label>
				<form:input path="codigo" class="col-xs-2" 
				            placeholder="Introduzca el Código de Curso" />
				<!-- Muestra el menaje cuando el atributo sea incorrecto. -->
				<form:errors path="codigo" />
			</div>
			<!-- Caja para el nombre de la empresa. -->
			<div class="row">
				
				<!-- Etiqueta y control para recoger nombre -->
				<form:label path="nombre" class="col-xs-1">Nombre : </form:label>			
				<form:input path="nombre" class="col-xs-6" 
				            placeholder="Introduzca el Nombre del Curso"/>
				<!-- Muestra el menaje cuando el atributo sea incorrecto. -->
				<form:errors path="nombre" />
			</div>
			
			
			<c:set var = "etiqueta" scope = "page" value = "Crear"/>
			<!-- Se comprueba si existe la empresa asociada al formulario. -->
			<c:if test="${curso.id > 0}"> 
				<c:set var = "etiqueta" scope = "page" value = "Editar"/>
   			</c:if>
			<!-- Se asigna el mensaje al boton del formulario. -->
			<input class="btn btn-primary" type="submit" value="${etiqueta}" class="row">
		</c:if>
	</form:form>
</main>
<!-- Se incluye el pie del include 'footer.jsp' -->
<jsp:include page="../includes/footer.jsp" /> 
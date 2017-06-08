<!-- Se incica la codificación de la página en UTF-8. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Se declara la libreria de JSTL. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- Se declara la libreria de SPRING. --> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Se declara la página como html5. --> 
<!DOCTYPE html>
<!-- Se declara el inicio de la página html. -->
<html>
<!-- Se declara cabecera de la página. Información para el navegador que será transparente al usuario. -->
<head>
	<!-- Se le informa al navegador que le enviamos codigo en codificación UTF-8. -->
	<meta charset="UTF-8">
	<!-- Se le informa al navegador el autor de la página. -->
	<meta name="author" content="Raúl de Roba">  		
	<!-- Se le informa al navegador la fecha de la última versión. -->
	<meta name="revised" content="Raúl de Roba Junio 2017">  	
	<!-- Se informa al navegador la descripción y/o objetivo de la pagina.-->
	<meta name="description" content="Proyecto Final.Ipartek.">
	<!-- Se le informa al navegador con que software se ha realizado el código. -->
	<meta name="generator" content="Eclipse Mars"> 
	<!-- Se le informa al buscador de las palbras claves. -->
	<meta name="keywords" content="Proyecto Final.Ipartek.Raúl de Roba Junio 2017">  
	<!-- Boostrap. De cara a los moviles se indica que considere todo el ancho de la pantalla de cara a 
	     escalar el Css. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Es la primera etiqueta que busca los buscadores,por lo que conviene que sea descriptivo. -->
	<title>Proyecto Final </title>
	
	<!-- Bootsrap. Plantilla Css minimizada(sin espacios, ni saltos de carro) -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
	      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
	      crossorigin="anonymous">
	
	<!-- Bootsrap. Tema de Bootsrap (Minimizada). -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" 
	      integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" 
	      crossorigin="anonymous">
	      
	<!-- Se declara la dirección de la hoja de estilos (css) en una variable. -->
	<spring:url value="/resources/css/styles.css" var="rutacss"/>
	<!-- Se direcciona la hoja de estilos de Css. -->
	<link href="${rutacss}" rel="stylesheet"/>
	      
	<!-- Bootsrap. Jquery para Bootsrap (Minimizada). -->      
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	        crossorigin="anonymous">
	</script>
	  
	<!-- Bootsrap. Javascript para Bootsrap (Minimizada). -->  
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
	         integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
	         crossorigin="anonymous">
	 </script>
	 
	<!-- Se comprueba si el explorador es inferior a Internet Explorer 9 y se carga otra versión de javascript. 
	     (Aunque este dentro de un comentario se ejecuta igualmente) -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<![endif]-->	
	
	<!-- Libreria de javaScript para la carga de Jquery. -->
	<script
  		src="https://code.jquery.com/jquery-3.1.1.min.js"
  		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  		crossorigin="anonymous">
	</script>
</head>
<!-- Cuerpo de mensaje. Contenido para los usuarios. -->
<body class="container-fluid">
	<!-- Cabecera del contenido de la página. -->
	<header class="row">
	<!-- Logotipo. -->
		<img class="col-xs-2 img-responsive" title="Logotipo" alt="Ipartek" 
		     src="<c:url value='${webappRoot}/resources/images/logo-ipartek.png'/>">
		     
		<!-- Se asigna una caja para el titulo principal de cara a asignar propiedades Css al texto h1. -->
		<span class="text-uppercase text-center">
			<!-- Titulo principal. -->
			<h1>Proyecto Final</h1>
		</span>
		
		<!-- Caja de navegación por las opciones de menú.-->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
    			<!-- Caja para visualizar en moviles. -->
        		<div class="navbar-header">
          			<!-- Logo de la empresa. -->
            		<a class="navbar-brand" href="#">${seccion}</a>
        		</div>
				<!-- Caja para contener el menu. -->
	    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    			<ul class="nav navbar-nav">
						<!-- Línea de la lista. Opción de gestión de Personas -->
						<li>
							<p> Codigo </p>
						</li>
						<li>
							<p> Nombre </p>
						</li>
				<li>
					<!-- Enlace a la ayuda. 
			     	Con c:url se envia una dirección relativa con respecto a la estructura 
			     	del proyecto.
			     	Se hace una petición a la carpeta de 'ayuda' que gestionará 
			     	'AyudaController'. -->
					<a class="btn btn-primary" href="<c:url value='/cursos/cursos'/>"> 
					busqueda </a>
				</li>
				
				<li>
					<!-- Se comprueba si el acceso es anonimo. -->
					<sec:authorize access="isAnonymous()">
						<!-- Formulario que recoge el login. -->
			        	<form method="POST" action="<c:url value='/login'/>">
			        		<!-- Caja con el nombre de usuario. 
			        		     Con ${SPRING_SECURITY_LAST_USERNAME} se recoge el último usuario que ha guardado 
			        		     SPRING_SECURITY. 
			        		     El id de usuario y password ha de ser igual al declarado en 
								spring-security-context.xml. -->
			            	Username: <input name="userId" type="text" 
			            	                 value="${SPRING_SECURITY_LAST_USERNAME}" /> 
			                Password: <input name="password" type="password" />
			                <input type="submit" value="Login" />
			            </form>
			        </sec:authorize>
			        <!-- Se comprueba si el acceso es con usuario. -->
			    	<sec:authorize access="isAuthenticated()">
			    		<!-- Se muestra boton para deslogear. -->	
			        	<a class="btn btn-default" href="<c:url value="/logout" />">Logout</a>
			       	</sec:authorize> 
				</li>
			</ul>
		</div>
	</div>
</nav>

		
		
	</header>
<!-- El cierre del /body se hace en cada página que incluya el 'header.jsp'. -->
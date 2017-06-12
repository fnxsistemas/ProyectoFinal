<!-- Se incica la codificación de la página en UTF-8. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Se declara la libreria de JSTL. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- Se declara la libreria de SPRING. --> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Librerias de Spring Security. -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

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
		<div class="row titulo">		
			<!-- Logotipo. -->
			<img class="col-xs-2 img-responsive" title="Ipartek" alt="Ipartek" 
			     src="<c:url value='/resources/images/logo-ipartek.png'/>">
			     
			<!-- Se asigna una caja para el titulo principal de cara a asignar propiedades Css al texto h1. -->
			<span class="text-uppercase text-center col-xs-8">
				<!-- Titulo principal. -->
				<h1 class = "text-center">Proyecto Final</h1>
			</span>
			
			<img class="col-xs-2 img-responsive" title="Lanbide" alt="Lanbide" 
			     src="<c:url value='/resources/images/logo-lanbide.png'/>">
		</div>
		
		

		
		
	</header>
<!-- El cierre del /body se hace en cada página que incluya el 'header.jsp'. -->
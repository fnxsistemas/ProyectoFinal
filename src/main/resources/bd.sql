CREATE DATABASE  IF NOT EXISTS `proyectocv` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `proyectocv`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyectocv
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `datosacademicos`
--

LOCK TABLES `datosacademicos` WRITE;
/*!40000 ALTER TABLE `datosacademicos` DISABLE KEYS */;
INSERT INTO `datosacademicos` VALUES (2,1,'1',1,'Persona Uno - Empresa Uno','2017-01-01');
/*!40000 ALTER TABLE `datosacademicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,1,'endesa','calle endesa','barakaldo','48002','albacete','e@e.com',7,'4');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experienciaprofesional`
--

LOCK TABLES `experienciaprofesional` WRITE;
/*!40000 ALTER TABLE `experienciaprofesional` DISABLE KEYS */;
INSERT INTO `experienciaprofesional` VALUES (2,1,1,1,'Esp','2017-01-01','2017-01-02');
/*!40000 ALTER TABLE `experienciaprofesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formacioncomplementaria`
--

LOCK TABLES `formacioncomplementaria` WRITE;
/*!40000 ALTER TABLE `formacioncomplementaria` DISABLE KEYS */;
INSERT INTO `formacioncomplementaria` VALUES (1,1,'1',1,'persona uno');
/*!40000 ALTER TABLE `formacioncomplementaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,'raul','2017-01-01','calle','valle','48510','vizcaya','a@a.com',9,62);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyectocv'
--

--
-- Dumping routines for database 'proyectocv'
--
/*!50003 DROP PROCEDURE IF EXISTS `datosacademicosCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosacademicosCreate`(
/* Parametros de Entrada*/
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob, 
in `pftitulacion` date,
/* Parametro de Salida.*/
OUT `pid` INT)
BEGIN
    /* Se inserta los parametros recibidos en la tabla EMPRESA.*/
	INSERT INTO datosacademicos (codigo, persona, empresa, descripcion, 
                                 ftitulacion)
	VALUES (pcodigo, ppersona, pempresa, Lower(pdescripcion), pftitulacion);
            
    /* Se devuelve el codigo de la ultima inserción.*/
    SET pid = LAST_INSERT_ID();    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosacademicosDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosacademicosDelete`(IN `pid` INT)
BEGIN  
    /* Se borra un dato academico en base al id pasado por parametro.*/
	DELETE FROM datosacademicos WHERE datosacademicos.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosacademicosGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosacademicosGetAll`()
BEGIN
	/* Sentencia que muestra todos los datosacademicos de la Bd.*/
	SELECT datosacademicos.id, datosacademicos.persona, datosacademicos.codigo, 
           datosacademicos.empresa, datosacademicos.descripcion,
           datosacademicos.ftitulacion
    FROM datosacademicos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosacademicosGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosacademicosGetById`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra el dato academico de la Bd 
       cuyo id coincida con el parametro pasado..*/
	SELECT datosacademicos.id, datosacademicos.persona, datosacademicos.codigo, 
           datosacademicos.empresa, datosacademicos.descripcion,
           datosacademicos.ftitulacion
    FROM datosacademicos
    WHERE datosacademicos.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datosacademicosUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosacademicosUpdate`(
/* Parametros de Entrada*/
in `pid` INT(11),
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob, 
in `pftitulacion` date)
BEGIN
    /* Se actualiza los parametros recibidos en la tabla DATOS ACADEMICOS.*/
	UPDATE datosacademicos set codigo = pcodigo, 
					           persona = ppersona, 
							   empresa = pempresa, 
                               descripcion = LOWER(pdescripcion),
						       ftitulacion = pftitulacion
	WHERE datosacademicos.id = pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaCreate`(
/* Parametros de Entrada*/
in `pcodigo` int(11), 
in `pnombre` varchar(50), 
in `pdireccion` varchar(50) ,
in `ppoblacion` varchar(25), 
in `pcodigopostal` varchar(5), 
in `pprovincia` varchar(15), 
in `pemail` varchar(100), 
in `ptelefono` int(11) ,
in `pweb` varchar(100),
/* Parametro de Salida.*/
OUT `pid` INT)
BEGIN
    /* Se inserta los parametros recibidos en la tabla EMPRESA.*/
	INSERT INTO empresa (codigo, nombre, direccion, poblacion,
						 codigopostal, provincia, email, telefono, web)
	VALUES (pcodigo, LOWER(pnombre), LOWER(pdireccion), LOWER(ppoblacion),
			pcodigopostal, LOWER(pprovincia), LOWER(pemail), ptelefono, LOWER(pweb));
            
    /* Se devuelve el codigo de la ultima inserción.*/
    SET pid = LAST_INSERT_ID();    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaDelete`(IN `pid` INT)
BEGIN  
    /* Se borra una empresa en base al id pasado por parametro.*/
	DELETE FROM empresa WHERE empresa.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaGetAll`()
BEGIN
	/* Sentencia que muestra todas las empresas de la Bd.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM empresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaGetByCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaGetByCodigo`(IN `pcodigo` INT)
BEGIN
	/* Sentencia que muestra la empresa cuyo codigo coincida con el parametro pasado.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM empresa
    WHERE empresa.codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaGetById`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra la empresa cuyo id coincida con el parametro pasado.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM empresa
    WHERE empresa.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaInformeDatosAcademicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaInformeDatosAcademicos`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web,
           datosacademicos.id, datosacademicos.persona, datosacademicos.codigo, 
           datosacademicos.empresa, datosacademicos.descripcion,
           datosacademicos.ftitulacion,
           persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil           
    FROM empresa
    JOIN datosacademicos ON datosacademicos.empresa = empresa.id  
    JOIN persona ON datosacademicos.persona = persona.id  
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaInformeExperienciaProfesional` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaInformeExperienciaProfesional`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web,
           experienciaprofesional.id, experienciaprofesional.persona, 
		   experienciaprofesional.codigo, 
           experienciaprofesional.empresa, experienciaprofesional.descripcion,
           experienciaprofesional.fdesde, experienciaprofesional.fhasta,
           persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil           
    FROM empresa
	JOIN experienciaprofesional ON experienciaprofesional.empresa = empresa.id
    JOIN persona ON experienciaprofesional.persona = persona.id
  
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaInformeFormacionComplementaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaInformeFormacionComplementaria`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web,
           formacioncomplementaria.id, formacioncomplementaria.persona, 
           formacioncomplementaria.codigo, 
           formacioncomplementaria.empresa, formacioncomplementaria.descripcion,
		   persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil           
    FROM empresa
	JOIN formacioncomplementaria ON formacioncomplementaria.empresa = empresa.id  
    JOIN persona ON formacioncomplementaria.persona = persona.id 
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `empresaUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `empresaUpdate`(
/* Parametros de Entrada*/
in `pid` INT(11),
in `pcodigo` int(11), 
in `pnombre` varchar(50), 
in `pdireccion` varchar(50) ,
in `ppoblacion` varchar(25), 
in `pcodigopostal` varchar(5), 
in `pprovincia` varchar(15), 
in `pemail` varchar(100), 
in `ptelefono` int(11) ,
in `pweb` varchar(100))
BEGIN
    /* Se actualiza los parametros recibidos en la tabla EMPRESA.*/
	UPDATE empresa set codigo = pcodigo, 
					    nombre = LOWER(pnombre), 
                        direccion = LOWER(pdireccion), 
                        poblacion = LOWER(ppoblacion),
						codigopostal = pcodigopostal, 
                        provincia = LOWER(pprovincia), 
                        email = LOWER(pemail), 
                        telefono = ptelefono, 
                        web = LOWER(pweb)
	WHERE empresa.id = pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `experienciaprofesionalCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experienciaprofesionalCreate`(
/* Parametros de Entrada*/
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob, 
in `pfdesde` date,
in `pfhasta` date,
/* Parametro de Salida.*/
OUT `pid` INT)
BEGIN
    /* Se inserta los parametros recibidos en la tabla EXPERIENCIAPROFESIONAL.*/
	INSERT INTO experienciaprofesional (codigo, persona, empresa, descripcion, 
                                        fdesde,fhasta)
	VALUES (pcodigo, ppersona, pempresa, Lower(pdescripcion), 
            pfdesde,pfhasta);
            
    /* Se devuelve el codigo de la ultima inserción.*/
    SET pid = LAST_INSERT_ID();    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `experienciaprofesionalDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experienciaprofesionalDelete`(IN `pid` INT)
BEGIN  
    /* Se borra una experiencia profesional 
       en base al id pasado por parametro.*/
	DELETE FROM experienciaprofesional WHERE experienciaprofesional.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `experienciaprofesionalGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experienciaprofesionalGetAll`()
BEGIN
	/* Sentencia que muestra todos los datosacademicos de la Bd.*/
	SELECT experienciaprofesional.id, experienciaprofesional.persona, 
		   experienciaprofesional.codigo, 
           experienciaprofesional.empresa, experienciaprofesional.descripcion,
           experienciaprofesional.fdesde, experienciaprofesional.fhasta
    FROM experienciaprofesional;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `experienciaprofesionalGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experienciaprofesionalGetById`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra la experiencia profesional de la Bd 
       cuyo id coincida con el parametro pasado..*/
	SELECT experienciaprofesional.id, experienciaprofesional.persona, 
           experienciaprofesional.codigo, 
           experienciaprofesional.empresa, experienciaprofesional.descripcion,
           experienciaprofesional.fdesde, experienciaprofesional.fhasta
    FROM experienciaprofesional
    WHERE experienciaprofesional.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `experienciaprofesionalUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experienciaprofesionalUpdate`(
/* Parametros de Entrada*/
in `pid` INT(11),
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob, 
in `pfdesde` date,
in `pfhasta` date)
BEGIN
    /* Se actualiza los parametros recibidos en la tabla DATOS ACADEMICOS.*/
	UPDATE experienciaprofesional set codigo = pcodigo, 
					                  persona = ppersona, 
			     		              empresa = pempresa, 
                                      descripcion = LOWER(pdescripcion),
			     	                  fdesde = pfdesde,
                                      fhasta = pfhasta
	WHERE experienciaprofesional.id = pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `formacioncomplementariaCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `formacioncomplementariaCreate`(
/* Parametros de Entrada*/
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob,
/* Parametro de Salida.*/
OUT `pid` INT)
BEGIN
    /* Se inserta los parametros recibidos en la tabla EXPERIENCIAPROFESIONAL.*/
	INSERT INTO formacioncomplementaria (codigo, persona, empresa, descripcion)
	VALUES (pcodigo, ppersona, pempresa, Lower(pdescripcion));
            
    /* Se devuelve el codigo de la ultima inserción.*/
    SET pid = LAST_INSERT_ID();    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `formacioncomplementariaDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `formacioncomplementariaDelete`(IN `pid` INT)
BEGIN  
    /* Se borra una formacion complementaria en base al id pasado por parametro.*/
	DELETE FROM formacioncomplementaria WHERE formacioncomplementaria.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `formacioncomplementariaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `formacioncomplementariaGetAll`()
BEGIN
	/* Sentencia que muestra toda la formacion complementaria de la Bd.*/
	SELECT formacioncomplementaria.id, formacioncomplementaria.persona, 
           formacioncomplementaria.codigo, 
           formacioncomplementaria.empresa, formacioncomplementaria.descripcion
    FROM formacioncomplementaria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `formacioncomplementariaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `formacioncomplementariaGetById`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra toda la formacion complementaria de la Bd.*/
	SELECT formacioncomplementaria.id, formacioncomplementaria.persona, 
           formacioncomplementaria.codigo, 
           formacioncomplementaria.empresa, formacioncomplementaria.descripcion
    FROM formacioncomplementaria
    WHERE formacioncomplementaria.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `formacioncomplementariaUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `formacioncomplementariaUpdate`(
/* Parametros de Entrada*/
in `pid` INT(11),
in `pcodigo` int(11), 
in `ppersona` int(11), 
in `pempresa` int(11),
in `pdescripcion` blob)
BEGIN
    /* Se actualiza los parametros recibidos en la tabla DATOS ACADEMICOS.*/
	UPDATE formacioncomplementaria set codigo = pcodigo, 
					           persona = ppersona, 
							   empresa = pempresa, 
                               descripcion = LOWER(pdescripcion)
	WHERE formacioncomplementaria.id = pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaCreate`(
/* Parametros de Entrada*/
in `pcodigo` int(11), 
in `pnombre` varchar(100) ,
in `pfnacimiento` date ,
in `pdireccion` varchar(50) ,
in `ppoblacion` varchar(25) ,
in `pcodigopostal` varchar(5), 
in `pprovincia` varchar(15), 
in `pemail` varchar(100) ,
in `ptelefono` int(11) ,
in `pmovil` int(11),
/* Parametros de Salida*/
out `pid` INT(11))
BEGIN
	/* Se inserta los parametros recibidos en la tabla PERSONA.*/
	INSERT INTO  persona (codigo, nombre, fnacimiento, direccion, 
                          poblacion, codigopostal, provincia, 
                          email, telefono, movil)
	VALUES (pcodigo, Lower(pnombre), pfnacimiento, Lower(pdireccion), 
            Lower(ppoblacion), pcodigopostal, Lower(pprovincia),
            Lower(pemail), ptelefono, pmovil);
    
    /* Se devuelve el codigo de la ultima inserción.*/
    SET pid = LAST_INSERT_ID();    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaDelete`(IN `pid` INT)
BEGIN  
    /* Se borra una persona en base al id pasado por parametro.*/
	DELETE FROM persona WHERE persona.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaGetAll`()
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil
    FROM persona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaGetByCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaGetByCodigo`(IN `pcodigo` INT)
BEGIN
	/* Sentencia que muestra la persona cuyo codigo 
       coincida con el parametro pasado.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil
    FROM persona
    WHERE persona.codigo = pcodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaGetById`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra la persona cuyo id coincida con el parametro pasado.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil
    FROM persona
    WHERE persona.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaInformeDatosAcademicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaInformeDatosAcademicos`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil,
           datosacademicos.id, datosacademicos.persona, datosacademicos.codigo, 
           datosacademicos.empresa, datosacademicos.descripcion,
           datosacademicos.ftitulacion,
           empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM persona
    JOIN datosacademicos ON datosacademicos.persona = persona.id
    LEFT JOIN empresa ON empresa.id=datosacademicos.empresa    
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaInformeExperienciaProfesional` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaInformeExperienciaProfesional`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil,
           experienciaprofesional.id, experienciaprofesional.persona, 
		   experienciaprofesional.codigo, 
           experienciaprofesional.empresa, experienciaprofesional.descripcion,
           experienciaprofesional.fdesde, experienciaprofesional.fhasta,
           empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM persona
    JOIN experienciaprofesional ON experienciaprofesional.persona = persona.id
    JOIN empresa ON empresa.id=experienciaprofesional.empresa    
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaInformeFormacionComplementaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaInformeFormacionComplementaria`(IN `pid` INT)
BEGIN
	/* Sentencia que muestra todas las personas de la Bd.*/
	SELECT persona.id, persona.codigo, persona.nombre, persona.fnacimiento, 
           persona.direccion, persona.poblacion, persona.codigopostal, 
           persona.provincia, persona.email, persona.telefono, 
           persona.movil,
           formacioncomplementaria.id, formacioncomplementaria.persona, 
           formacioncomplementaria.codigo, 
           formacioncomplementaria.empresa, formacioncomplementaria.descripcion,
           empresa.id, empresa.codigo, empresa.nombre, empresa.direccion, 
           empresa.poblacion, empresa.codigopostal, empresa.provincia, 
           empresa.email, empresa.telefono, empresa.web
    FROM persona
    JOIN formacioncomplementaria ON formacioncomplementaria.persona = persona.id
    JOIN empresa ON empresa.id = formacioncomplementaria.empresa    
    WHERE persona.id=pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `personaUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `personaUpdate`(
/* Parametros de Entrada*/
in `pid` INT(11),
in `pcodigo` int(11), 
in `pnombre` varchar(50), 
in `pfnacimiento` date ,
in `pdireccion` varchar(50) ,
in `ppoblacion` varchar(25), 
in `pcodigopostal` varchar(5), 
in `pprovincia` varchar(15), 
in `pemail` varchar(100), 
in `ptelefono` int(11) ,
in `pmovil` int(11))
BEGIN
	/* Se actualiza la empresa con los datos recibidos por parametro.*/
	UPDATE persona set codigo = pcodigo,
                       nombre = Lower(pnombre),
                       fnacimiento = pfnacimiento,
                       direccion = Lower(pdireccion),
                       poblacion = Lower(ppoblacion),
                       codigopostal = pcodigopostal,
                       provincia = Lower(pprovincia),
                       email = Lower(pemail),
                       telefono = ptelefono,
                       movil = movil
	WHERE persona.id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-15 13:06:41

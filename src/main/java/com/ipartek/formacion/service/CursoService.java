package com.ipartek.formacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipartek.formacion.dbms.dao.CursoDAO;
import com.ipartek.formacion.dbms.persistence.Curso;


/**
 * @author Raúl de Roba 20/03/17
 * 
 * <p> Clase que gestiona las operaciones CRUD de la clase curso. </p>
 *
 */
/* @Service Anotación que declara la clase como servicio para la gestión de Spring.*/
@Service
public class CursoService{
	/* Se injecta la clase que une un Personas con las 
	 * clases DAO de acceso a Base de datos.*/
	@Autowired
	private CursoDAO cursoDAO;

	
	/**
	 * @param Persona
	 * @return Persona
	 * 
	 * <p> Metodo que crea la Persona pasada por parametro en la Base de Datos.
	 */
	public Curso create(Curso  curso) {
		/* Se llama al metodo de la clase DAO que crea una persona.*/
		return cursoDAO.create(curso);
	}

	/**
	 * @return List<Persona> Lista de Personas
	 * 
	 * <p> Metodo recoge la lista de las Personas en la Base de Datos. </p>
	 */
	public List<Curso> getAll() {
		/* Se llama al metodo que devuelve la lista de personas de la clase DAO.*/
		return cursoDAO.getAll();
	}

	/**
	 * @param Identificador de la Persona
	 * @return Persona
	 * 
	 * <p> Metodo recoge una empresa de la Base de Datos en base al 
	 *     identificador pasado por parametro. </p>
	 */
	public Curso getById(int id) {
		/* Se llama al metodo que busca una persona de la clase DAO en base al 
		 * identificador pasado por parametro.*/
		return cursoDAO.getById(id);
	}
	
	/**
	 * @param Código de la Persona
	 * @return Persona
	 * 
	 * <p> Metodo recoge una Persona de la Base de Datos en base al codigo pasado por 
	 * parametro.*/
	public Curso getByCodigo(String codigo) {
		/* Se llama al metodo que busca una persona de la clase DAO en base al 
		 * código pasado por parametro.*/
		return cursoDAO.getByCodigo(codigo);
	}

	/**
	 * @param Persona
	 * @return Persona
	 * 
	 * <p> Metodo actualiza la persona pasada por parametro en la Base de Datos. </p>
	 */
	public Curso update(Curso curso) {
		/* Se llama al metodo acutualiza la persona de la clase DAO.*/
		return cursoDAO.update(curso);
	}

	/**
	 * @param Identificador de la Persona
	 * 
	 * <p> Metodo borra una persona de la Base de Datos en base al identificador 
	 *     pasado por parametro. </p>
	 */
	public void delete(int id) {
		/* Se llama al metodo que borra la persona de la clase DAO.*/
		cursoDAO.delete(id);		
	}
	
	/**
	 * @param PersonaDAO Clase de acceso a Db.
	 * 
	 * <p> Metodo que asigna la clase DAO a la clase Persona. </p>
	 */
	public void setCursoDAO(CursoDAO cursoDao) {
		/* Se asigna la clase DAO a la persona.*/
		this.cursoDAO = cursoDao;		
	}
	
	
}

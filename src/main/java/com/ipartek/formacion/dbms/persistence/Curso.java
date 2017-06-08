package com.ipartek.formacion.dbms.persistence;

import java.io.Serializable;

/**
 * @author Raúl de Roba 14/03/2017
 *
 * <p> Clase Pojo que contendrá al objeto curso. </p>
 *
 */
public class Curso implements Serializable,Comparable<Curso>{
	/* Constate del serial de la clase.*/
	private static final long serialVersionUID = 1L;
	/* Constante para id nulo.*/
	public final static int CODIGO_NULO = -1;
	
	/* Atributos de curso.*/
	private int id;
	private String nombre;
	private String codigo;

	/**
	 * <p>Constructor vacio de la clase pojo curso.</p>
	 */
	public Curso() {
		/* Constructor del padre.*/
		super();
		/* Se asigna por defecto identificador nulo.*/
		this.id = CODIGO_NULO;
		/* Se inicializan los atributos.*/
		this.codigo = "";
		this.nombre = "";		
	}

	
	/**
	 * @param id 
	 * Se asigna el atributo id pasado por parametro.
	 */
	public void setId(int id) {
		/* Se asigna el atributo id pasado por parametro.*/
		this.id = id;
	}


	/**
	 * @return id. Se devuelve el atributo "id".
	 */
	public int getId() {
		/* Se devuelve el valor del atributo "id". */
		return id;
	}

	/**
	 * @return codigo. Se devuelve el atributo "codigo".
	 */
	public String getCodigo() {
		/* Se devuelve el valor del atributo "codigo". */
		return codigo;
	}

	/**
	 * @param codigo. Se asigna valor al atributo "codigo".
	 */
	
	public void setCodigo(String codigo) {
		/* Se asigna el valor del atributo "codigo" pasado por parametro. */
		this.codigo = codigo;
	}

	/**
	 * @return nombre. Se devuelve el atributo "nombre".
	 */
	public String getNombre() {
		/* Se devuelve el valor del atributo "nombre". */
		return nombre;
	}

	/**
	 * @param nombre. Se asigna valor al atributo "nombre".
	 */
	
	public void setNombre(String nombre) {
		/* Se asigna el valor del atributo "nombre" pasado por parametro. */
		this.nombre = nombre;
	}

	@Override
	/**
	 * @return String
	 * <p> Metodo que devuelve la clase covertida a cadena de caracteres.</p>
	 * */
	public String toString() {
		/* Se devuelve los atributos de la clase.*/
		return " Id " + this.id + " " +
			   " Codigo : " + this.codigo +  
			   " Nombre : " + this.nombre;
	}
	
	/** 
	 * <p> Se obtiene la un código Hash para 
	 *     la clase curso en base a su 'código'.</p>
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	/** 
	 * <p> Metodo que compara si dos objetos son iguales. </p>
	 */
	@Override
	public boolean equals(Object obj) {
		/* Se declara e inicializa una variable para devolver 
		 * el resultado de la comparación.*/
		boolean resultado = false;
		/* Se comprueba que el objeto pasado por paramtro no sea nulo.*/
		if (obj != null){
			/* Se comprueba si el objeto pasado por parametro es de la clase 'Curso'.*/
			if (obj instanceof Curso){
				/* Se compara los identificadores de la clase actua y 
				 * curso recibido por parametro.*/
				resultado =  this.getCodigo()== ((Curso) obj).getCodigo();
			}
				
		}
		/* Se devuelve el resultado de la comparación.*/			
		return resultado;
	}

	/**
	 * @param Curso
	 * @return int
	 * 
	 * <p> Se usa en el caso de ordenamiento de List o Array. </p>
	 * <ul>
	 * 	<li> -1 Indicará que la clase es menor al curso recibido por parametro. </li>
	 * 	<li> 0 Indicará que la clase es igual al curso recibido por parametro. </li>
	 * 	<li> 1 Indicará que la clase es mayor al curso recibido por parametro. </li>
	 * </ul>
	 * 
	 */
	public int compareTo(Curso curso) {
		/* Se devuelve la comparación del nombre de la clase y 
		 * curso recibida por parametro.*/
		return this.getNombre().compareToIgnoreCase(curso.getNombre());
	}
	
}

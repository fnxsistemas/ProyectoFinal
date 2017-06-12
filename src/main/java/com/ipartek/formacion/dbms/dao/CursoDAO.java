package com.ipartek.formacion.dbms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.ipartek.formacion.dbms.mappers.CursoMapper;
import com.ipartek.formacion.dbms.persistence.Curso;


/**
 * @author Raúl De Roba 20/03/17
 * 
 * <p> Clase que gestiona la unión de las capas Modelo(BD) y Controlador para la clase
 *     curso </p>
 * <p> Con @Repository se indica que es una clase DAO.</p>  
 *
 */

public class CursoDAO {
	
	/* Se declara el conenedor de los LOG4J.*/
	private Logger logger = LoggerFactory.getLogger(CursoDAO.class);
	
	/* Se injecta el recurso DataSource para comunicar la base de datos. 
	 * Recogido de beans.xml (bean name).*/
	@Resource(name = "mysqlDataSource")
	private DataSource dataSource;
	
	/* Se declara el controlador que unira el DataSource y 
	 * la Bd si no se va a enviar parametros a la Bd.*/
	private JdbcTemplate template;

	/* Se asocia la conexión de la base de datos.*/
	@Autowired
	public void setDataSource(DataSource dataSource) {
		/* Se asocia la conexión de la base de datos pasada por parametro.*/
		this.dataSource = dataSource;
		/* Se asocia  el controlador de la base de datos para las consultas sin	 parametros.*/
		this.template = new JdbcTemplate(dataSource);
		
	}

	/* Metodo que crea el curso pasado por parametro.*/
	public Curso create(Curso curso) {
		/* Se declara la Sql con la que insertar los datos de la pesona, 
		 * mediante una llamada al procedimiento encapsulado. */
		final String SQL = "cursoCreate";
		/* Se declara y se crea el objeto controlador que unira el DataSource y 
		 * la Bd si se va a enviar parametros a la Bd.*/ 
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource);
		/* Se asigna el procedimiento de la Bd.,en este cado 'personaCreate'.*/
		jdbcCall.withProcedureName(SQL);
		/* Se declara y crea el objeto con el mapa de los parametros a pasar al 
		 * procedimiento almacenado de la base de datos. */
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("pcodigo", curso.getCodigo())
				.addValue("pnombre", curso.getNombre());
		
		/* Se ejecuta el procedimiento almacenado de la base de datos con el mapa de 
		 * parametros,recogiendo en un mapa los resultados devueltos por el 
		 * procedimiento almacenado. */
		Map<String,Object> out = jdbcCall.execute(in);
		/* Se traza la inserción de la persona. */
		logger.info("Creado" + curso.toString());
		/* Se asigna el identificador a la empresa en base al codigo devuelto por el 
		 * procedimiento almacenado*/
		curso.setId((Integer) out.get("pid")); 
		/* Se devuelve el empresa creado. */
		return curso;
	}

	/* Metodo que recoger la lista de los personas recogida de la base de datos 
	 * en función de la estructura indicada en las clases Mapper.*/
	public List<Curso> getAll() {
		/* Se declara la Sql con la que extraer los datos las personas,
		 * mediante una llamada al procedimiento encapsulado. */
		final String SQL ="CALL cursoGetAll();";
		
		/* Se declara la lista donde recoger los personas.*/
		List<Curso> cursos = null;
		
		/* Se monta estrcutura para capturar excepciones.*/
		try{
			/* Se carga la lista de pesonas de la base de datos.*/		
			cursos = template.query(SQL, new CursoMapper());
			/* Se traza la captura de la lista capturando el numero de registros.*/
			logger.info("Tamaño lista:"+ cursos.size());
		/* Se recoge la excepción si no recogemos valores de pesonas.*/
		}catch(EmptyResultDataAccessException e){
			/* Se devuelve una lista vacia.*/
			cursos = new ArrayList<Curso>();
			/* Se traza la captura de la lista vacia con el procedimiento encapsulado. */
			logger.info("Sin Datos en  " + SQL);
		}
		/* Se devuelve la lista de empresas.*/
		return cursos;
	}
	
	/* Metodo que recoger la lista de los personas recogida de la base de datos 
	 * en función de la estructura indicada en las clases Mapper.*/
	public List<Curso> getAllFiltered(String codigo,String nombre,Boolean reducida) {
		/* Se declara la Sql con la que extraer los datos las personas,
		 * mediante una llamada al procedimiento encapsulado. */

		final String SQL ="CALL cursoGetAllFiltered(" + 
		                  "'"  + codigo + "','" +nombre + "','" + reducida +"');";
		
		/* Se declara la lista donde recoger los personas.*/
		List<Curso> cursos = null;
		
		/* Se monta estrcutura para capturar excepciones.*/
		try{
			/* Se carga la lista de pesonas de la base de datos.*/		
			cursos = template.query(SQL, new CursoMapper());
			/* Se traza la captura de la lista capturando el numero de registros.*/
			logger.info("Tamaño lista:"+ cursos.size());
		/* Se recoge la excepción si no recogemos valores de pesonas.*/
		}catch(EmptyResultDataAccessException e){
			/* Se devuelve una lista vacia.*/
			cursos = new ArrayList<Curso>();
			/* Se traza la captura de la lista vacia con el procedimiento encapsulado. */
			logger.info("Sin Datos en  " + SQL);
		}
		/* Se devuelve la lista de empresas.*/
		return cursos;
	}

	/* Metodo que busca una persona en base al identificador pasado por parametro.*/
	public Curso getById(int id) {
		/* Se crea el objeto persona para recoger la empresa de la Bd.*/
		Curso curso = null;
		/* Se declara la Sql con la que extraer los datos del persona,
		 * mediante una llamada al procedimiento encapsulado. */
		final String SQL ="CALL cursoGetById(?);";
		/* Se monta estrcutura para capturar excepciones.*/
		try{
			/* Se recoge la empresa del procedimiento almacenado pasando el mapeado de 
			 * campos.
			 * En el array de Object pasamos los parametros que va a recibir el procedimiento almacenado.*/
			curso = template.queryForObject(SQL, new CursoMapper(),new Object[]{id});
			/* Se traza la persona recogido del procedimiento encapsulado. */
			logger.info("Encontrado el curso  " + curso.toString());			
		/* Se recoge la excepción si no recogemos valores de personas.*/
		}catch(EmptyResultDataAccessException e){
			/* Se crea una empresa vacio para devolver.*/
			curso = new Curso();
			/* Se traza la captura sin persona del procedimiento encapsulado. */
			logger.info("No se ha encontrado el curso  " + id);
		}
		/* Se devuelve la persona recogida.*/
		return curso;
	}
	
	/* Metodo que busca una persona en base al codigo pasado por parametro.*/
	public Curso getByCodigo(String codigo) {
		/* Se crea el objeto persona para recoger la persona de la Bd.*/
		Curso curso = null;
		/* Se declara la Sql con la que extraer los datos de la persona,
		 * mediante una llamada al procedimiento encapsulado. */
		final String SQL ="CALL cursoGetByCodigo(?);";
		/* Se monta estrcutura para capturar excepciones.*/
		try{
			/* Se recoge la persona del procedimiento almacenado pasando el mapeado de 
			 * campos.
			 * En el array de Object pasamos los parametros que va a recibir el 
			 * procedimiento almacenado.*/
			curso = template.queryForObject(SQL, new CursoMapper(),new Object[]{codigo});
			/* Se traza la persona recogida del procedimiento encapsulado. */
			logger.info("Encontrado el curso  " + curso.toString());			
		/* Se recoge la excepción si no recogemos valores de persona.*/
		}catch(EmptyResultDataAccessException e){
			/* Se traza la captura sin persona del procedimiento encapsulado. */
			logger.info("No se ha encontrado el curso con codigo " + codigo);
		}
		/* Se devuelve el curso recogido.*/
		return curso;
	}

	/* Metodo que actualiza una persona pasado por parametro.*/
	public Curso update(Curso curso) {
		/* Se declara la Sql con la que modificar los datos de la persona, 
		 * mediante una llamada al procedimiento encapsulado. */
		final String SQL = "cursoUpdate";
		/* Se declara y se crea el objeto controlador que unira el DataSource y 
		 * la Bd si se va a enviar parametros a la Bd.*/ 
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource);
		/* Se asigna el procedimiento de la Bd.,en este cado 'personaupdate'.*/
		jdbcCall.withProcedureName(SQL);
		/* Se declara y crea el objeto con el mapa de los parametros a pasar al 
		 * procedimiento almacenado de la base de datos. */
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("pid", curso.getId())
				.addValue("pcodigo", curso.getCodigo())
				.addValue("pnombre", curso.getNombre());
		/* Se traza la inserción de la persona. */
		logger.info("Actualizado" + curso.toString());
		/* Se ejecuta el procedimiento almacenado de la base de datos con el mapa de parametros. */
		jdbcCall.execute(in);
		/* Se devuelve la empresa creada. */
		return curso;
	}


	/* Metodo que borra una empresa en base al codigo pasado por parametro.*/
	public void delete(int id) {
		/* Se declara la Sql con la que extraer los datos de la empresa,mediante una llamada al
		 * procedimiento encapsulado. */
		final String SQL ="cursoDelete";
		/* Se declara y se crea el objeto controlador que unira el DataSource y 
		 * la Bd si se va a enviar parametros a la Bd.*/ 
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource);
		/* Se declara y crea el objeto con el mapa de los parametros a pasar al 
		 * procedimiento almacenado de la base de datos. */
		jdbcCall.withProcedureName(SQL);
		SqlParameterSource in = new MapSqlParameterSource()
					.addValue("pid", id);
		/* Se traza la empresa recogida del procedimiento encapsulado. */
		logger.info("Borrado el curso  " + id);	
		/* Se ejecuta el procedimiento almacenado de la base de datos con el mapa de parametros. */
		jdbcCall.execute(in);	
	}
}

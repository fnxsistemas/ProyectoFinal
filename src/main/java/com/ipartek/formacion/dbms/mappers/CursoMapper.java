package com.ipartek.formacion.dbms.mappers;
	
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ipartek.formacion.dbms.persistence.Curso;
	
/**
 *  @author Raúl De Roba 20/03/17
 *  
 *  <p> Clase que asocia la estructura de los campos de la base de datos al JSP 
 *      para la clase 'Curso'.</p> 
 *
 */
public class CursoMapper implements RowMapper<Curso>{

	/* Se inyecta la clase que asocia la estructura de 
	 * los campos de la base de datos al JSP.*/
	@Override
	public Curso mapRow(ResultSet rs, int rowNum) throws SQLException {
		/* Se declara e instancia el objeto Persona.*/
		Curso curso = new Curso();
		/* Se recoje el identificador de curso del result.*/
		curso.setId(rs.getInt("id"));
		/* Se recoje el codigo de curso del result.*/
		curso.setCodigo(rs.getString("codigo"));
		/* Se recoje el nombre de la curso del result.*/
		curso.setNombre(rs.getString("nombre"));
		
		
		/* Se devuelve el objeto Persona.*/
		return curso;
	}
}
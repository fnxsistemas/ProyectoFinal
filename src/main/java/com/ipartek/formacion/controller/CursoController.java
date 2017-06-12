package com.ipartek.formacion.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ipartek.formacion.dbms.persistence.Curso;
import com.ipartek.formacion.service.CursoService;



/**
 * @author Raúl de Roba 02/02/17
 * 
 * <p> Clase que gestiona las peticiones de cursos.</p>
 *
 */
/* @Controller : Anotación que declara la clase como controlador para la gestión de Spring.*/
/* @RequestMapping(value="/curso") : Anotación que indica a Spring que vamos a gestionar 
 * peticiones todos los Jsp incluidos en la carpeta 'cursos'.*/
@Controller
@RequestMapping(value="/cursos") 
public class CursoController {
	/* Se declara el conenedor de los LOG4J.*/
	private static final Logger logger = LoggerFactory.getLogger(CursoController.class);
	
	/* Se declara el obejto que se encarga de gestionar las url y request.*/
    ModelAndView mav=null;
    /* Con Inject Spring busca una clase con la Inteface declarada.
     * En este caso CursoService.
     * (También se puede usar @Autowired)*/
    @Inject 
    private CursoService cS;
    
    /* Metodo que se ejecuta al crear la clase (.Init). */
    @InitBinder	
    private void  InitBinder(WebDataBinder binder){
    	/* Se asigna el validador que va a gestionar la clase.*/
    	//binder.setValidator(validator);
    	/* Se asigna la mascara que se va a usar para regoger las fechas.
    	 * El '10' que se pasa por parametro corresponde a los 10 caracteres de 
    	 * la mascara 'dd/MM/yyyy'.*/
    	binder.registerCustomEditor(Date.class,
    			    new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"),false,10));
    	
    }
    
    /* Gestiona las peticiones Get de curso.*/
    @RequestMapping(method = RequestMethod.GET)
	public ModelAndView getAll(){
    	/* Se crea la instancia de la url home (/views/cursos/cursos.jsp)*/
		mav = new ModelAndView("cursos/cursos");
		/* Se crea la traza del metodo. */
		logger.trace("cursos.getAll");
		/* Se declara una lista para cargar las empresas.*/
		List<Curso> cursos = null;
		/* se carga la lista de la capa Service o Logica*/
		cursos = cS.getAllFiltered("","",true);
		/* Se asocia la lista al MAV.*/
		mav.addObject("listadoCursos", cursos);
		/* Se devuelve el objeto que gestionar las url y request.*/
		return mav;		
	}
    
    /* Gestiona las peticiones Get de curso.*/
    @RequestMapping(value ="/filtrado",
    		        method = RequestMethod.GET)
	public ModelAndView getAllFiltered(@RequestParam("buscacodigo") String codigo,
									   @RequestParam("buscanombre") String nombre,
									   @RequestParam(name="buscareducida", required=false) Boolean reducida){
    	/* Se crea la instancia de la url home (/views/cursos/cursos.jsp)*/
		mav = new ModelAndView("cursos/cursos");
		/* Se crea la traza del metodo. */
		logger.trace("cursos.cursoGetFiltered");
		/* Se declara una lista para cargar las empresas.*/
		List<Curso> cursos = null;
		/* se carga la lista de la capa Service o Logica*/
		cursos = cS.getAllFiltered(codigo,nombre,reducida);
		/* Se asocia la lista al MAV.*/
		mav.addObject("listadoCursos", cursos);
		/* Se devuelve el objeto que gestionar las url y request.*/
		return mav;		
	}
    
    /* Se indica que se ha llamado a /cursos/ pasando como parametro '/addcurso' 
     * se ejecuta el metodo.*/
    @RequestMapping(value ="/addCurso")
    /* Metodo que añade una curso pasada por parametro.*/
    public String addcurso(Model model){
    	/* Se le pasa al modelo la curso recien creada.*/
    	model.addAttribute("curso",new Curso());
    	/* Se redirecciona el formulario de curso.*/
    	return "cursos/curso";
    }
    
    /* Se indica que se ha llmado  a cursos.jsp pasando como parametro '/deletecurso' 
     * con un parametro se ejecuta el metodo.*/
    @RequestMapping(value ="/deleteCurso/{id}")
    /* Con @PathVariable se indica que el parametro se recogera de la url.*/
    public String delete(@PathVariable("id") int id){
    	/* Traza de la actualización*/
		logger.info("Borrado el curso :" + id);
		/* Se borra la curso.*/
    	cS.delete(id);
    	/* Se reenvia la dirección url para cargar el listado de cursos.*/
    	return "redirect:/cursos";
    }
    
    /* Se indica que se ha llamado  a /cursos/ pasando como parametro un parametro el identificador. */
    @RequestMapping(value ="/{id}")
    public ModelAndView getById(@PathVariable("id") int id){
    	/* Se crea la instancia de la url home (/views/cursos/curso.jsp)*/
		mav = new ModelAndView("cursos/curso");
    	/* Traza de la actualización*/
		logger.info("Encontrado curso :" + cS.getById(id).toString());
		/* Se asocia la curso con el identificador pasado por parametro.*/
		mav.addObject("curso",cS.getById(id));
		/* Se devuelve el objeto que gestionar las url y request.*/
		return mav;	
    }
  
    /* Gestiona las peticiones POST de curso con action "save".
     * @ModelAtribute implica que lo vamos a recibir del request.
     * @Validated implica validación javax.*/
    @RequestMapping(value="/save" , method = RequestMethod.POST)
    public String saveAlumno(Model model,
    						 @ModelAttribute("curso") @Validated Curso curso,
    						 BindingResult binBindingResult,
    	    				 RedirectAttributes redirectMap){
    	/* Se declara una variable para recoger el destino.*/
    	String destino ="";
    	

    	
    	/* Se comprueba el resultado de la validación.*/
    	if (binBindingResult.hasErrors()){
    		logger.info("Curso con errores de formulario");
    		

	
    		/* Se redirecciona al formulario.*/
    		destino = "cursos/curso";
    		
    	}else{
    		/* Se redirecciona al listado de cursos.*/
    		destino = "redirect:/cursos";
    	
	    	/* Se comprueba si existe identificador comparandolo con la constante nula.*/
	    	if (curso.getId() > Curso.CODIGO_NULO){
	    		/* Traza de la actualización*/
	    		logger.info("Actualizado el curso :" + curso.toString());
	    			    		
	    		try {
	    			/* Se actualiza la curso.*/  
					cS.update(curso);

				} catch (Exception e) {
					logger.info("Se ha lanzadado una excepcion update. " + e.toString());

				}    		
	    	}else{
	    		/* Traza de la creación*/
	    		logger.info("Creada el curso :" + curso.toString());
	    		
	    		try {
	    			/* Se crea la curso.*/
					cS.create(curso);

				} catch (Exception e) {
					logger.info("Se ha lanzadado una excepcion create. " + e.toString());

				}
	    	}


    	}
    	/* Se redirecciona al destino al listado de empresas.*/
    	return destino;
    }

    
    
}

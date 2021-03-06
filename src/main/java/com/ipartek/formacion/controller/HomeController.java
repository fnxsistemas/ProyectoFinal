package com.ipartek.formacion.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	
	/* Metodo que gestionará las peticiones GET.*/
	@RequestMapping(method=RequestMethod.GET)
	public String home(){
		/* Se redirige a 'cursos' para que pase por el controlador.*/
		return "redirect:cursos";
	}
}

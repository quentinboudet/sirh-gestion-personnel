package dev.sgp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateurController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		if(matricule == null) {
			resp.sendError(400, "Un matricule est attendu");
		}

		resp.setContentType("text/html");
		// code HTML ecrit dans le corps de la reponse
		resp.getWriter().write("<h1>Edition de collaborateur</h1>"
				+ "<h5>Matricule : " + matricule + "</h5>"
		);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> params = new HashMap<>();
		
		params.put("matricule", req.getParameter("matricule"));
		params.put("titre", req.getParameter("titre"));
		params.put("nom", req.getParameter("nom"));
		params.put("prenom", req.getParameter("prenom"));
		
		String incorrect = "";
		for(String key : params.keySet()) {
			if(params.get(key) == null) {
				incorrect = virgule(incorrect);
				incorrect += key;
			}
		}

		if(!(incorrect.isEmpty())) {
			resp.sendError(400, "Les paramètres suivants sont incorrects : "+ incorrect);
		}
		
		String message = "";
		for(String key : params.keySet()) {
			message += key +" = "+ params.get(key) +", ";
		}
		resp.setContentType("text/html");
		// code HTML ecrit dans le corps de la reponse
		resp.getWriter().write("<h1>Edition de collaborateur</h1>"
				+ "<p>Creation d’un collaborateur avec les informations suivantes :<br>"
				+ message
				+ "</p>"
		);
		resp.setStatus(201);
	}
	private String virgule(String m) {
		if(!(m.equals(""))) {
			m += ", ";
		}
		return m;
	}
}
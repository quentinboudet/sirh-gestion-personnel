package dev.sgp.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;

public class CreerCollaborateurController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/collab/CreerCollaborateur.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//récupération des properties
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("application.properties"));

		//Liste des attributs généré
		Map<String, String> params = new HashMap<>();
		params.put("nom", req.getParameter("nom"));
		params.put("prenom", req.getParameter("prenom"));
		params.put("date-naissance", req.getParameter("date-naissance"));
		params.put("adresse", req.getParameter("adresse"));
		params.put("ss", req.getParameter("ss"));
		params.put("date-creation", ZonedDateTime.now().toString());
		params.put("mail-pro", req.getParameter("prenom") +"."+ req.getParameter("nom") +"@"+ props.getProperty("appli.mail-suffixe"));


		String message = "";
		for(String key : params.keySet()) {
			message += key +" = "+ params.get(key) +", ";
		}
		System.out.println(message);
		

		String incorrect = "";
		// si un parametre n'existe pas on le signale pour le message de l'erreur 400
		for (String key : params.keySet()) {
			if (params.get(key) == null) {
				incorrect = virgule(incorrect);
				incorrect += key;
				
			}
		}
		
		if(params.get("ss") != null &&(!params.get("ss").chars().allMatch( Character::isDigit ) || params.get("ss").length() != 15)) {
			System.out.println("ss");
			incorrect = virgule(incorrect);
			incorrect += "Le numéro de sécurité social ne contient pas 15 chiffres";
		}

		if (!(incorrect.isEmpty())) {
			resp.sendError(400, "Les paramètres suivants sont incorrects : " + incorrect);
		}
		else {
			Collaborateur collab = new Collaborateur(
					params.get("nom"),
					params.get("prenom"),
					params.get("date-naissance"),
					params.get("adresse"),
					params.get("ss"),
					params.get("mail-pro"),
					params.get("date-creation")
			);
			CollaborateurService.sauvegarderCollaborateur(collab);
	
			// on affiche la liste une fois le collab ajouter
			resp.sendRedirect("lister");
		}
	}


	/**
	 * ajout d'une virgule si un texte existe et renvoie le résultat
	 * @param m String à tester
	 * @return String m + virgule et espace
	 */
	private String virgule(String m) {
		if (!(m.equals(""))) {
			m += ", ";
		}
		return m;
	}
}
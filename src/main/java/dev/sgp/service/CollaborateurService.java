package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Collaborateur;

public class CollaborateurService {
	static List<Collaborateur> listeCollaborateurs = new ArrayList<>();

	public static List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}

	public static void sauvegarderCollaborateur(Collaborateur collab) {
		listeCollaborateurs.add(collab);
	}
}

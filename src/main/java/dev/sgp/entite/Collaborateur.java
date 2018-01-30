package dev.sgp.entite;

import java.time.LocalDate;
import java.time.ZonedDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="collaborateurs") //@Table (facultatif) désigne la table à mapper 
public class Collaborateur {
	@Id
	int id;

	@Column(name = "MATRICULE")
	String matricule;
	
	@Column(name = "NOM")
	String nom;
	
	@Column(name = "PRENOM")
	String prenom;
	
	@Column(name = "DATE_NAISSANCE")
	LocalDate dateNaissance;
	
	@Column(name = "ADRESSE")
	String adresse;
	
	@Column(name = "SS")
	String numeroSS;
	
	@Column(name = "MAIL_PRO")
	String emailPro;
	
	@Column(name = "PHOTO")
	String photo;
	
	@Column(name = "DATE_HEURE_CREATION")
	ZonedDateTime dateHeureCreation;
	
	@Column(name = "ACTIF")
	Boolean actif;

	public Collaborateur(String nom, String prenom, String dateNaissance, String adresse, String numeroSS, String emailPro,
			String dateHeureCreation) {
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = LocalDate.parse(dateNaissance);
		this.adresse = adresse;
		this.numeroSS = numeroSS;
		this.emailPro = emailPro;
		this.dateHeureCreation = ZonedDateTime.parse(dateHeureCreation);
		this.actif = true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public LocalDate getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(LocalDate dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getNumeroSS() {
		return numeroSS;
	}

	public void setNumeroSS(String numeroSS) {
		this.numeroSS = numeroSS;
	}

	public String getEmailPro() {
		return emailPro;
	}

	public void setEmailPro(String emailPro) {
		this.emailPro = emailPro;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public ZonedDateTime getDateHeureCreation() {
		return dateHeureCreation;
	}

	public void setDateHeureCreation(ZonedDateTime dateHeureCreation) {
		this.dateHeureCreation = dateHeureCreation;
	}

	public Boolean getActif() {
		return actif;
	}

	public void setActif(Boolean actif) {
		this.actif = actif;
	}
}

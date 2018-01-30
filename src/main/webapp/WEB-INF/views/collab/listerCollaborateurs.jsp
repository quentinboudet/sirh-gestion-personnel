<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SGP - App</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	  crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	  crossorigin="anonymous"></script>
	  
	<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	  crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</head>
<body class="ui">
  <header>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav">
          <a class="nav-item nav-link" href="log.html">LOG</a>
          <a class="nav-item nav-link" href="lister">Collaborateurs</a>
          <a class="nav-item nav-link" href="statistiques.html">Statistiques</a>
          <a class="nav-item nav-link" href="activites.html">Activites</a>
        </div>
      </div>
    </nav>
  </header>
  <section class="container">
    <div class="text-right">
      <a href="creer" class="btn btn-light">Ajouter un nouveau collaborateurs</a>
    </div>
    <h1 class="ui header center aligned">Les collaborateurs</h1>
    <form action="">
      <div class="form-group row align-items-center">
        <label class="col-md-3 col-12" for="form-collab">Rechercher un nom ou un prénom qui commence par:</label>
        <div class="col-md-3 col-12">
          <input class="col form-control" type="text" name="collaborateur" id="form-collab">
        </div>
        <div class="col-md-2 col-12">
          <input class="col btn" type="submit">
        </div>
        <input class="col-1" type="checkbox" value="voir-desactives" class="form-check-input" id="form-desa">
        <label class="col-md-3 col-11" for="form-desa">Voir les collaborateurs désactivés</label>
      </div>
      <div class="form-group row align-items-center">
        <label class="col-md-3 col-12" for="form-dep">Filtrer par département:</label>
        <div class="col-md-3 col-12">
          <select class="col form-control" name="departement" id="form-dep">
            <option>Tous</option>
            <option>Comptabilité</option>
            <option>Ressources Humaines</option>
            <option>Informatique</option>
          </select>
        </div>
      </div>
    </form>
  </section>
  <section class="container">
    <ul class="list-unstyled row"><%
		List<Collaborateur> collaborateurs = (List<Collaborateur>) request.getAttribute("collaborateurs");
		for (Collaborateur collab : collaborateurs) { %>
		  <li class="col-12 col-lg-6 col-xl-4 p-3">
	        <div class="card">
	          <h5 class="card-header"><%=collab.getNom() +" "+ collab.getPrenom()%></h5>
	          <div class="card-body">
	            <div class="media">
	              <img class="align-self-center mr-3" src="<%=request.getContextPath()%>/profile_thumb.png" alt="Generic placeholder image">
	              <div class="media-body">
			          <p class="d-flex justify-content-between">
			            <span>Adresse</span>
			            <span><%=collab.getAdresse()%></span>
			          </p>
			          <p class="d-flex justify-content-between">
			            <span>Mail</span>
			            <span><%=collab.getEmailPro()%></span>
			          </p>
			          <p class="d-flex justify-content-between">
			            <span>Date de naissance</span>
			            <span><%=collab.getDateNaissance()%></span>
			          </p>
			          <p class="d-flex justify-content-between">
			            <span>Numéro sécurité social</span>
			            <span><%=collab.getNumeroSS()%></span>
			          </p>
	              </div>
	            </div>
	          </div>
	          <div class="card-footer text-right">
	            <button class="btn btn-secondary">Editer</button>
	          </div>
	        </div>
	      </li>
		<% } %>
    </ul>
  </section>
</body>
</html>
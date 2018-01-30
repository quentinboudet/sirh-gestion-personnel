<%@page import="java.util.List"%>
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
    <h1 class="ui header center aligned mb-5">Nouveau collaborateur</h1>
    <form id="form-creer-collab" class="needs-validation col-10 offset-1" action="" method="post" novalidate  >
      <div class="form-group row">
        <label class="col-form-label col-md-3 col-12" for="form-nom">Nom</label>
        <div class="col-md-9 col-12">
          <input class="col form-control" type="text" name="nom" id="form-nom" required>
          <div class="invalid-feedback">
            Le nom est obligatoire
          </div>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-form-label col-md-3 col-12" for="form-prenom">Prénom</label>
        <div class="col-md-9 col-12">
          <input class="col form-control" type="text" name="prenom" id="form-prenom" required>
          <div class="invalid-feedback">
            Le prénom est obligatoire
          </div>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-form-label col-md-3 col-12" for="form-naissance">Date de naissance</label>
        <div class="col-md-9 col-12">
          <input class="col form-control" type="date" name="date-naissance" id="form-naissance" required>
          <div class="invalid-feedback">
            La date de naissance est obligatoire
          </div>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-form-label col-md-3 col-12" for="form-adresse">Adresse</label>
        <div class="col-md-9 col-12">
          <textarea class="col form-control" name="adresse" id="form-adresse" required></textarea>
          <div class="invalid-feedback">
            L'adresse est obligatoire
          </div>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-form-label col-md-3 col-12" for="form-ss">Numéro de sécurité social</label>
        <div class="col-md-9 col-12">
          <input class="col form-control" type="text" name="ss" id="form-ss" required>
          <div class="invalid-feedback">
            Le numéro de sécurité social est obligatoire
          </div>
        </div>
      </div>
      <div class="form-group row justify-content-end">
        <button class="btn btn-dark px-4 mx-3" type="">Créer</button>
      </div>
    </form>
  </section>
  <section class="container card col-12 col-md-8 offset-md-2 p-0" id="confirm-creer">
    <h5 class="card-header text-center">Création d'un collaborateur</h5>
    <div class="card-body">
      <p class="d-flex justify-content-between">
        <span>Nom</span>
        <span id="confirm-nom" class="confirm-info" rel="form-nom"></span>
      </p>
      <p class="d-flex justify-content-between">
        <span>Prénom</span>
        <span id="confirm-prenom" class="confirm-info" rel="form-prenom"></span>
      </p>
      <p class="d-flex justify-content-between">
        <span>Date de naissance</span>
        <span id="confirm-naissance" class="confirm-info" rel="form-naissance"></span>
      </p>
      <p class="d-flex justify-content-between">
        <span>Addresse</span>
        <span id="confirm-addresse" class="confirm-info" rel="form-addresse"></span>
      </p>
      <p class="d-flex justify-content-between">
        <span>Numéro de sécurité social</span>
        <span id="confirm-ss" class="confirm-info" rel="form-ss"></span>
      </p>
    </div>
    <div class="card-footer text-center p-0">
      <button id="confirm-annuler" class="btn btn-secondary px-4 mx-2">Annuler</button>
      <button id="confirm-ok" class="btn btn-secondary px-4 mx-2">Confirmer</button>
    </div>
  </section>
</body>
<script src="<%=request.getContextPath()%>/myscript.js"></script>
</html>
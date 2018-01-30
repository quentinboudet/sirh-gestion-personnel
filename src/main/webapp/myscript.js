
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
    //confirmation de création d'un collaborateur
    
    $CC = $("#confirm-creer");
    $CInfos = $CC.find(".confirm-info");
    $FCC = $("#form-creer-collab");
    $FCInfos = $FCC.find(".form-control");
    $CC.find("#confirm-annuler").click(function(){
      $CC.removeClass('show');
    });
    $FCC.on('submit', function(e){
      e.preventDefault();
      if($FCC[0].checkValidity() === true){
        $CC.addClass('show');
        $CInfos.each(function(){
          $t = $(this);
          $t.text($FCInfos.eq($CInfos.index($t)).val());
        });
      }
    });
    $CC.find("#confirm-ok").click(function(){
    	$FCC.unbind().submit();
	});

    //voir formulaire non valide
    if(location.search == "?errors"){
      $FCC.addClass("was-validated");
    }

  }, false);
})();
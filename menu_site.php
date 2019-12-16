<head>
    <?php
    require("vue/header.php")
    ?>
    <link rel="stylesheet" href="./css/index.css">
</head>
<header>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:162%;">
  <a class="navbar-brand" href="menu_site.php?page=1"><img class="logo" src="./image/corsair.png"> </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" style="color: black;" href="menu_site.php?page=2">Vols</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color: black;" href="menu_site.php?page=3">Hébergement</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color: black;" href="menu_site.php?page=4">Location</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color: black;"href="menu_site.php?page=5">Promotion</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color: black;"href="menu_site.php?page=6">Carte Bleu</a>
      </li>
    </ul>
    <button class="btn btn-danger my-2 my-sm-0"><a id="deco" style="color: black;" href="menu_site.php?page=7">Compte Client</a></button>
    <button class="btn btn-danger my-2 my-sm-0"><a id="deco" style="color: black;" href="menu_site.php?page=8">Déconnexion</a></button>
  </div>
</nav>
 
    
<br>
      <br>
      <!-- router -->
      <?php
        if(isset($_GET['page'])) {
          $page = $_GET['page'];
        }
        else {
          $page = 0;
        }
        switch($page) {
          case 1 : require_once ("./vue/reserver.php");
          break;
          case 2 : require_once ("gestionvol.php");
          break;
          case 3 : require_once ("gestionlogement.php");
          break;
          case 4 : require_once ("gestionlocation.php");
          break;
          case 5 : require_once ("gestionpromotion.php");
          break;
          case 6 : require_once ("gestioncb.php");
          break;
          case 7 : require_once ("gestionclient.php");
          break;
          case 8 : require_once ("model/deconnexion.php");
          break;
        }
       ?>

  </nav>
</header>

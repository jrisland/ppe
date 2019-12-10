<br>
<br>
<body class="bg-dark">
     <h2 class="text-white"><ins>Liste des Cartes bleus</ins></h2>
    <br>
    <br>
    <?php
    if(isset($_SESSION['nom']) == null) {
      header('Location: index.php');
    }
        echo "<div class='container'";
                echo "<div class='row'>";
      require_once ("controler/controler.php");
      // instanciation de la classe controler
      $unControler = new Controler("localhost", "ppe", "root", "");
              echo "<div class ='col-4' >";
            require_once ("vue/cb_insert.php");
            if(isset($_POST['Valider'])){
              $unControler->insertCb($_POST);
            }
            echo "</br>";
            echo "</div>";
            echo "<div class='col-4'";
            require_once ("vue/cb_delete.php");
            if(isset($_POST['Supprimer'])) {
              $unControler->deleteCb($_POST['idcb']);
            }
            echo "</div>";
            echo "</br>";

      // Appel de la methode du controler
      echo "<div class='col-4'>";
      $result = $unControler->selectCb();
      require_once ("vue/cb.php");
      echo "</div>";
      echo "</div>";
      echo "</div>";
     ?>
</div>
</body>
</html>

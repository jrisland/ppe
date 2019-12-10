<br>
<br>
<body class="bg-dark">
<div class="container" style="width: 50%; margin: auto; padding-top: 2%;">
    <h2 class="text-white"><ins>Liste des Hébergement</ins></h2>
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
    require_once ("vue/logement_insert.php");
    if(isset($_POST['Valider'])){
        $unControler->insertLogement($_POST);
    }
    echo "</br>";
    echo "</div>";
    echo "<div class='col-4'";
    require_once ("vue/logement_delete.php");
    if(isset($_POST['Supprimer'])) {
        $unControler->deleteLogement($_POST['idvol']);
    }

    echo "</div>";
    echo "</br>";

    // Appel de la methode du controler
    echo "<div class='col-4'>";
    $result = $unControler->selectLogement();
    require_once ("vue/logement.php");
    echo "</div>";
    echo "</div>";
    echo "</div>";
    ?>
</div>
</body>
</html>

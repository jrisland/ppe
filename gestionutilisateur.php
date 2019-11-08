<br>
<br>
<body class="bg-white">
<div class="container" style="width: 50%; margin: auto; padding-top: 2%;">
    <h2 class="text-white"><ins>Liste des Utilisateurs</ins></h2>
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
    $unControler = new Controler("localhost", "dm", "root", "");
    echo "<div class ='col-4' >";
    require_once ("vue/user_insert.php");
    if(isset($_POST['Valider'])){
        $unControler->insertUser($_POST);
    }
    echo "</br>";
    echo "</div>";
    echo "<div class='col-4'";
    require_once ("vue/user_delete.php");
    if(isset($_POST['Supprimer'])) {
        $unControler->deleteUser($_POST['idcategorie']);
    }
    echo "</div>";
    echo "</br>";

    // Appel de la methode du controler
    echo "<div class='col-4'>";
    $result = $unControler->selectUser();
    require_once ("vue/user.php");
    echo "</div>";
    echo "</div>";
    echo "</div>";
    ?>
</div>
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br>
<br>
<body class="bg-dark">
<div class="col-sm-0 col-md-2 col-lg-3"></div>
<div class="col-sm-12 col-md-8 col-lg-6">
<div class="form-group">
    <input class="form-control" type="text" id="search" value="" placeholder="Recherche"/>
</div>
</div>
<div class="container" style="width: 50%; margin: auto; padding-top: 2%;">
    <h2 class="text-white"><ins>Liste des Clients</ins></h2>
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
    require_once ("vue/client_insert.php");
    if(isset($_POST['Valider'])){
        $unControler->insertClient($_POST);
    }
    echo "</br>";
    echo "</div>";
    echo "<div class='col-4'";
    require_once ("vue/client_delete.php");
    if(isset($_POST['Supprimer'])) {
        $unControler->deleteClient($_POST['idclient']);
    }
    echo "</div>";
    echo "</br>";

    // Appel de la methode du controler
    echo "<div class='col-4'>";
    $result = $unControler->selectClient();
    require_once ("vue/client.php");
    echo "</div>";
    echo "</div>";
    echo "</div>";
    ?>

<script>
        $(document).ready(function() {
            $('#search').keyup(function(){
                alert('ok');
                
                var client = $(this).val();

                console.log(client);
            });
        });
    </script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</div>
</body>
</html>

<?php
class Model {
  private $unPdo;
  public function __construct($server, $bdd, $user, $mdp) {
    $this->unPdo = null;
      try {
      // connection a la base de donnee en utilisant PDO
      $this->unPdo = new PDO ("mysql:host=".$server.";dbname=".$bdd,$user,$mdp);
    }
    catch(PDOExeption $exp) {
      echo "Erreur de connection à la base de données.";

      // afficher le message d'erreur php
      echo $exp->getMessage();
    }
  }

  public function verifConnexion ($email, $mdp) {
    if ($this->unPdo != null) {
      $requete = "select * from client where email = :email and mdp = :mdp;";
      $donnees = array(":email"=>$email, ":mdp"=>$mdp);
      $select = $this->unPdo->prepare($requete);
      $select->execute($donnees);
      $result = $select->fetch();
      return $result;
    }
  }

  public function redirect() {
    header('../gestionproduit.php');
  }

  public function selectAll() {
      if($this->unPdo != null) {
      // selection de toutes les données
        $requete="select p.idproduit, p.designation, p.prix, . p.quantite, c.libelle from produit p, categorie c where p.idcategorie = c.idcategorie;";
      // preparation de la requete avant execution
      $select = $this->unPdo->prepare($requete);

      // exection de la requete
      $select->execute();

      // extraction des données
      $result = $select->fetchAll();
      return $result;
    }
  }
    
    public function inscription($tab){
        if($this->unPdo!=null){
            $requete="insert into client values(null,:nom, :prenom, :adresse, :email, null, null, :tel, :mdp);";
            $donnees=array(":nom"=>$tab['nom'],
                           ":prenom"=>$tab['prenom'],
                           ":adresse"=>$tab['adresse'],
                           ":email"=>$tab['email'],
                           ":tel"=>$tab['tel'],
                           ":mdp"=>$tab['mdp']);
            $insert=$this->unPdo->prepare($requete);
            $insert->execute($donnees);
        }
    }
  
  public function insertObjet($tab) {
    if ($this->unPdo != null) {
      $requete = "insert into objet values (null, :type, :designation, :point);";
      $donnees = array(":type"=>$tab['type'],
                        ":designation"=>$tab['designation'],
                       ":point"=>$tab['point']);
      $insert = $this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function selectObjet(){
    $requete="select * from objet;"; 
    $select= $this->unPdo->prepare($requete);
    $select->execute();
    $resultats = $select->fetchAll();
    return $resultats;
  }


  public function deleteObjet ($idobjet) {
    if ($this->unPdo != null) {
      $requete = "delete from objet where idobjet = ".$idobjet.";";
      $donnees = array(":idobjet"=>$idobjet);
      $delete = $this->unPdo->prepare($requete);
      $delete->execute($donnees);
    }
  }



  public function insertCategorie($tab){
    if($this->unPdo!=null){
      $requete="insert into categorie values(null,:libelle)";
      $donnees=array(":libelle"=>$tab['libelle']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }


  public function deleteCategorie($idcategorie){
    if($this->unPdo!= null){
      $requete="delete from categorie where idcategorie = :idcategorie;";
      $donnees=array(":idcategorie"=>$idcategorie);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }

  public function selectCategorie(){
    $requete="select * from categorie;";
    //preparation de la requete avant execution
    $select= $this->unPdo->prepare($requete);
    //execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }


  public function selectUtilisateur() {
    $requete="select * from utilisateur;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertUtilisateur($tab){
    if($this->unPdo!=null){
      $requete="insert into utilisateur values(null,:login :mdp :nom :prenom)";
      $donnees=array(":login"=>$tab['login'], ":mdp"=>$tab['mdp'], ":nom"=>$tab['nom'], ":prenom"=>$tab['prenom']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteUtilisateur($iduser){
    if($this->unPdo!= null){
      $requete="delete from utilisateur where iduser = :iduser;";
      $donnees=array(":iduser"=>$iduser);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);


    }
  }
	  public function selectVol() {
    $requete="select * from vol;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertVol($tab){
    if($this->unPdo!=null){
      $requete="insert into vol values(null,:idvol, :nom, :datedepart, :datearrivee, :heurearrivee)";
      $donnees=array(":idvol"=>$tab['idvol'], ":nom"=>$tab['nom'], ":datedepart"=>$tab['datedepart'], ":datearrivee"=>$tab['datearrivee'], ":heurearrivee"=>$tab['heurearrivee']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteVol($idvol){
    if($this->unPdo!= null){
      $requete="delete from vol where idvol = :idvol;";
      $donnees=array(":idvol"=>$idvol);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }


  // fin de la classe
}
?>

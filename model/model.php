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
          $requete="insert into client values(null,:nom, :prenom, :adresse, :email, NULL, :tel, :mdp);";
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
  
    //client
  public function selectClient() {
    $requete="select * from client;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données           
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertClient($tab){
    if($this->unPdo!=null){
      $requete="insert into client values(null,:idclient, :nom, :prenom, :adresse, :email, :numero_passeport, :tel, :mdp, :age)";
      $donnees=array(":idclient"=>$tab['idclient'], 
                     ":nom"=>$tab['nom'], ":prenom"=>$tab['prenom'], 
                     ":adresse"=>$tab['adresse'], 
                     ":email"=>$tab['email'], 
                     ":numero_passseport"=>$tab['numero_passeport'], 
                     ":tel"=>$tab['tel'], 
                     ":mdp"=>$tab['mdp'], 
                     ":age"=>$tab['age']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteClient($idclient){
    if($this->unPdo!= null){
      $requete="delete from client where idclient = :idclient;";
      $donnees=array(":idclient"=>$idclient);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);
    }
  }

  //vol
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
      $donnees=array(":idvol"=>$tab['idvol'], 
                     ":nom"=>$tab['nom'], 
                     ":datedepart"=>$tab['datedepart'], 
                     ":datearrivee"=>$tab['datearrivee'], 
                     ":heurearrivee"=>$tab['heurearrivee']);
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
  //cb
  	public function selectCb() {
    $requete="select * from cb;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertCb($tab){
    if($this->unPdo!=null){
      $requete="insert into vol values(null,:idcb, :nom, :numero, :datevalidite, :idclient)";
      $donnees=array(":idcb"=>$tab['idcb'], 
      ":nom"=>$tab['nom'], 
      ":numero"=>$tab['numero'], 
      ":datevalidite"=>$tab['datevalidite'],  
      ":idclient"=>$tab['idclient']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteCb($idcb){
    if($this->unPdo!= null){
      $requete="delete from cb where idcb = :idcb;";
      $donnees=array(":idcb"=>$idcb);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }

  //location
  public function selectLocation() {
    $requete="select * from location;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertLocation($tab){
    if($this->unPdo!=null){
      $requete="insert into location values(:imatriculation, :n_parking, :statut, :datedebut, :datefin, :prix, :idservice)";
      $donnees=array(":immatriculation"=>$tab['immatriculation'], 
      ":n_parking"=>$tab['n_parking'], 
      ":statut"=>$tab['statut'], 
      ":datedebut"=>$tab['datedebut'], 
      ":datefin"=>$tab['datefin'], 
      ":prix"=>$tab['prix'], 
      ":iservice"=>$tab['idservice']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteLocation($idservice){
    if($this->unPdo!= null){
      $requete="delete from location where idservice = :idservice;";
      $donnees=array(":idservice"=>$idservice);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }

  //logement
  public function selectLogement() {
    $requete="select * from logement;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertLogement($tab){
    if($this->unPdo!=null){
      $requete="insert into logement values(:idservice, :adresse, :datedebut, :datefin, :nettoyage, :propriétaire, :surface, :prix)";
      $donnees=array(":idservice"=>$tab['idservice'], 
      ":adresse"=>$tab['adresse'], 
      ":datedebut"=>$tab['datedebut'], 
      ":datefin"=>$tab['datefin'], 
      ":nettoyage"=>$tab['nettoyage'], 
      ":propriétaire"=>$tab['propriétaire'], 
      ":surface"=>$tab['surface'], 
      ":prix"=>$tab['prix']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deleteLogement($idservice){
    if($this->unPdo!= null){
      $requete="delete from logement where idservice = :idservice;";
      $donnees=array(":idservice"=>$idservice);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }

  //promotion
  public function selectPromotion() {
    $requete="select * from promotion;";
    // preparation de la requete avant execution
    $select=$this->unPdo->prepare($requete);
    // execution de la requete
    $select->execute();
    //extraction des données
    $resultats = $select->fetchAll();
    return $resultats;
  }

  public function insertPromotion($tab){
    if($this->unPdo!=null){
      $requete="insert into promotion values(:idservice, :pourcentage)";
      $donnees=array(":idservice"=>$tab['idservice'], 
      ":pourcentage"=>$tab['pourcentage']);
      $insert=$this->unPdo->prepare($requete);
      $insert->execute($donnees);
    }
  }

  public function deletePromotion($idservice){
    if($this->unPdo!= null){
      $requete="delete from promotion where idservice = :idservice;";
      $donnees=array(":idservice"=>$idservice);
      $delete=$this->unPdo->prepare($requete);
      $delete->execute($donnees);

    }
  }

  // fin de la classe
}
?>

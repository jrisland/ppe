<?php
  // Appel le model
require_once("model/model.php");

class controler {
    private $unModel;

    public function __construct ($server, $bdd, $user, $mdp) {
      // instantiation de la classe model
      $this->unModel = new Model ($server, $bdd, $user, $mdp);
    }

    public function selectProduits() {
      $result = $this->unModel->selectAll();
      //on peut resaliser des traitements avant affichage
      return $result;
    }

    public function verifConnexion($email, $mdp) {
      return $this->unModel->verifConnexion($email, $mdp);
    }

    public function inscription($tab) {
        $this->unModel->inscription($tab);
    }
    

    public function selectVol() {
        return $this->unModel->selectVol();

    }

    public function insertVol($tab) {
        $this->unModel->insertVol($tab);
    }

    public function deleteVol($idvol) {
        $this->unModel->deleteVol($idvol);
    } 


    public function selectCb() {
        return $this->unModel->selectCb();
    }

    public function insertCb($tab) {
        $this->unModel->insertCb($tab);
    }

    public function deleteCb($idcb) {
        $this->unModel->deleteCb($idcb);
    }


    public function selectLogement() {
        return $this->unModel->selectLogement();
    }

    public function insertLogement($tab) {
        $this->unModel->insertLogement($tab);
    }

    public function deleteLogement($idservice) {
        $this->unModel->deleteLogement($idservice);
    }


    public function selectPromotion() {
        return $this->unModel->selectPromotion();
    }

    public function insertPromotion($tab) {
        $this->unModel->insertPromotion($tab);
    }

    public function deletePromotion($idservice) {
        $this->unModel->deletePromotion($idservice);
    }


    public function selectLocation() {
        return $this->unModel->selectLocation();
    }
    public function insertLocation($tab) {
        $this->unModel->insertLocation($tab);
    }

    public function deleteLocation($idservice) {
        $this->unModel->deleteLocation($idservice);
    }


    public function selectClient() {
        return $this->unModel->selectClient();
    }
    public function insertClient($tab) {
        $this->unModel->insertClient($tab);
    }

    public function deleteClient($idclient) {
        $this->unModel->deleteClient($idclient);
    }
}
?>

<?php
echo '
<table class="table table-white">
    <thead>
        <tr>
            <th class="scope-col">Id Client</th>
            <th class="scope-col">Nom</th>
            <th class="scope-col">Prenom</th>
            <th class="scope-col">Adresse</th>
            <th class="scope-col">Email</th>
            <th class="scope-col">Numero de passeport</th>
            <th class="scope-col">Téléphone</th>
            <th class="scope-col">Mot de pass</th>
            <th class="scope-col">Age</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['idclient']."</td>
      <td>".$unResultat['nom']."</td>
      <td>".$unResultat['prenom']."</td>
      <td>".$unResultat['adresse']."</td>
      <td>".$unResultat['email']."</td>
      <td>".$unResultat['numero_passeport']."</td>
      <td>".$unResultat['tel']."</td>
      <td>".$unResultat['mdp']."</td>
      <td>".$unResultat['age']."</td>
    </tr>";
}
echo "</table>";
?>
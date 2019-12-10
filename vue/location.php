<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Immatriculation</th>
            <th class="scope-col">Numéro de parking</th>
            <th class="scope-col">Statut</th>
            <th class="scope-col">Date de debut</th>
            <th class="scope-col">Date de fin</th>
            <th class="scope-col">Prix</th>
            <th class="scope-col">Id Service</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['immatriculation']."</td>
      <td>".$unResultat['n_parking']."</td>
      <td>".$unResultat['statut']."</td>
      <td>".$unResultat['datedebut']."</td>
      <td>".$unResultat['datefin']."</td>
      <td>".$unResultat['prix']."</td>
      <td>".$unResultat['idservice']."</td>
    </tr>";
}
echo "</table>";
?>

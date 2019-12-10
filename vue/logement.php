<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Id Service</th>
            <th class="scope-col">Adresse</th>
            <th class="scope-col">Date de debut</th>
            <th class="scope-col">Date de fin</th>
            <th class="scope-col">Nettoyage</th>
            <th class="scope-col">Propriétaire</th>
            <th class="scope-col">Surface</th>
            <th class="scope-col">Prix</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['idservice']."</td>
      <td>".$unResultat['adresse']."</td>
      <td>".$unResultat['datedebut']."</td>
      <td>".$unResultat['datefin']."</td>
      <td>".$unResultat['nettoyage']."</td>
      <td>".$unResultat['proprietaire']."</td>
      <td>".$unResultat['surface']."</td>
      <td>".$unResultat['prix']."</td>
    </tr>";
}
echo "</table>";
?>

<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Id Vol</th>
            <th class="scope-col">Nom</th>
            <th class="scope-col">Date de depart</th>
            <th class="scope-col">Date arrivée</th>
            <th class="scope-col">heure arrivée<</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['idvol']."</td>
      <td>".$unResultat['nom']."</td>
      <td>".$unResultat['datedepart']."</td>
      <td>".$unResultat['datearrivee']."</td>
      <td>".$unResultat['heurearrivee']."</td>
    </tr>";
}
echo "</table>";
?>
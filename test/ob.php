<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Id Objet</th>
            <th class="scope-col">type</th>
            <th class="scope-col">libelle</th>
            <th class="scope-col">Points</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
      "<tr>
      <td>".$unResultat['idobjet']."</td>
      <td>".$unResultat['type']."</td>
      <td>".$unResultat['libelle']."</td>
      <td>".$unResultat['points']."</td>
    </tr>";
}
echo "</table>";
?>
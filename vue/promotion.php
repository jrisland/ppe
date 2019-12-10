<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Id Service</th>
            <th class="scope-col">Pourcentage</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['idservice']."</td>
      <td>".$unResultat['pourcentage']."</td>
    </tr>";
}
echo "</table>";
?>

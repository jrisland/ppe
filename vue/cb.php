<?php
echo '
<table class="table table-dark">
    <thead>
        <tr>
            <th class="scope-col">Id CB</th>
            <th class="scope-col">Nom</th>
            <th class="scope-col">Numero</th>
            <th class="scope-col">Date Validite</th>
            <th class="scope-col">Crypto Monnaie</th>
            <th class="scope-col">Id client</th>
        </tr>
    </thead>
';
foreach ($result as $unResultat) {
    echo
        "<tr>
      <td>".$unResultat['idcb']."</td>
      <td>".$unResultat['nom']."</td>
      <td>".$unResultat['numero']."</td>
      <td>".$unResultat['datevalidite']."</td>
      <td>".$unResultat['crypto']."</td>
      <td>".$unResultat['idclient']."</td>
    </tr>";
}
echo "</table>";
?>

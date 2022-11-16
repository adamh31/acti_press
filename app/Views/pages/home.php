
<link rel="stylesheet" href="/inc/marge_gauche.css">

<body class="marge_gauche">
  <button class="custom-btn btn-4"><span>ActiPress</span></button><br>
  <button class="custom-btn btn-4"><span>Nouveau Message</span></button><br>
  <button class="custom-btn btn-4"><span>Boîte de réception </span></button><br>
  <button class="custom-btn btn-4"><span>Messages envoyées </span></button>
  </body>
  <?php

{
?>
<h1>Envoyer un message privé!</h1>
<form action="message.php" method="post">
<input type="text" name="destinataire" placeholder="mail du destinataire">
<input type="text" name="titre" placeholder="Titre du message">
<input type="text" name="message" placeholder="Contenu du message">
<input type="submit" name="submit" value="Envoyer">
</form>


<?php
if(isset($_POST['submit']))
{
    $destinataire = $_POST['destinataire'];
    $titre = $_POST['titre'];
    $message = $_POST['message'];
 
    $requete = $bdd->prepare('SELECT * FROM infos_perso WHERE login = :destinataire');
    $requete->execute(array('destinataire' => $destinataire));
    $donnees = $requete->fetch();
    $requete->CloseCursor();
if(!$donnees)
{
    echo "Identifiant introuvable";
}
elseif($donnees)
{
    $requete2 = $bdd->prepare('INSERT INTO messages(id_expe, id_dests, titre, contenu) VALUES(?,?,?,?)');
    $requete2->execute(array($_SESSION['id'], $donnees['id'], $titre, $message));
    $requete2->CloseCursor();
    echo "Message envoyé!";
}
else
{
    echo "Une erreur est survenue.";
}
}
}
?>
}
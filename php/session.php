<?php 

session_start();
// on démarre la session et on file le cookie    
$_SESSION['pseudo'] = null;
if (!empty($_POST['message'])) {
			$_SESSION['pseudo'] = htmlspecialchars($_POST['message']);
		} else {
			$_SESSION['pseudo'] = "anonymous";
		}

setcookie('pseudo', $_SESSION['pseudo'], time() + 365*24*3600);

echo json_encode($_POST['message']);
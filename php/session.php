<?php 

session_start();
// on démarre la session et on file le cookie    
$_SESSION['pseudo'] = null;
if (!empty($_POST['message'])) {
			$_SESSION['pseudo'] = htmlspecialchars($_POST['message']);
		} else {
			$_SESSION['pseudo'] = "anonymous";
		}

		// echo json_encode($_POST['message']);
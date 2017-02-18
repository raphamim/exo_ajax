<?php 

session_start();
$_SESSION['pseudo'] = null;
if (!empty($_POST['message'])) {
			$_SESSION['pseudo'] = $_POST['message'];
		} else {
			$_SESSION['pseudo'] = "anonymous";
		}
		echo json_encode($_POST['message']);
		
// Class Ajax {

// 	public function sendCookie(){
		
// 	}
// }

// $ajax = new Ajax();
// $ajax->sendCookie();
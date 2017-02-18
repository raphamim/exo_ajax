<?php 
//On appelle la def de la base
include '../partial/pdo.php';

// on demarre la session pour récuperer le cookie
session_start();
// echo $_SESSION['pseudo'];



 Class Ajax {
 

 	// on recup les données de la bdd
	public function getMessage() {
			 	try {
					$pdo = new PDO(DSN, USER, MDP);
				} catch (Exception $e) {
					echo 'La bdd est indisponible';
				}


			$query = 'SELECT * FROM message';

			$result = $pdo->query($query);

			$datas = json_encode($result->fetchAll(PDO::FETCH_OBJ));
			$file = fopen('message.json', 'w+');
			 // fseek($file, O);
			 fwrite($file, $datas);
			 fclose($file);	
 	}
 	// on envoie les données vers la bdd
 	public function sendMessage() {
 		$author = $_SESSION['pseudo'];
 		$content = $_POST['message'];
 		$now = date("Y-m-d H:i:s");

 			try {
				$pdo = new PDO(DSN, USER, MDP);
			} catch (Exception $e) {
				echo 'La bdd est indisponible';
			}

		if ( !empty($_POST['message']) ) {
			// POUR TESTER
			// echo json_encode($_POST['message']);
			// INSERE DS LA BDD
				$sent= $pdo->prepare('INSERT INTO `message` ( `author`, `content`, `date_mess`) VALUES ( :author, :content, :date_mess)' );
				$sent->execute(array(
						'author' => $author,
						'content' =>  $content,
						'date_mess' => $now
					));
				self::getMessage();
		}

	}

 	

 }
 
$ajax = new Ajax();
$ajax->getMessage();
$ajax->sendMessage();
	



<?php 


define('DSN', 'mysql:host=localhost;dbname=chat');
define('USER', 'root');
define('MDP', '');

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




 Class Ajax {
 	public function sendMessage() {
 		$author = 'userTest';
 		$content = $_POST['message'];
 		$now = date("Y-m-d H:i:s");

 			try {
				$pdo = new PDO(DSN, USER, MDP);
			} catch (Exception $e) {
				echo 'La bdd est indisponible';
			}

		if ( !empty($_POST['message']) ) {
				$sent= $pdo->prepare('INSERT INTO `message` ( `author`, `content`, `date_mess`) VALUES ( :author, :content, :date_mess' );
				$sent->execute(array(
						'author' => $author,
						'content' =>  $content,
						'date_mess' => $now
					));
		}
		
 	}

 	// public function getMessage() {
			 		
 	// }

 }
	$ajax = new Ajax();
 $ajax->sendMessage();
	



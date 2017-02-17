
<?php 


// $pdo = new PDO('mysql:host=localhost;dbname=music', 'root', '');
define('DSN', 'mysql:host=localhost;dbname=chat');
define('USER', 'root');
define('MDP', '');

try {
	$pdo = new PDO(DSN, USER, MDP);
} catch (Exception $e) {
	echo 'La bdd est indisponible';
}
// $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ATTR_SILENT);
// $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ATTR_WARNING);
// $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ATTR_EXCEPTION);

$query = 'SELECT * FROM message';

$result = $pdo->query($query);



$datas = json_encode($result->fetchAll(PDO::FETCH_OBJ));
echo $datas;

 // foreach ($datas as $line) {

 // 	echo '<div><p>'.json_encode($line->author).'</p>';
 // 	echo '<p>'.json_encode($line->content).'</p></div>';
 // }

		

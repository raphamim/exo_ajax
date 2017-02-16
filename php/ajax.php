<?php

session_start();
//session_destroy();

$botResponses = array(
    array(
        0 => array(
            array('salut'),
            array('bonjour'),
            array('hello')
        ),
        1 => array(
            'Bonjour, je suis le BOT SDW. Comment allez-vous ?',
            'Salut mon pote, je suis le Bot !',
            'Hi, How are you ?'
        )
    ),
    array(
        0 => array(
            array('quelle', 'heure'),
            array('what', 'time'),
            array('Quelle heure est-il ?')
        ),
        1 => array(
            'Il est '.date('H:i:s').' heures',
            'L\'heure qu\'il était hier à la même heure',
            'L\'heure de t\'acheter une montre'
        )
    ),
);

class Ajax
{
    private function getBotMessage($userMessage){

        global $botResponses;                       // On ajoute global pour aller chercher une variable déclarée en dehors de la fonction

        $response = false;
        foreach($botResponses as $botResponse){     // Dans $botResponse[0] on a les reponses utilisateur, et dans [1] celles du bot
            foreach ($botResponse[0] as $userResponse){
                $nbToHave = count($userResponse);
                $nbHaving = 0;
                $arrayUserMessage = explode(' ', $userMessage);
                foreach($arrayUserMessage as $partMessage){
                    if (in_array($partMessage, $userResponse)){
                        $nbHaving++;
                    }
                }
                if ($nbToHave === $nbHaving){
                    $random = rand(0, count($botResponse[1])-1);
                    $_SESSION['messages'][] = array(
                        'type' => 'bot',
                        'message' => $botResponse[1][$random]
                    }
//                if (/*false !== strpos(strtolower($userMessage), */in_array($userResponse, explode(' ', $userMessage))){
//                    $random = rand(0, count($botResponse[1])-1);
//                    $_SESSION['messages'][] = array(
//                        'type' => 'bot',
//                        'message' => $botResponse[1][$random]
//                    );
//                    $response = true;
//                    break;
//
                if (true === $response){
                    break;
                }
            }
        }
        if (false === $response){
            $_SESSION['messages'][] = array(
                'type' => 'bot',
                'message' => 'Hum...'
            );
        }
    }

    public function sendMessage($post){
        if (empty($post['message']) || ctype_space($post['message'])){
            return $_SESSION['messages'];
        }

        $_SESSION['messages'][] = array(
            'type' => 'user',
            'message' => $post['message']
        );
        $this->getBotMessage($post['message']);
        return $_SESSION['messages'];
    }

    public function getMessages($post){
        return $_SESSION['messages'];
    }
}

$ajax = new Ajax();
if (method_exists($ajax, $_POST['function'])){
    $f = $_POST['function'];
    echo json_encode($ajax->$f($_POST));
}
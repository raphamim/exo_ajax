// ajout de chaque element json
function appendMessage(element) {
 $('#chat-block').append($('<div class="messages"><h3>'+ element.author +'</h3><em>'+element.date_mess+'</em><p>'+element.content+'</p>'));
}

//requête pour envoyer le pseudo
function sendCookie() {
	$.ajax({
		url: "php/session.php",
		data: {
			message: $('#pseudo').val(),
			function: 'sendCookie'
		},
		method: "POST"
	}).done(function(data){
	
		// console.log('envoi du cookie ok !');
		$('#welcome').hide();
		$('#chat').show();
		// console.log(data);
	}).fail(function(){
		console.log('erreur envoie du cookie');
	});
}

// recupération des données 
function getDatas() {
	$.ajax({
		url: "php/ajax.php",
		data: {
			function: 'getMessage'
		}
	}).done(function(data){
		// console.log(data);
	}).fail(function(){
		console.log('fail');
	});
}

// rafraichir les données lorsqu'on arrive sur la page
function refreshDatas() {
	$.ajax({
		url: "php/message.json",
		dataType: 'json'
	}).done(function(data){
		// console.log(data[0].author);
		$.each(data, function(index, element){
			appendMessage(element);
		});
	}).fail(function(){
		console.log('fail');
	});
}

// ajout du dernier message + scroll du bas
function showLastDatas() {
	$.ajax({
		url: "php/message.json",
		dataType: 'json'
	}).done(function(data){
		getDatas();
		var last = data[data.length-1];
		console.log(last);
		appendMessage(last);
		$("#chat-block").animate({ scrollTop: $('#chat-block').prop("scrollHeight")}, 500);
	}).fail(function(){
		console.log('fail');
	});
}

// on envoie les données du message dans la base pour rentrer dans la base sql+être écrit dans le json
function sendDatas() {
	$.ajax({
		url: "php/ajax.php",
		data: {
			message: $('#message').val(),
			function: 'sendMessage'
		},
		method: "POST"

	}).done(function(data){
		// console.log(data);
		showLastDatas();
	}).fail(function(){
		console.log('erreur envoies de données');
	});
}

getDatas();
refreshDatas();

$(document).ready(function() {

	$('#pseudo').keypress(function(event) {
		if (event.keyCode == 13) {
			//verif si les cookies sont pas désactivé
			if (navigator.cookieEnabled) {
					$('#welcome img').animate({ 'width': '-=40%'}, 5000);
					$('#welcome h1').animate({ 'border-bottom-left-radius': '+=100%', 'border-bottom-right-radius': '+=100%'}, 2000);
					// $('#welcome h1').animate({ 'border-bottom-right-radius': '+=100%'}, 2000);
					setTimeout(sendCookie, 2000);
					// console.log('cookies autorisés');
			} else {
				alert('Veuillez activer vos cookies pour continuer !');
			}
		}
	});


	$('#message').keypress(function(event) {
		if (event.keyCode == 13) {
			
			
			sendDatas();
			//vider le champs
			$('#message').val('');
		}
	});
});




 









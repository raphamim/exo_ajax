function refreshDatas() {
	$.ajax({
		url: "php/ajax.php",
		data: {
			function: 'getMessage'
		}
	}).done(function(data){
		console.log('reussi');
	}).fail(function(){
		console.log('fail');
	});
}
function showDatas() {
	$.ajax({
		url: "php/message.json",
		dataType: 'json'
	}).done(function(data){
		// console.log(data[0].author);
		$.each(data, function(index, element){
			$('#chat-block').append($('<div class="messages"><h3>'+ element.author +'</h3><em>'+element.date_mess+'</em><p>'+element.content+'</p>'));
		});
	}).fail(function(){
		console.log('fail');
	});
}
function sendDatas() {
	$.ajax({
		url: "php/ajax.php",
		data: {
			message: $('#message').val(),
			function: 'sendMessage'
		},
		method: "POST"

	}).done(function(data){
		console.log('envoie des données reussi');


	}).fail(function(){
		console.log('erreur envoies de données');
	});

}

refreshDatas();



$(document).ready(function() {
	
showDatas();

	$('#message').keypress(function(event) {
		if (event.keyCode == 13) {
			sendDatas();

		}
	});

});




 









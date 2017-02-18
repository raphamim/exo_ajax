function appendMessage(element) {
 $('#chat-block').append($('<div class="messages"><h3>'+ element.author +'</h3><em>'+element.date_mess+'</em><p>'+element.content+'</p>'));
}

function getDatas() {
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

function showLastDatas() {
	$.ajax({
		url: "php/message.json",
		dataType: 'json'
	}).done(function(data){
		// console.log(data[0].author);
		getDatas();
		var last = data[data.length-1];
		console.log(last);
		appendMessage(last);
		$("#chat-block").animate({ scrollTop: $('#chat-block').prop("scrollHeight")}, 500);

		
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
		console.log(data);
		showLastDatas();

		// var last = data[0];
		// appendMessage(last);
		// $("#chat-block").animate({ scrollTop: $('#chat-block').prop("scrollHeight")}, 500);
		// showLastDatas;
		
		

	}).fail(function(){
		console.log('erreur envoies de données');
	});

}
getDatas();
refreshDatas();



$(document).ready(function() {
	


	$('#message').keypress(function(event) {
		if (event.keyCode == 13) {
			
			sendDatas();
			//vider le champs
			$('#message').val('');
			

		}
	});


});




 









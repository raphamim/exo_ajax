

function sendMessage() {

	$.ajax({
		url: 'php/ajax.php',
		data: {
			message: $('.message').val(),
			function: 'sendMessage'
		},
		dataType: 'json',
		method: 'POST'
	}).done(function(data) {
		console.log(data);
		// $('.message').val('');

		
	});
}

$(document).ready(function() {

	// getMessages();
	$('.message').keypress(function(event) {
		if (event.keyCode == 13) {
			sendMessage();
		}
	});
});




 









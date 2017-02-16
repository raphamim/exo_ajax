var tab1 = '';

function refreshMessages(data){
    var html = '';
    $.each(data, function(k, v){
        if ('user' === v.type){
            position = 'right';
        } else {
            position = 'left';
        }
        html += '<div class="chat-message-container"><div class="chat-message position-'+position+'">'+v.message+'</div></div>';
        console.log(k);
        console.log(v);
    })
    var elem1 = $('.messages');
    elem1.html(html);
    // elem1.scrollTop = elem.scrollHeight;
    console.log(elem1.scrollTop);
    console.log(elem1.scrollHeight);
}

function sendAjaxMessage(){
    $.ajax({
        // important et obligatoire
        url: 'php/ajax.php',
        // les éléments à envoyer
        data: {
            message: $('.message').val(),
            function: 'sendMessage'
        },
        // Le type de data (html, xml, json, script...)
        dataType: 'json',
        // la méthode d'envoie (GET ou POST)
        method: 'POST'
    // La fonction done s'exécute lors du bon fonctionnement de la requête
    }).done(function(data){
        $('.message').val('');
        refreshMessages(data);
        $(".messages").animate({ scrollTop: $('.messages').prop("scrollHeight")}, 1000);
    });
}
function getAjaxMessage(){
    $.ajax({
        url: 'php/ajax.php',
        data: {
            function: 'getMessages'
        },
        dataType: 'json',
        method: 'POST'
    }).done(function(data){
        refreshMessages(data);
        $(".messages").animate({ scrollTop: $('.messages').prop("scrollHeight")}, 500);
    });
}

$(document).ready(function(){
    $(".message").focus();
    getAjaxMessage();

    $('.message').keypress(function(event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (13 === keyCode){
            sendAjaxMessage();
        }
    });

});
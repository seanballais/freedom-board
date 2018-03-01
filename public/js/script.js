$(document).ready(function() {
    $('div#floating-message-textbox-trigger').click(function() {
        $(this).fadeOut(150, function() {
            $('div#floating-message-textbox').slideDown(100);
        });
    });

    $('div#floating-message-textbox-trigger').hover(
        function() { // On mouse enter
            $(this).stop().animate({ backgroundColor: "#7f28e2", borderColor: "#7f28e2" })
        },
        function() { // On mouse exit
            $(this).stop().animate({ backgroundColor: "#5701b8", borderColor: "#5701b8" })
        }
    );

    $('div#floating-message-textbox > h3 > span#close-button').click(function() {
        $('div#floating-message-textbox').slideUp(150, function() {
            $('div#floating-message-textbox-trigger').fadeIn(150);
        });
    });
});
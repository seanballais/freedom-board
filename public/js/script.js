$(document).ready(function() {
    $('div#floating-message-textbox-trigger').click(function() {
        $(this).fadeOut(150, function() {
            $('div#floating-message-textbox').slideDown(100);
        });
    });

    $('div#floating-message-textbox > h3 > span#close-button').click(function() {
        $('div#floating-message-textbox').slideUp(150, function() {
            $('div#floating-message-textbox-trigger').fadeIn(150);
        });
    });

    $('article div#article-contents div#message-writer form#form-bait').focusin(function() {
        $(this).fadeOut(150, function() {
            $(this).next('form').slideDown(150);
            $('article div#article-contents div#message-writer form#form-writer div div textarea').focus();
        });
    });

    $('article div#article-contents div#message-writer form#form-writer').focusout(function() {
        var message = $('article div#article-contents div#message-writer form#form-writer div div textarea').val();
        var author = $('article div#article-contents div#message-writer form#form-writer div div input').val();

        if (message == '' && author == '') {
            $(this).slideUp(150, function() {
                $(this).prev('form').fadeIn(150);
            });
        }
    });
});
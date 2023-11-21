$(function(){
    alert('jQuery is working!');

    $('#comment-body').on('input', function(){
        console.log("Input event fired");
        const value = $(this).val().trim();
        const submitButton = $(this).closest('form').find('input[type="submit"]');

        if(value === ''){
            $(this).css('border-color', 'red');
            submitButton.prop('disable', true);

        } else {
            $(this).css('border-color', '');
            submitButton.prop('disabled', false);
        };
    });

    $('#load-comments').on('click', function() {
        const categoryId = $('#category-id').data('category');
        const articleId = $('#load-comments').data('article');
        
        const url = `/categories/${categoryId}/articles/${articleId}/comments`;
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
            for(var i = 0; i < data.length; i++){
                var comments = "<p>" + data[i]["commenter"] + "</p>";
                comments += "<p>" + data[i]["body"] + "</p>";
                console.log(comments);
                $('#comments').append(comments);
            };

            $.fail(function(){
                alert("Comments failed to load!!!");
            });
        });
    });
});
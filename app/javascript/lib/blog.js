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
            data.forEach(c => {
                let commenter = `<p><strong>Commenter:</strong>${c.commenter}</p>`;
                let comment = `<p><strong>Comment:</strong>${c.body}</p>`;
                const likeButton = "<button class='like-button'>Like</button>"
                $('#comments').append(commenter, comment, likeButton);
            });

            $('.like-button').on('click', function(){
                let = likeCount = parseInt($(this).data('like-count')) || 0;
                likeCount ++
                $(this).text(`like ${likeCount}`).data('like-count', likeCount);
            });

            $.fail(function(){
                alert("Comments failed to load!!!", error);
            });
        });
    });
});
$(document).ready(function() {

  if ($('#pages_edit').length) {

    $('a#preview').click(function() {
      $.post($(this).attr('href'), { data: $('#page_body').val() }, function(data) {
        $('#preview_area').html(data).show();
        $('#write_area').hide();
      });
      return false;
    });
    $('a#write').click(function() {
      $('#write_area').show();
      $('#preview_area').hide();
      return false;
    });

  }




});
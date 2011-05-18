$(function(){
  $('.overlay').hide();
  $('#new').click(function(){
    $('.overlay').show();
    return false;
  });


  $('.button_to').hide();
  $('a[data-method="delete"]').click(function(){
    if($(this).text() != 'Cancel'){
      $(this).text('Cancel');
      $(this).next('.button_to').show();
    }
    else{
      $(this).text('Delete');
      $(this).next('.button_to').hide();
    }
    return false;
  });

  $('.notice, .warning, .error').delay(5000).fadeOut(4000);
});


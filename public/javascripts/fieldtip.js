// Add fieldtip class to fields where you want to see the title in the field if nothing has been entered

$(function(){
  $(".fieldtip").live('focus', function(){
    if($(this).val() == $(this)[0].title){
      $(this).removeClass("fieldtip_active");
      $(this).val("");
    }
  });

  $(".fieldtip").live('blur', function(){
    if($(this).val() == ""){
      $(this).addClass("fieldtip_active");
      $(this).val($(this)[0].title);
    }
  });

  $('.fieldtip').each(function(){
    if($(this).val() == ""){
      $(this).addClass("fieldtip_active");
      $(this).val($(this)[0].title);
    }
  });

  $('form').submit(function(){
    $('.fieldtip_active').each(function(){
      $(this).val('');
    });
  });
});


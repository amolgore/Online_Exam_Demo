// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require fancybox
//= require_tree .
//= require jquery_nested_form
//= require jquery_nested_form

$(document).ready(function(){

// JS function for infinite scrolling with will paginate class  
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page ').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);  
      }
    });
    return $(window).scroll();
  }

  $(".survey_destroy").click(function(event) {
    var url_id = $(this).data("id");
    event.preventDefault();
    $.ajax({
              dataType: "json",
              url: "/surveys/"+url_id,
              method: "DELETE",
              success: function(response){
                var id = response.id
                $('[id$=' + id + ']').remove();
          }
          
    });
  });

  

  
});




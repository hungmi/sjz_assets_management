$(document).on("turbolinks:load", function(){
  if ($("#ajax-appetizer").length >= 0) {
    $.ajax({
      url: $("#ajax-appetizer").data("url"),
      method: "get"
    }).done(function(data){
      $("#ajax-entree").html(data)
    }).always(function(){
      $("#ajax-appetizer").remove()
    })
  }
})
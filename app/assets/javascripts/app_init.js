document.addEventListener("turbolinks:before-cache", function() {
  $(".qr-code canvas").remove()
})
document.addEventListener("turbolinks:load", function(){
  $(".qr-code").each(function(){
    $(this).qrcode($(this).data("qr-code-content"))
  })
  $(".select2").select2()
  // svg4everybody();
})

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
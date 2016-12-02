document.addEventListener("turbolinks:before-cache", function() {
  $(".qr-code canvas").remove()
})
document.addEventListener("turbolinks:load", function(){
  $(".qr-code").each(function(){
    $(this).qrcode($(this).data("qr-code-content"))
  })
  Holder.addTheme("sjz", {
    bg: "#3f4853", fg: "#3ac5d9", size: 14
  })
  Holder.run()
  // svg4everybody();
})
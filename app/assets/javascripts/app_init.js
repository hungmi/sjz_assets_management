document.addEventListener("turbolinks:before-cache", function() {
  $(".qr-code canvas").remove()
})
document.addEventListener("turbolinks:load", function(){
  $(".qr-code").each(function(){
    $(this).qrcode($(this).data("qr-code-content"))
  })
  // Holder.addTheme("sjz", {
  //   bg: "#2b3a4e", fg: "dodgerblue", size: 14
  // })
  // Holder.run()
  $(".select2").select2()
  // svg4everybody();
})
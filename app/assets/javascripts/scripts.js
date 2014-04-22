$(function(add) {
  add = $('.btn').on("click", function() {
    clone = $('#to-field').clone();
    $(clone).find('input').val('');
    $(clone).insertAfter($(this).parent());
    $(clone).after("<br><br>");
  });
});

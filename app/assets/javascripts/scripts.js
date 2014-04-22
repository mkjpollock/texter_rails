$(function(add) {
  add = $('#add_field').click(function() {
    clone = $('#to_field').clone()
    $(clone).find('input').val('')
    $(clone).insertAfter($(this).parent());
  });
});

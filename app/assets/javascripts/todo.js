$(document).on("ajax:success", function (e, data) {
  console.log("Ajax Response data:", data);
});

$("#new_todo").bind("ajax:complete", function(event,xhr,status){
  $('#todo_item').val('');
});
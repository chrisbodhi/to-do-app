$(document).on("ajax:success", function (e, data) {
  console.log("Ajax Response data:", data);
});

// Clear the input after submission

$("#new_todo").bind("ajax:complete", function(event,xhr,status){
  $('#todo_item').val('');
});

// Hide the flash notices after load

$(document).ready(function() {
  $('.alert').delay(800).fadeOut(800);
})

$(document).ready(function() {
  $('.notice').delay(800).fadeOut(800);
})

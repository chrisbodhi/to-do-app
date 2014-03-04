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

////////////////////
// Chart.js goodness
////////////////////

// Select context of our canvas element with jQuery

$(document).ready(function() {
  var context = $("#myChart").get(0).getContext("2d");
  var newChart = new Chart(context);

  // Stick in a bar chart

  new Chart(context).Bar(data,options);
});

// Placeholder data

var data = {
  labels : ["January","February","March","April","May","June","July"],
  datasets : [
    {
      fillColor : "rgba(220,220,220,0.5)",
      strokeColor : "rgba(220,220,220,1)",
      data : [65,59,90,81,56,55,40]
    },
    {
      fillColor : "rgba(151,187,205,0.5)",
      strokeColor : "rgba(151,187,205,1)",
      data : [28,48,40,19,96,27,100]
    }
  ]
}

// Placeholder Options

var options = {
        
  //Boolean - If we show the scale above the chart data     
  scaleOverlay : false,
  
  //Boolean - If we want to override with a hard coded scale
  scaleOverride : false,
  
  //** Required if scaleOverride is true **
  //Number - The number of steps in a hard coded scale
  scaleSteps : null,
  //Number - The value jump in the hard coded scale
  scaleStepWidth : null,
  //Number - The scale starting value
  scaleStartValue : null,

  //String - Colour of the scale line 
  scaleLineColor : "rgba(0,0,0,.1)",
  
  //Number - Pixel width of the scale line  
  scaleLineWidth : 1,

  //Boolean - Whether to show labels on the scale 
  scaleShowLabels : true,
  
  //Interpolated JS string - can access value
  scaleLabel : "<%=value%>",
  
  //String - Scale label font declaration for the scale label
  scaleFontFamily : "'Arial'",
  
  //Number - Scale label font size in pixels  
  scaleFontSize : 12,
  
  //String - Scale label font weight style  
  scaleFontStyle : "normal",
  
  //String - Scale label font colour  
  scaleFontColor : "#666",  
  
  ///Boolean - Whether grid lines are shown across the chart
  scaleShowGridLines : true,
  
  //String - Colour of the grid lines
  scaleGridLineColor : "rgba(0,0,0,.05)",
  
  //Number - Width of the grid lines
  scaleGridLineWidth : 1, 

  //Boolean - If there is a stroke on each bar  
  barShowStroke : true,
  
  //Number - Pixel width of the bar stroke  
  barStrokeWidth : 2,
  
  //Number - Spacing between each of the X value sets
  barValueSpacing : 5,
  
  //Number - Spacing between data sets within X values
  barDatasetSpacing : 1,
  
  //Boolean - Whether to animate the chart
  animation : true,

  //Number - Number of animation steps
  animationSteps : 60,
  
  //String - Animation easing effect
  animationEasing : "easeOutQuart",

  //Function - Fires when the animation is complete
  onAnimationComplete : null
  
}

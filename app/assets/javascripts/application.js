// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min

$(function() {
  $( ".draggable-element" ).arrangeable();
});


var diff_date = function(from, to) {
  var oneDay = 24 * 60 * 60 * 1000;
  console.log("Inside diff_date : " + from + " : " + to)
  return Math.round(Math.abs((from - to.getTime())/oneDay));
}

$(document).ready(function(){

  // auto fadeout the alert messages after 5 seconds timeout
  $(".alert").fadeOut(10000);

  // color div elements based on yellow, orange and red

  $("div").find(".activity_item").each(function(index){
    //console.log(index + ": " + $(this).text());
  });

  $("div").find(".activity_item").each(function(index){
    // change background color based on the postion value
    // Yellow #FDFDA7 
    // Orange #FF7F00
    // Red    #FE5C5C
    console.log("Hidden field : " + $(this).find("input:hidden[name='activity[created_at]']").val());

    value = $(this).find("input:hidden[name='activity[created_at]']").val();
    created_date = Date.parse(value);

    console.log(index + " : " + value);

    todays_date = new Date();
    absolute_diff = diff_date(created_date, todays_date);

    if (absolute_diff > 10) {
      $(this).addClass("red_activity");
    }
    else if (absolute_diff > 5) {
      $(this).addClass("yellow_activity");
    }
    else {
      $(this).addClass("green_activity");
    }
    console.log("Diff : " + absolute_diff);
  });

  $(".activity_item").click(function(){
    activityHtml = $(this).html();
    $("<div class='row' id='activity_dialog'>"+ activityHtml +"</div>").bPopup({
        easing: 'easeOutBack',
        speed: 450,
        transition: 'slideDown'
    });
    // $("<div></div>").dialog({
    //     modal: true,
    //     open: function(){
    //       $(this).html(activityHtml);
    //     },
    //     buttons: {
    //         Ok: function(){
    //           $(this).dialog("close");
    //         }
    //     }
    // });  
  });
});
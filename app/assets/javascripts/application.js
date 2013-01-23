// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
jQuery(function($) {  
  course();
  approve();

});

function course(){

  $(".course_anchor")
    .bind("ajax:loading",  function() { /* alert("Loading") */ })
    .bind("ajax:complete", function() { /*alert("complete") */ })
    .bind("ajax:failure", function(event, xhr, status, error) {
      alert("Error" + status);
     })
    .bind("ajax:success", function(event, data, status, xhr) {
        //alert(data)
        //alert($(this).attr('href'))
        if(data=="Canceled"){          
          $(this).text("Request");
          var a = $(this).attr('href').replace("act=Cancel","act=Request")  
          $(this).attr('href',a)        
        }else if(data=='Requested'){
          var a = $(this).attr('href').replace("act=Request","act=Cancel")  
          $(this).text("Cancel"); 
          $(this).attr('href',a)   
        }else{
           $('#model-message').html("Data Error.");
           $('#myModal').modal('show') 

        }   

     });

}


function approve(){
   $(".approve_anchor")
    .bind("ajax:loading",  function() { /*alert("Loading")*/ })
    .bind("ajax:complete", function() { /*alert("complete")*/ })
    .bind("ajax:failure", function(event, xhr, status, error) {
      alert("Error");
     })
    .bind("ajax:success", function(event, data, status, xhr) {
      if(data == "Approve"){
        $(this).text("Approved");
      }
      else{

        $(this).text("Approve");
      }



      //$.each(data, function(index, value) {
     // alert(index + ': ' + value.name);
   // });
       
     });

}


$(document).ready(function() {
  $('.signup').on('click', function(e){
    e.preventDefault();
    $('#sign-up-form').css('display', 'block');
    $('.index-button').hide();
  });

  $('.login').on('click', function(e){
    e.preventDefault();
    $('#log-in-form').css('display', 'block');
    $('.index-button').hide();
  });

  $('#sign-up-form').on('submit', function(e){
    e.preventDefault();

    $.ajax({
      url: $(this).children().attr('action'),
      type: 'POST',
      dataType: 'json',
      data: $(this).children().serialize()
    }).done(function(data){
      $('#show-page').css('display','block')
      $('#sign-up-form').css('display','none')
      $('#logout').css('display','block')
      $.ajax({
        url: 'users/'+data.id+'/categories',
        type: "GET",
        dataType: "json"
      }).done(function(categories){
        $('#show-page').css('display','block')
        $('#sign-up-form').css('display','none')
        $('#logout').css('display','block')
        for (var i = 0; i < categories.length; i++){
          $('#checkbox-template').find('form').prepend("<input id='checkbox' type='checkbox' name='"+categories[i].adventure_type+"' value='"+categories[i].adventure_type+"'> "+categories[i].adventure_type)
        } //end 'for' loop
        $('body').on('click', '#select-all', function(){
          $('input[type="checkbox"]').each(function(){
            this.checked = true
          });
        });
        $('body').on('click', '#deselect-all', function(){
          $('input[type="checkbox"]').each(function(){
            this.checked = false
          });
        }); // end of checkbox clickity clicks
        $('#checkbox-form').on('submit', function(e){
          e.preventDefault();
          $.ajax({
            url: $(this).attr('action'),
            type: 'POST',
            dataType: 'json',
            data: $(this).serialize()
          }).done(function(category_event){
            $('#events-page').css('display','block');
            $('#show-page').hide();
            window.location.href = "/events";
          })
        });

      }) //finish done categories
    }) // finish done 'data'
  });

  $('#log-in-form').on('submit', function(e){

    e.preventDefault();

    $.ajax({
      url: $(this).children().attr('action'),
      type: 'POST',
      dataType: 'json',
      data: $(this).children().serialize()
    }).done(function(data){
      $('#logout').css('display','block')
      $('#show-page').css('display','block')
      $('#log-in-form').css('display','none')
    }) // finish done 'data'
  }) // end log-in-form 'submit'


}); // end document ready

// var initializeMap = function() {
//   var myLat = $('')
//   var mapOptions = {
//     zoom: 8,
//     center: new google.maps.LatLng(-34.397, 150.644)
//   };

//   var map = new google.maps.Map(document.getElementById('map-canvas'),
//       mapOptions);
// }

// function loadScript() {
//   var script = document.createElement('script');
//   script.type = 'text/javascript';
//   script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
//       '&signed_in=true&callback=initialize';
//   document.body.appendChild(script);
// }

// window.onload = loadScript;

var map, marker, infoWindow;

var initializeMap = function(location) {
  var myLatlng = new google.maps.LatLng(location.coords.latitude, location.coords.longitude);
  var mapOptions = {
    zoom: 12,
    center: myLatlng
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

  marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: "You are here"
  });

}

~(navigator.geolocation.getCurrentPosition(initializeMap))

function getEventLocationsFromDB() {
  // AJAX call to DB for Lat, Lng, and address of each location
  event.preventDefault();
  debugger;
  $.ajax({
    url: '/events/nearby',
    type: 'get'
  }).done(function(response){
    console.log("success is: ", response);
    var locations = response;
    console.log(locations);
    addEventMarkerFromDB(locations);
  }).fail(function(response){
    console.log("get events fail: ", response);
  })
}

function addEventMarkerFromDB(locations) {
  // for loop adding marker to map for each location
  for (var i = 0; i < locations.length; i++) {
    var name = locations[i].name;
    var address = locations[i].address;
    var lat = locations[i].lat;
    var lng = locations[i].long;
    var description = locations[i].description;
    var contentString = "<h2>" + name + "</h2>" + "<p>" + address + "</p>" + "<p>" + description + "</p>"
    console.log(name, address, lat, lng);

    marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map,
      title: "You are here"
    });

    infoWindow = new google.maps.InfoWindow({
      content: contentString // Add user information here
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map, marker);
      setTimeout(function() {
        infowindow.close();
      }, 3000)
    });
  }
};

$('.event-button-container').on('click', '.show-events', getEventLocationsFromDB);
// $('.event-button-container').on('click', '.add-event', addEventMarkerFromDB);

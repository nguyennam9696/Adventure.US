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

}

function addEventMarkersFromDB(locations) {
  // for loop adding marker to map for each location
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(42.073026, -87.675954),
    map: map,
    title: "You are here"
  })

    infoWindow = new google.maps.InfoWindow({
    content: "Chicago!" // Add user information here
  });
}

$('.event-button-container').on('click', '.show-events', addEventMarkersFromDB);

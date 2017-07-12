// Overrides and adds customized javascripts in this file
// Read more on documentation: 
// * English: https://github.com/consul/consul/blob/master/CUSTOMIZE_EN.md#javascript
// * Spanish: https://github.com/consul/consul/blob/master/CUSTOMIZE_ES.md#javascript
//
//

function initMap() {
  var mapElem = document.getElementById('js-g-map');

  var map = new google.maps.Map(mapElem, {
    zoom: $(mapElem).data('zoom') || 10,
    center: {lat: 40.728214, lng: -73.9651237}
  });

  map.data.loadGeoJson('/map.geojson');

  map.data.setStyle({
    strokeWeight: 1,
    strokeOpacity: 0.4,
    fillOpacity: 0.2
  });

  var infowindow = new google.maps.InfoWindow();

  map.data.addListener('click', function(event) {
    console.log(event.feature.getProperty('boro_name'));
    infowindow.setContent("<div style='width:150px; text-align: center;'>"+event.feature.getProperty("boro_name")+"</div>");

    var anchor = new google.maps.MVCObject();
    anchor.set("position",event.latLng);

    infowindow.open(map, anchor);
  });
}

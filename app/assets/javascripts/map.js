$(document).ready(function() {
  // cartodb.createVis('map', 'http://documentation.carto.com/api/v2/viz/2b13c956-e7c1-11e2-806b-5404a6a683d5/viz.json');
  var map = L.map('map', {
      zoomControl: true,
      center: [42.3257277,-71.7348638],
      zoom: 10
  });

  var basemap = L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>'
  }).addTo(map);

  $.getJSON('/tables', function(data) {
    var layers = {};
    data.forEach(function(table) {
      layers[table.table_name] = {
        sql: table.sql,
        cartocss: table.css
      }
    });
    console.log(layers);
    // Layers definition

    // Empty layer
    cartodb.createLayer(map,{
      user_name: 'mapc-admin',
      type: 'cartodb',
      sublayers: []
    })
    .addTo(map)
    .done(function(layer){
      // When the layers inputs change fire this
      $("input[name='layer']").change(function(){

        // Clear the sublayers
        layer.getSubLayers().forEach(function(sublayer){sublayer.remove()});

        // For every check activated, add a sublayer
        $.each($("input[name='layer']:checked"), function(){
            layer.createSubLayer(layers[$(this).attr("id")]);
        });
      });
    });
  });
});
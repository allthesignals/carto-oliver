$(document).ready(function() {
  // cartodb.createVis('map', 'http://documentation.carto.com/api/v2/viz/2b13c956-e7c1-11e2-806b-5404a6a683d5/viz.json');
  var map = L.map('map', {
      zoomControl: true,
      center: [42.3257277,-71.6],
      zoom: 9
  });

  map.zoomControl.setPosition('topright');

  var basemap = L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>'
  }).addTo(map);

  var defaultCss = "#layer['mapnik::geometry_type'=1] {      marker-width: 7;      marker-fill: #FFB927;      marker-fill-opacity: 0.9;      marker-line-color: #FFF;      marker-line-width:  1;      marker-line-opacity: 1;      marker-placement: point;      marker-type: ellipse;      marker-allow-overlap: true;    }    #layer['mapnik::geometry_type'=2] {      line-color: #3EBCAE;      line-width: 1.5;      line-opacity: 1;    }    #layer['mapnik::geometry_type'=3] {      polygon-fill: #374C70;      polygon-opacity: 0.9;      polygon-gamma: 0.5;      line-color: #FFF;      line-width: 1;      line-opacity: 0.5;      line-comp-op: soft-light;    }";

    console.log(defaultCss);

  $.getJSON('/tables', function(data) {
    var layers = {};
    data.forEach(function(table) {
      layers[table.table_name] = {
        sql: table.sql,
        cartocss: table.css || defaultCss
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

var wms_layers = [];
var baseLayer = new ol.layer.Group({
    'title': '',
    layers: [
new ol.layer.Tile({
    'title': 'OSM',
    'type': 'base',
    source: new ol.source.OSM()
})
]
});
var format_VARIAZIONIUSOSUOLO20072016_0 = new ol.format.GeoJSON();
var features_VARIAZIONIUSOSUOLO20072016_0 = format_VARIAZIONIUSOSUOLO20072016_0.readFeatures(json_VARIAZIONIUSOSUOLO20072016_0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_VARIAZIONIUSOSUOLO20072016_0 = new ol.source.Vector({
    attributions: [new ol.Attribution({html: '<a href=""></a>'})],
});
jsonSource_VARIAZIONIUSOSUOLO20072016_0.addFeatures(features_VARIAZIONIUSOSUOLO20072016_0);var lyr_VARIAZIONIUSOSUOLO20072016_0 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_VARIAZIONIUSOSUOLO20072016_0, 
                style: style_VARIAZIONIUSOSUOLO20072016_0,
    title: 'VARIAZIONI USO SUOLO 2007-2016<br />\
    <img src="styles/legend/VARIAZIONIUSOSUOLO20072016_0_0.png" /> SI<br />'
        });

lyr_VARIAZIONIUSOSUOLO20072016_0.setVisible(true);
var layersList = [baseLayer,lyr_VARIAZIONIUSOSUOLO20072016_0];
lyr_VARIAZIONIUSOSUOLO20072016_0.set('fieldAliases', {'v_16_07': 'v_16_07', });
lyr_VARIAZIONIUSOSUOLO20072016_0.set('fieldImages', {'v_16_07': 'TextEdit', });
lyr_VARIAZIONIUSOSUOLO20072016_0.set('fieldLabels', {'v_16_07': 'header label', });
lyr_VARIAZIONIUSOSUOLO20072016_0.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});
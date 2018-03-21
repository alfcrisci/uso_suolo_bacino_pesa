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
var format_PesaUSOECOPERTURASUOLO2016_0 = new ol.format.GeoJSON();
var features_PesaUSOECOPERTURASUOLO2016_0 = format_PesaUSOECOPERTURASUOLO2016_0.readFeatures(json_PesaUSOECOPERTURASUOLO2016_0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_PesaUSOECOPERTURASUOLO2016_0 = new ol.source.Vector({
    attributions: [new ol.Attribution({html: '<a href=""></a>'})],
});
jsonSource_PesaUSOECOPERTURASUOLO2016_0.addFeatures(features_PesaUSOECOPERTURASUOLO2016_0);var lyr_PesaUSOECOPERTURASUOLO2016_0 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_PesaUSOECOPERTURASUOLO2016_0, 
                style: style_PesaUSOECOPERTURASUOLO2016_0,
    title: 'Pesa USO E COPERTURA SUOLO 2016<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_0.png" /> Zone_AGR_eterogenee<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_1.png" /> Zone urbane<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_2.png" /> Zone umide<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_3.png" /> Vigneti<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_4.png" /> Vegetazione_rada<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_5.png" /> Seminativi<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_6.png" /> Prati<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_7.png" /> Oliveti<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_8.png" /> Frutteti<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_9.png" /> Corpi_idrici<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_10.png" /> Cantieri<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_11.png" /> Boschi<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_12.png" /> Aree urbane verdi<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_13.png" /> Aree industriali o commerciali<br />\
    <img src="styles/legend/PesaUSOECOPERTURASUOLO2016_0_14.png" /> Arbusti_erbacee<br />'
        });

lyr_PesaUSOECOPERTURASUOLO2016_0.setVisible(true);
var layersList = [baseLayer,lyr_PesaUSOECOPERTURASUOLO2016_0];
lyr_PesaUSOECOPERTURASUOLO2016_0.set('fieldAliases', {'l_2016': 'l_2016', });
lyr_PesaUSOECOPERTURASUOLO2016_0.set('fieldImages', {'l_2016': 'TextEdit', });
lyr_PesaUSOECOPERTURASUOLO2016_0.set('fieldLabels', {'l_2016': 'inline label', });
lyr_PesaUSOECOPERTURASUOLO2016_0.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});
var size = 0;
var placement = 'point';
function categories_PesaUSOECOPERTURASUOLO2016_0(feature, value, size, resolution, labelText,
                       labelFont, labelFill) {
                switch(value.toString()) {case 'Zone_AGR_eterogenee':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(220,158,96,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Zone urbane':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(104,107,100,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Zone umide':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(11,223,230,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Vigneti':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(232,16,88,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Vegetazione_rada':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(108,204,145,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Seminativi':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(30,216,30,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Prati':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(112,214,74,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Oliveti':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(100,202,4,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Frutteti':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(226,88,13,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Corpi_idrici':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(165,191,221,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Cantieri':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(202,118,107,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Boschi':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(1,210,78,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Aree urbane verdi':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(137,212,93,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Aree industriali o commerciali':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(217,193,35,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;
case 'Arbusti_erbacee':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(103,209,4,0.58)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;}};

var style_PesaUSOECOPERTURASUOLO2016_0 = function(feature, resolution){
    var context = {
        feature: feature,
        variables: {}
    };
    var value = feature.get("l_2016");
    var labelText = "";
    size = 0;
    var labelFont = "14.3px \'Ubuntu\', sans-serif";
    var labelFill = "rgba(0, 0, 0, 1)";
    var textAlign = "left";
    var offsetX = 8;
    var offsetY = 3;
    var placement = 'point';
    if ("" !== null) {
        labelText = String("");
    }
    
var style = categories_PesaUSOECOPERTURASUOLO2016_0(feature, value, size, resolution, labelText,
                          labelFont, labelFill);

    return style;
};

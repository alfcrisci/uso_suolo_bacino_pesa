var size = 0;
var placement = 'point';
function categories_VARIAZIONIUSOSUOLO20072016_0(feature, value, size, resolution, labelText,
                       labelFont, labelFill) {
                switch(value.toString()) {case '1':
                    return [ new ol.style.Style({
        fill: new ol.style.Fill({color: 'rgba(233,1,28,0.5)'}),
        text: createTextStyle(feature, resolution, labelText, labelFont,
                              labelFill, placement)
    })];
                    break;}};

var style_VARIAZIONIUSOSUOLO20072016_0 = function(feature, resolution){
    var context = {
        feature: feature,
        variables: {}
    };
    var value = feature.get("v_16_07");
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
    
var style = categories_VARIAZIONIUSOSUOLO20072016_0(feature, value, size, resolution, labelText,
                          labelFont, labelFill);

    return style;
};

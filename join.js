var osmium = require('osmium');
var numeral = require('numeral');
var _ = require('underscore');
var fs = require('fs');


//Procesamiento de datos
var file = new osmium.File('process.osm');
var reader = new osmium.Reader(file);
var handler = new osmium.Handler();

var nodes_latlon = {};
var nodes_id = {};
var osm = "<?xml version='1.0' encoding='UTF-8'?><osm version='0.6' upload='true' generator='JOSM'>";

var str_nodes = '';
var str_ways = '';
handler.on('node', function(node) {
	var latlon = parseFloat(node.lat).toFixed(6) + '/' + parseFloat(node.lon).toFixed(6);
	nodes_id[node.id] = latlon;
	nodes_latlon[latlon] = node.id;
});

//WAY
handler.on('way', function(way) {
	var way_str = "<way id='" + way.id + "'  visible='true' version='1' >";
	var nd = '';
	_.each(way.nodes(), function(val) {
		nd += "<nd ref='" + nodes_latlon[nodes_id[val]] + "' />"
	});
	way_str = way_str + nd + " <tag k='building' v='yes' /> </way>";
	str_ways += way_str;
});


reader.apply(handler);
var num_count = Object.keys(nodes_latlon).length;
_.each(nodes_latlon, function(value, key) {
	var node = "<node id='" + value + "' lat='" + key.split("/")[0] + " ' lon='" + key.split("/")[1] + "'/>";
	str_nodes += node;
	if (num_count-- === 1) {
		osm = osm + str_nodes + str_ways + '</osm>';
		fs.writeFile('osm.osm', osm, function(err) {
			if (err) throw err;
			console.log('It\'s saved!');
		});
	}
});
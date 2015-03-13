var http = require('http'),
	fs = require('fs');
for (var i = 1; i <= 2; i++) {
	var request = http.get("http://localhost:3021/" + i, function(response) {
		if (response.statusCode === 200) {
			var file = fs.createWriteStream("zona-" + i + ".osm");
			response.pipe(file);
		}
		request.setTimeout(12000, function() {
			request.abort();
		});
	});
}
var header = '{| class="wikitable" class="wikitable sortable"\n' +
	'! Zona\n' +
	'! Usuario Asignado\n' +
	'! Buildings file\n' +
	'! Addresses file\n' +
	'! Progreso\n' +
	'! Notas/Comentarios';
//'}';
console.log(header);
for (var i = 1; i <= 146; i++) {

	if (i <= 20)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[http://www.openstreetmap.org/user/ediyes ediyes]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 20 && i <= 40)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[http://www.openstreetmap.org/user/Luis36995 Luis36995]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 40 && i <= 60)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[https://www.openstreetmap.org/user/dannykath dannykath]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|\n';

	if (i > 60 && i <= 80)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[https://www.openstreetmap.org/user/RichRico RichRico]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 80 && i <= 100)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[https://www.openstreetmap.org/user/abel801 abel801]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 100 && i <= 120)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[https://www.openstreetmap.org/user/calfarome calfarome]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 120 && i <= 140)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[https://www.openstreetmap.org/user/samely samely]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';

	if (i > 140 && i <= 146)
		var row = '|-\n' +
			'|Zona ' + i + '\n' +
			'|[http://www.openstreetmap.org/user/Rub21 Rub21]\n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/buil/' + i + ' zona-' + i + '-buildings] \n' +
			'|[http://localhost:8111/import?new_layer=true&url=http://54.147.228.251:3019/addr/' + i + ' zona-' + i + '-addresses] \n' +
			'|\n' +
			'|';



	console.log(row);

};

console.log('}');
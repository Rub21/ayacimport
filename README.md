# Ayacucho building and address import
Por el momento se ha generados un archivos .OSM de la ciudad de Ayacucho, este ya esta disponible para el uso  en JOSM  para su revision en manual y subir a JOSM.

## Datos

[Ver el docuemento](http://wiki.openstreetmap.org/wiki/Import/Catalogue/Ayacucho-Peru)

## Pre requisitos -Herramientas

- Postgres + postgis

## Procesamiento de los datos:

##### Descargar los datos:

- https://s3.amazonaws.com/osmimport/importayacucho/address.zip
- https://s3.amazonaws.com/osmimport/importayacucho/buildings.zip
- https://s3.amazonaws.com/osmimport/importayacucho/streetnames.zip

##### Importar los datos en la Base de Datos

Importar en la base de datos y ejecutar los query `address.sql`, `building.sql` y `streetnames.sql` o simplemente puede descargar la base de datos en :https://s3.amazonaws.com/osmimport/importayacucho/dbimportayac.dump.out  que ya contiene los datos procesados.

##### Exportar los datos  en formato SHP

Se ha utilizado Qgis, para la exportacinde los datos.

##### Convertir SHP en OSM

Hemos utilizado los [OpenData](http://wiki.openstreetmap.org/wiki/JOSM/Plugins/OpenData) plugin del JOSM. 

##### Repara Tag en JOSM

Reparar los tags que en el JOSM que fueron abreviados en el SHP file y eliminar  los tag `gid` y `layer`

Ejemplo:

**Antes**

![screenshot from 2015-03-11 15 08 58](https://cloud.githubusercontent.com/assets/1152236/6606162/9df0c1c6-c803-11e4-8b7b-3d4c1abfa47c.png)

**Despues**

![screenshot from 2015-03-11 15 33 13](https://cloud.githubusercontent.com/assets/1152236/6606223/f4018a82-c803-11e4-9427-b04888851822.png)

## Atributos a Mapear

*Buildings*

Cada way(Building) de primer piso(first floor) se le asignara el tag:

	addr:city=Ayacucho # por defauld
	addr:country=Perú # por defauld
	building:levels:underground # Si esta disponible
	building:levels # Si esta disponible
	building:material # Si esta disponible
	building=yes # por defauld
	height # Si esta disponible
	min_height # Si esta disponible
	roof:material # Si esta disponible
	roof:material # Si esta disponible
	roof:shape # Si esta disponible
	roof:shape # Si esta disponible
	source:height # por defauld

Cada way(Building) mayor a al segundo piso(second flor)  piso se le asignara el tag:

	building:levels # Si esta disponible
	building:material # Si esta disponible
	building:part # por defauld
	height # Si esta disponible
	min_height # Si esta disponible
	roof:material # Si esta disponible
	roof:shape # Si esta disponible
	source:height # por defauld

*Addresses*

Each address is a node tagged with:

    addr:housenumber="HOUSE_NUMB"
    addr:streetname="STREET_NAM"
    addr:postcode="ZIPCODE"



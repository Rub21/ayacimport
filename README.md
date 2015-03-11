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

Reparar los tags que en el JOSM que fueron abreviados  en el SHP file

Ejemplo:



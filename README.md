# Ayacucho building and address import
Por el momento se ha generados un archivos .OSM de la ciudad de Ayacucho, este ya esta disponible para el uso  en JOSM  para su revision en manual y subir a JOSM.

## Datos

[Ver el docuemento](http://wiki.openstreetmap.org/wiki/Import/Catalogue/Ayacucho-Peru)

## Pre requisitos -Herramientas

- Postgres + postgis

## Procesamiento de los datos:

#### Descargar los datos:

- https://s3.amazonaws.com/osmimport/importayacucho/address.zip
- https://s3.amazonaws.com/osmimport/importayacucho/buildings.zip
- https://s3.amazonaws.com/osmimport/importayacucho/streetnames.zip

#### Importar los datos en la Base de Datos

Importar en la base de datos y ejecutar los query `address.sql`, `building.sql` y `streetnames.sql` o simplemente puede descargar la base de datos en :https://s3.amazonaws.com/osmimport/importayacucho/dbimportayac.dump.out  que ya contiene los datos procesados.

#### Ejecutar server

http://localhost:3021/id




#### Atributos a Mapear

##### Atributos a Mapear en Buildings


Cada way(Building) de primer piso(first floor) se le asignara el tag:

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

##### Atributos a Mapear en Addresses (Direciones)

**Antes**
![screenshot from 2015-03-11 16 19 36](https://cloud.githubusercontent.com/assets/1152236/6607149/9e7ea3c2-c80a-11e4-9413-26678f802bc1.png)

**Despues**
![screenshot from 2015-03-11 16 20 55](https://cloud.githubusercontent.com/assets/1152236/6607148/9e7cdf38-c80a-11e4-8241-23ca4e8d711e.png)


Cada Point(address)se le asignara el tag:

	addr:country=Perú # por defauld
	addr:city=Ayacucho # por defauld
	addr:district=Ayacucho # por defauld
	addr:province=Huamanga # por defauld
	addr:postcode=05001 # por defauld
	addr:housenumber# Si esta disponible


## Relacionado

- [Ayacucho Import](http://wiki.openstreetmap.org/wiki/Import/Catalogue/Ayacucho-Peru)
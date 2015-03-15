--======================================BUILDINGS======================================
--=====================================================================================
--DROP COLUMNS
/*
ALTER TABLE buildings DROP COLUMN building;
ALTER TABLE buildings DROP COLUMN height;
ALTER TABLE buildings DROP COLUMN min_height;
ALTER TABLE buildings DROP COLUMN "building:levels";
ALTER TABLE buildings DROP COLUMN "building:material";
ALTER TABLE buildings DROP COLUMN "source:height";
ALTER TABLE buildings DROP COLUMN "building:levels:underground";
ALTER TABLE buildings DROP COLUMN "building:part";
ALTER TABLE buildings DROP COLUMN "roof:material";
ALTER TABLE buildings DROP COLUMN "roof:shape";
ALTER TABLE buildings DROP COLUMN "roof:height";
ALTER TABLE buildings DROP COLUMN id_block;
*/
--Add COLUMNS
ALTER TABLE buildings ADD COLUMN building VARCHAR(5);
ALTER TABLE buildings ADD COLUMN height NUMERIC;
ALTER TABLE buildings ADD COLUMN min_height NUMERIC;
ALTER TABLE buildings ADD COLUMN "building:levels" INTEGER;
ALTER TABLE buildings ADD COLUMN "building:material" VARCHAR(100);
ALTER TABLE buildings ADD COLUMN "source:height" VARCHAR(100);
ALTER TABLE buildings ADD COLUMN "building:levels:underground" NUMERIC;
ALTER TABLE buildings ADD COLUMN "building:part" VARCHAR(3);
ALTER TABLE buildings ADD COLUMN "roof:material" VARCHAR(100);
ALTER TABLE buildings ADD COLUMN "roof:shape" VARCHAR(100);
ALTER TABLE buildings ADD COLUMN "roof:height" NUMERIC;
ALTER TABLE buildings ADD COLUMN id_block NUMERIC;
--Update space on layer colum
UPDATE buildings SET layer= replace(layer, '  ', ' '); 
--==01 piso
UPDATE buildings
  SET building = 'yes', height=2.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', "roof:height" = 1.5
 WHERE layer='01_PRIMER PISO RUSTICO'or layer='01_PISO_MR';
UPDATE buildings
  SET building = 'yes', height=3 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'
 WHERE layer='01_PRIMER PISO NOBLE' or layer='01_PISO_MN';
UPDATE buildings
  SET "building:levels"=1
 WHERE layer='01_PRIMER PISO RUSTICO' OR layer='01_PRIMER PISO NOBLE' OR layer='01_PISO_MN' OR layer='01_PISO_MR' OR layer='01_PISO_MR';
--==01 sotano	
UPDATE buildings
  SET  "building:levels:underground"=1, "building:part"='yes', height=2
 WHERE layer='01_SOTANO_NOBLE' or layer='01_SOTANO_RUSTICO' or layer='SOTANO_01' or layer='LOTE 01 MR' or layer='SOTANO-01 MR' or layer='01_SOTANO_ NOBLE';
--==02 piso
--select count(*) as num, layer from buildings where position('02' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=4.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', /*min_height=2.5,*/"roof:height" = 1.5
WHERE layer='02_SEGUNDO PISO RUSTICO' or layer='02_PISO_MR';
UPDATE buildings
  SET  "building:part"='yes', height=5.5 , "building:material"='concrete' ,"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=3*/
 WHERE layer='02_SEGUNDO PISO NOBLE' or layer='02_PISO_MN';
UPDATE buildings
  SET "building:levels"=2
 WHERE layer='02_SEGUNDO PISO NOBLE' OR layer='02_SEGUNDO PISO RUSTICO' OR layer='02_PISO_MR' OR layer='02_PISO_MN';
--==02 sotano
UPDATE buildings
  SET  "building:levels:underground"=2, "building:part"='yes', height=1.9
 WHERE layer='02_SOTANO_NOBLE' or layer='LOTE02 MR' or layer='02_SOTANO_RUSTICO';
 --==03 piso
--select count(*) as num, layer from buildings where position('03' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=6.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', /*min_height=4.5,*/ "roof:height" = 1.5
 WHERE layer='03_TERCER PISO RUSTICO';
UPDATE buildings
  SET  "building:part"='yes', height=8 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=5.5*/
 WHERE layer='03_TERCER PISO NOBLE' or layer='03_PISO_MN';
UPDATE buildings
  SET "building:levels"=3
 WHERE layer='03_TERCER PISO NOBLE' OR layer='03_PISO_MN' OR layer='03_TERCER PISO RUSTICO';
 --==04 piso
--select count(*) as num, layer from buildings where position('04' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=8.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled'/*, min_height=6.5*/
 WHERE layer='04_CUARTO PISO RUSTICO';
UPDATE buildings
  SET  "building:part"='yes', height=10.5 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=8*/
 WHERE layer='04_CUARTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=4
 WHERE layer='04_CUARTO PISO NOBLE' OR layer='04_CUARTO PISO RUSTICO';
--==05 piso
--select count(*) as num, layer from buildings where position('05' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=13 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=10.5*/
 WHERE layer='05_QUINTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=5
 WHERE layer='05_QUINTO PISO NOBLE';
--==06 piso
--select count(*) as num, layer from buildings where position('06' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=15.5, "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=13*/
 WHERE layer='06_SEXTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=6
 WHERE layer='06_SEXTO PISO NOBLE';
--==07 piso
--select count(*) as num, layer from buildings where position('07' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET "building:part"='yes', height=18 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat'/*, min_height=15.5*/
WHERE layer='07_SEPTIMO PISO NOBLE';
UPDATE buildings SET "building:levels"=7 WHERE layer='07_SEPTIMO PISO NOBLE';
--== balcones
--select count(*) as num, layer from buildings where position('balcon' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings SET "building:part"='yes', "building:levels"= 2, height = 4, min_height=3 WHERE layer='BALCON_2P' or layer='BALCON 2P';
UPDATE buildings SET "building:part"='yes', "building:levels"= 3, height = 6.5, min_height=5.5 WHERE layer='BALCON_3P' or layer='BALCON 3P';
UPDATE buildings SET "building:part"='yes', "building:levels"= 4, height = 9, min_height=8 WHERE layer='BALCON_4P' or layer='BALCON 4P';
UPDATE buildings SET "building:part"='yes', "building:levels"= 5, height = 11.5, min_height=10.5 WHERE layer='BALCON_5P'or layer='BALCON 5P';

--== corredores
--select count(*) as num, layer from buildings where position('corredor' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings SET "building:part"='yes', "building:levels"= 1, height = 3 WHERE layer='CORREDOR 1P' or layer='CORREDOR_1P';
UPDATE buildings SET "building:part"='yes', "building:levels"= 2, height = 5.5 WHERE layer='CORREDOR 2P'; 
UPDATE buildings SET "building:part"='yes', "building:levels"= 3, height = 8 WHERE layer='CORREDOR 3P' or layer='CORREDOR_3P';
UPDATE buildings SET "building:part"='yes', "building:levels"= 4, height = 10.5 WHERE layer='CORREDOR_4P';
--== source:height
UPDATE buildings SET "source:height"='estimate';

--======================================ADDRESS========================================
--=====================================================================================
--Eliminar datos que no tienes sentido
--ALTER TABLE address RENAME COLUMN "addr:housenumber" TO value;
DELETE FROM address WHERE position('area' in lower(value))>0;
DELETE FROM address WHERE position('vereda' in lower(value))>0;
DELETE FROM address WHERE position('a=' in lower(value))>0;
DELETE FROM address WHERE position('educaci' in lower(value))>0;
DELETE FROM address WHERE position('fundo' in lower(value))>0;
DELETE FROM address WHERE position('(' in lower(value))>0;
DELETE FROM address WHERE position('/' in lower(value))>0;
DELETE FROM address WHERE position('calle' in lower(value))>0;
DELETE FROM address WHERE position('parque' in lower(value))>0;
DELETE FROM address WHERE position('vigilancia' in lower(value))>0;
DELETE FROM address WHERE position('0 n' in lower(value))>0;
DELETE FROM address WHERE position('pasaje n' in lower(value))>0;
DELETE FROM address WHERE position('pje n' in lower(value))>0;
DELETE FROM address WHERE position('pje. n' in lower(value))>0;
DELETE FROM address WHERE position('terrenos' in lower(value))>0;
DELETE FROM address  WHERE position('ã' in lower(value))>0;
DELETE FROM address  WHERE position('servidumbre' in lower(value))>0;
DELETE FROM address  WHERE position('comunidad' in lower(value))>0;
DELETE FROM address  WHERE position('posible' in lower(value))>0;
DELETE FROM address  WHERE position('reservorio' in lower(value))>0;
DELETE FROM address  WHERE position('servicio' in lower(value))>0;
DELETE FROM address  WHERE position('usos' in lower(value))>0;
DELETE FROM address  WHERE position('p. c.' in lower(value))>0;
DELETE FROM address  WHERE position('otro' in lower(value))>0;
DELETE FROM address  WHERE position('sector' in lower(value))>0;
DELETE FROM address  WHERE position('posible' in lower(value))>0;
DELETE FROM address  WHERE position('posible' in lower(value))>0;
DELETE FROM address  WHERE position('posible' in lower(value))>0;
DELETE FROM address  WHERE position('comun' in lower(value))>0;
DELETE FROM address  WHERE position('ok' in lower(value))>0;
DELETE FROM address  WHERE position('-' in lower(value))>0;
DELETE FROM address  WHERE position('0 e' in lower(value))>0;
DELETE FROM address  WHERE position('quebrada' in lower(value))>0;
DELETE FROM address  WHERE position('ficha' in lower(value))>0;
DELETE FROM address  WHERE position('avenida' in lower(value))>0;
DELETE FROM address  WHERE position('estacionamiento' in lower(value))>0;
DELETE FROM address  WHERE position('privada' in lower(value))>0;
DELETE FROM address  WHERE position('comercio' in lower(value))>0;
DELETE FROM address  WHERE position('salud' in lower(value))>0;
DELETE FROM address  WHERE position('lotizar' in lower(value))>0;
DELETE FROM address  WHERE position('deportiva' in lower(value))>0;
DELETE FROM address  WHERE position('reserva' in lower(value))>0;
-- capitalizer text
UPDATE address SET value = initcap(value);
-- DROP COLUMN 
/*
ALTER TABLE address DROP COLUMN "addr:postcode";
ALTER TABLE address DROP COLUMN "addr:province";
ALTER TABLE address DROP COLUMN "addr:district";
ALTER TABLE address DROP COLUMN id_block;
*/
-- ADD COLUMN
ALTER TABLE address ADD COLUMN "addr:postcode" VARCHAR(10);
ALTER TABLE address ADD COLUMN "addr:province" VARCHAR(100);
ALTER TABLE address ADD COLUMN "addr:district"  VARCHAR(100);
ALTER TABLE address ADD COLUMN id_block INTEGER;

UPDATE address SET  "addr:province"='Huamanga', "addr:postcode"='05001', "addr:district"='Ayacucho' WHERE char_length(value)<=3;
ALTER TABLE address RENAME COLUMN value TO "addr:housenumber";
--select * from address WHERE position('deportiva' in lower(value))>0;
--=== AYACUCHO BLOCK
DELETE FROM block WHERE geom is null;
CREATE OR REPLACE FUNCTION get_blockid(_geom geometry)
RETURNS  INTEGER
AS $$
DECLARE
	_id INTEGER;	
	BEGIN
		_id =(select block .gid FROM block where st_dwithin(_geom,block.geom,0) limit 1) ;	
	RETURN _id;
	END;
$$ LANGUAGE plpgsql;
UPDATE buildings SET id_block=get_blockid(geom);
UPDATE address SET id_block=get_blockid(geom);
--======================================STTREETNAMES===================================
--====================================================================================
ALTER TABLE streetname RENAME COLUMN value TO name;

--======================================SIMPLIFICAR===================================
--====================================================================================
CREATE TABLE temp_build
(
  gid SERIAL NOT NULL,
  geom geometry(MultiLineString,4326),
  min_gid NUMERIC,
  max_gid NUMERIC,
  min_levels NUMERIC,
  max_leves  NUMERIC,
  numduples NUMERIC
);

INSERT INTO temp_build(geom,min_gid ,max_gid,min_levels,max_leves,numduples )
  SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
  numduples 
  FROM buildings 
  GROUP BY geom 
  HAVING COUNT(gid) > 1;

CREATE OR REPLACE FUNCTION simplificar(_a_gid NUMERIC,_b_gid NUMERIC)
RETURNS  INTEGER
AS $$
DECLARE
  _a_level NUMERIC;
  _b_level NUMERIC;
  _a_height NUMERIC;
  _b_height NUMERIC;
  _gid NUMERIC;
  BEGIN
      _a_level =(SELECT buildings."building:levels" FROM buildings WHERE buildings.gid=_a_gid);
      _b_level =(SELECT buildings."building:levels" FROM buildings WHERE buildings.gid=_b_gid);
      _a_height =(SELECT buildings.height FROM buildings WHERE buildings.gid=_a_gid);
      _b_height =(SELECT buildings.height FROM buildings WHERE buildings.gid=_b_gid);           
      IF _a_level > _b_level THEN
        raise notice 'Nivel Alto A: % ', _a_level;    
        IF _b_level = 1 THEN
          IF _b_height > _a_height THEN
            DELETE FROM buildings WHERE  gid=_a_gid;
          ELSE
            UPDATE buildings    
               SET height=(SELECT buildings.height FROM buildings WHERE buildings.gid=_a_gid),
               --"building:levels" = _a_level
               layer = ''|| _a_level    
            WHERE gid=_b_gid;         
            DELETE FROM buildings WHERE  gid=_a_gid;
          END IF;      
        ELSE
           DELETE FROM buildings WHERE  gid=_b_gid;       
        END IF;
      ELSE
        raise notice 'Nivel Alto B: % ', _b_level;    
        IF _a_level = 1 THEN
          IF  _a_height  > _b_height THEN
            DELETE FROM buildings WHERE  gid=_b_gid;
          ELSE
            UPDATE buildings      
               SET height=(SELECT buildings.height FROM buildings WHERE buildings.gid=_b_gid),
               --"building:levels" = _b_level
               layer = ''|| _b_level
            WHERE gid=_a_gid;
            DELETE FROM buildings WHERE  gid=_b_gid;
          END IF;                  
        ELSE
          DELETE FROM buildings WHERE  gid=_a_gid;      
        END IF;     
    END IF;     
  RETURN _gid;
  END;
$$ LANGUAGE plpgsql;

--== PRIMERA ITERACION
SELECT simplificar(min_gid ,max_gid) FROM temp_build;

--== SEGUNDA ITERACION
DROP TABLE temp_build;
CREATE TABLE temp_build
(
  gid SERIAL NOT NULL,
  geom geometry(MultiLineString,4326),
  min_gid NUMERIC,
  max_gid NUMERIC,
  min_levels NUMERIC,
  max_leves  NUMERIC,
  numduples NUMERIC
);
INSERT INTO temp_build(geom,min_gid ,max_gid,min_levels,max_leves,numduples )
  SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
  numduples 
  FROM buildings 
  GROUP BY geom 
  HAVING COUNT(gid) > 1;
SELECT simplificar(min_gid ,max_gid) FROM temp_build;

--== TERCERA ITERACION
DROP TABLE temp_build;
CREATE TABLE temp_build
(
  gid SERIAL NOT NULL,
  geom geometry(MultiLineString,4326),
  min_gid NUMERIC,
  max_gid NUMERIC,
  min_levels NUMERIC,
  max_leves  NUMERIC,
  numduples NUMERIC
);
INSERT INTO temp_build(geom,min_gid ,max_gid,min_levels,max_leves,numduples )
  SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
  numduples 
  FROM buildings 
  GROUP BY geom 
  HAVING COUNT(gid) > 1;
SELECT simplificar(min_gid ,max_gid) FROM temp_build;

--== CUARTA ITERACION
DROP TABLE temp_build;
CREATE TABLE temp_build
(
  gid SERIAL NOT NULL,
  geom geometry(MultiLineString,4326),
  min_gid NUMERIC,
  max_gid NUMERIC,
  min_levels NUMERIC,
  max_leves  NUMERIC,
  numduples NUMERIC
);
INSERT INTO temp_build(geom,min_gid ,max_gid,min_levels,max_leves,numduples )
  SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
  numduples 
  FROM buildings 
  GROUP BY geom 
  HAVING COUNT(gid) > 1;
SELECT simplificar(min_gid ,max_gid) FROM temp_build;

--==  eliminar datos no necesario
UPDATE buildings SET "building:levels"= null WHERE layer='BALCON_2P' or layer='BALCON 2P' or layer='BALCON_3P' or layer='BALCON 3P' or layer='BALCON_4P' or layer='BALCON 4P' or layer='BALCON_5P'or layer='BALCON 5P';
UPDATE buildings
   SET  "building:levels"= CAST(layer AS integer)  
 WHERE char_length(layer)=1;
--==  no overlap between buildings
SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
numdupes 
FROM buildings 
GROUP BY geom 
HAVING COUNT(gid) >1;
--==  eliminar table temp
DROP TABLE temp_build;
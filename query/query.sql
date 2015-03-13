--======================================BUILDINGS======================================
--=====================================================================================
--DROP COLUMNS
/*ALTER TABLE buildings DROP COLUMN building;
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
ALTER TABLE buildings DROP COLUMN id_block;*/
--Add COLUMNS
ALTER TABLE buildings ADD COLUMN building varchar(5);
ALTER TABLE buildings ADD COLUMN height numeric;
ALTER TABLE buildings ADD COLUMN min_height numeric;
ALTER TABLE buildings ADD COLUMN "building:levels" integer;
ALTER TABLE buildings ADD COLUMN "building:material" varchar(100);
ALTER TABLE buildings ADD COLUMN "source:height" varchar(100);
ALTER TABLE buildings ADD COLUMN "building:levels:underground" numeric;
ALTER TABLE buildings ADD COLUMN "building:part" varchar(3);
ALTER TABLE buildings ADD COLUMN "roof:material" varchar(100);
ALTER TABLE buildings ADD COLUMN "roof:shape" varchar(100);
ALTER TABLE buildings ADD COLUMN "roof:height" numeric;
ALTER TABLE buildings ADD COLUMN id_block numeric;
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
 WHERE layer='01_PRIMER PISO RUSTICO' OR layer='01_PRIMER PISO NOBLE' OR layer='01_PISO_MN' OR layer='01_PISO_MR' OR layer='01_PISO_MR' ;
--==01 sotano	
UPDATE buildings
  SET  "building:levels:underground"=1, "building:part"='yes', height=2
 WHERE layer='01_SOTANO_NOBLE' or layer='01_SOTANO_RUSTICO' or layer='SOTANO_01' or layer='LOTE 01 MR' or layer='SOTANO-01 MR' or layer='01_SOTANO_ NOBLE' ;
--==02 piso
--select count(*) as num, layer from buildings where position('02' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=4.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', min_height=2.5 , "roof:height" = 1.5
WHERE layer='02_SEGUNDO PISO RUSTICO' or layer='02_PISO_MR';
UPDATE buildings
  SET  "building:part"='yes', height=5.5 , "building:material"='concrete' ,"roof:material"='concrete',"roof:shape" = 'flat', min_height=3
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
  SET  "building:part"='yes', height=6.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', min_height=4.5, "roof:height" = 1.5
 WHERE layer='03_TERCER PISO RUSTICO';
UPDATE buildings
  SET  "building:part"='yes', height=8 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat', min_height=5.5
 WHERE layer='03_TERCER PISO NOBLE' or layer='03_PISO_MN';
UPDATE buildings
  SET "building:levels"=3
 WHERE layer='03_TERCER PISO NOBLE' OR layer='03_PISO_MN' OR layer='03_TERCER PISO RUSTICO';
 --==04 piso
--select count(*) as num, layer from buildings where position('04' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=8.5 , "building:material"='rustic',"roof:material"='slate',"roof:shape" = 'gabled', min_height=6.5
 WHERE layer='04_CUARTO PISO RUSTICO';
UPDATE buildings
  SET  "building:part"='yes', height=10.5 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat', min_height=8
 WHERE layer='04_CUARTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=4
 WHERE layer='04_CUARTO PISO NOBLE' OR layer='04_CUARTO PISO RUSTICO';
--==05 piso
--select count(*) as num, layer from buildings where position('05' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=13 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat', min_height=10.5
 WHERE layer='05_QUINTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=5
 WHERE layer='05_QUINTO PISO NOBLE';
--==06 piso
--select count(*) as num, layer from buildings where position('06' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET  "building:part"='yes', height=15.5, "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat', min_height=13
 WHERE layer='06_SEXTO PISO NOBLE';
UPDATE buildings
  SET "building:levels"=6
 WHERE layer='06_SEXTO PISO NOBLE';
--==07 piso
--select count(*) as num, layer from buildings where position('07' in lower(layer))>0 AND position('piso' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings
  SET "building:part"='yes', height=18 , "building:material"='concrete',"roof:material"='concrete',"roof:shape" = 'flat', min_height=15.5
WHERE layer='07_SEPTIMO PISO NOBLE';
UPDATE buildings SET "building:levels"=7 WHERE layer='07_SEPTIMO PISO NOBLE';
--== balcones
--select count(*) as num, layer from buildings where position('balcon' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings SET "building:part"='yes', height = 4, min_height=3 WHERE layer='BALCON_2P' or layer='BALCON 2P';
UPDATE buildings SET "building:part"='yes', height = 6.5, min_height=5.5 WHERE layer='BALCON_3P';
UPDATE buildings SET "building:part"='yes', height = 9, min_height=8 WHERE layer='BALCON_4P';
UPDATE buildings SET "building:part"='yes', height = 11.5, min_height=10.5 WHERE layer='BALCON_5P';
--== source:height
UPDATE buildings SET "source:height"='estimate';
--== corredores
--select count(*) as num, layer from buildings where position('corredor' in lower(layer))>0 group by layer order by num desc;
UPDATE buildings SET "building:part"='yes', height = 3 WHERE layer='CORREDOR 1P' or layer='CORREDOR_1P';
UPDATE buildings SET "building:part"='yes', height = 5.5 WHERE layer='CORREDOR 2P'; 
UPDATE buildings SET "building:part"='yes', height = 8 WHERE layer='CORREDOR 3P' or layer='CORREDOR_3P';
UPDATE buildings SET "building:part"='yes', height = 10.5 WHERE layer='CORREDOR_4P';

--======================================ADDRESS========================================
--=====================================================================================
--Eliminar datos que no tienes sentido
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
/*ALTER TABLE address DROP COLUMN "addr:postcode";
ALTER TABLE address DROP COLUMN "addr:province";
ALTER TABLE address DROP COLUMN "addr:district";
ALTER TABLE address DROP COLUMN id_block;*/
-- ADD COLUMN
ALTER TABLE address ADD COLUMN "addr:postcode" varchar(10);
ALTER TABLE address ADD COLUMN "addr:province" varchar(100);
ALTER TABLE address ADD COLUMN "addr:district"  varchar(100);
ALTER TABLE address ADD COLUMN id_block integer;

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
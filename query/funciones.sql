--DROP TABLE temp_build
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

--===PRIMERA ITERACION
SELECT simplificar(min_gid ,max_gid) FROM temp_build;

--===SEGUNDA ITERACION
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

--===TERCERA ITERACION
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

--===CUARTA ITERACION
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

--=================== eliminar datos no necesario
UPDATE buildings SET "building:levels"= null WHERE layer='BALCON_2P' or layer='BALCON 2P' or layer='BALCON_3P' or layer='BALCON 3P' or layer='BALCON_4P' or layer='BALCON 4P' or layer='BALCON_5P'or layer='BALCON 5P';
UPDATE buildings
   SET  "building:levels"= CAST(layer AS integer)  
 WHERE char_length(layer)=1;
--=================== no overlap between buildings
SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
numdupes 
FROM buildings 
GROUP BY geom 
HAVING COUNT(gid) >1;




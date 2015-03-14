--DROP TABLE temp_build
CREATE TABLE temp_build
(
  gid serial NOT NULL,
  geom geometry(MultiLineString,4326),
  min_gid numeric,
  max_gid numeric,
  min_levels numeric,
  max_leves  numeric,
  numduples numeric
);

SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
numdupes 
FROM buildings 
GROUP BY geom 
HAVING COUNT(gid) > 1;

INSERT INTO temp_build(geom,min_gid ,max_gid,min_levels,max_leves,numduples )
	SELECT geom, min(gid) as min_gid, max(gid) as max_gid,min("building:levels") as min_levels,max("building:levels") as max_levels,COUNT(gid) as 
	numduples 
	FROM buildings 
	GROUP BY geom 
	HAVING COUNT(gid) > 1;


CREATE OR REPLACE FUNCTION simplificar(_min_gid numeric,_max_gid numeric)
RETURNS  INTEGER
AS $$
DECLARE
	_a_height numeric;
	_b_height numeric;
	_a_min_height numeric;
	_b_min_height numeric;
	_gid numeric;
	BEGIN
		_a_height =(select buildings.height FROM buildings where buildings.gid=_min_gid);
		_b_height =(select buildings.height FROM buildings where buildings.gid=_max_gid);
		--_a_min_height =(select buildings.nim_height FROM buildings where buildings.gid=_min_gid);
		--_b_min_height =(select buildings.min_height FROM buildings where buildings.gid=_max_gid);
		IF _a_height > _b_height THEN
			--raise notice 'height: % ', _a_height;
			_gid=_min_gid;
			UPDATE buildings			
			   SET height=_a_height, 
			       building='yes',
			       "building:part"=null 
			 WHERE gid=_min_gid;
			 DELETE FROM buildings WHERE  gid=_max_gid;			 
		ELSE
			--raise notice 'height: % ', _b_height;
			_gid=_max_gid;
			UPDATE buildings			
			   SET height=_b_height, 
			       building='yes',
			       "building:part"=null 
			 WHERE gid=_max_gid;
			 DELETE FROM buildings WHERE  gid=_min_gid;			
		END IF;
			
	RETURN _gid;
	END;
$$ LANGUAGE plpgsql;


select simplificar(6190,36930)
SELECT simplificar(min_gid ,max_gid) FROM temp_build



select * from buildings where gid = 36930







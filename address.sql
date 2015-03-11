-- eliminando tag que no son relevantes 
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
UPDATE address 
   SET value = initcap(value)  
--select * from address WHERE position('deportiva' in lower(value))>0;


ALTER TABLE address RENAME COLUMN value TO "addr:housenumber";
ALTER TABLE address ADD COLUMN "addr:postcode" smallint;
ALTER TABLE address ADD COLUMN "addr:province" varchar(100);
ALTER TABLE address ADD COLUMN "addr:district"  varchar(100);






UPDATE address 
   SET bandera = true  
 WHERE char_length(addr_house)>10
















ALTER TABLE direccion2 ADD COLUMN num integer ;

CREATE OR REPLACE FUNCTION isnumeric(text) RETURNS BOOLEAN AS $$
DECLARE x NUMERIC;
BEGIN
    x = $1::NUMERIC;
    RETURN TRUE;
EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

SELECT isnumeric(addr_house)  from direccion2 




UPDATE direccion2 
   SET num = CAST(coalesce(addr_house) AS integer)   
 WHERE  isnumeric(addr_house) = true

 delete from direccion2 where addr_house= '0.23'

 



UPDATE direccion2 
   SET addr_house = num
 WHERE  num is not null

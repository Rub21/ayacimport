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
-- add colum

ALTER TABLE address RENAME COLUMN "addr:housenumber" TO value ;
ALTER TABLE address ADD COLUMN "addr:postcode" varchar(10);
ALTER TABLE address ADD COLUMN "addr:province" varchar(100);
ALTER TABLE address ADD COLUMN "addr:district"  varchar(100);
UPDATE address
   SET  "addr:province"='Huamanga', "addr:postcode"='05001', "addr:district"='Ayacucho'
 WHERE char_length(value)<=3

--select * from address WHERE position('deportiva' in lower(value))>0;






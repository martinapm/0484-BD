/*#01*/
SELECT COUNT (*);
FROM tienda.producto;


/*#02*/
SELECT COUNT (*);
FROM fabricante;


/*#03*/
SELECT COUNT(distinct codigo_fabricante) FROM tienda.producto;


/*#04*/
SELECT AVG(precio)FROM producto;


/*#05*/
SELECT min (precio)FROM producto;


/*#06*/
SELECT max (precio)FROM producto;
SELECT * FROM producto ORDER BY producto;


/*#07*/
SELECT nombre, min(precio) FROM tienda.producto;


/*#08*/
SELECT sum(precio); 
FROM tienda.producto;


/*#09*/
SELECT COUNT(*) FROM tienda.producto WHERE codigo_fabricante =1;


/*#010*/
SELECT AVG(precio) FROM tienda.producto WHERE codigo_fabricante =1;


/*#011*/
SELECT min (precio) FROM tienda.producto WHERE codigo_fabricante =1;


/*#012*/
SELECT max(precio) FROM tienda.producto WHERE codigo_fabricante =1;


/*#013*/
SELECT sum(precio) FROM tienda.producto WHERE codigo_fabricante =1;


/*#014*/
SELECT min (precio) AS MINIMO , MAX (precio) AS MAXIMO, AVG(precio) AS MEDIA, COUNT(*) AS TOTAL_PRODUCTOS FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE LOWER (nombre) = 'Crucial')


/*#018*/
SELECT codigo fabricante, MIN (precio), MAX(precio), AVG (precio) COUNT (*) FROM producto GROUP BY codigo_fabricante HAVING ASG(precio)>200 ORDER BY codigo_fabricante asc


/*#020*/
SELECT COUNT (*) FROM tienda. producto WHERE precio < 180


/*#021*/
SELECT codigo fabricante, COUNT(*) FROM tienda. producto WHERE precio >= 180 GROUP BY codigo_fabricante
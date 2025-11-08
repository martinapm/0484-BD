/*#01*/
SELECT nombre FROM producto;


/*#02*/
SELECT nombre, precio FROM producto;


/*#03*/
SELECT * FROM producto;


/*#04*/
SELECT nombre, 
					CONCAT (FORMAT (precio, 'USD')) AS 'dolares', 
					CONCAT(FORMAT(precio * 1.05, '€')) AS 'euros',
					FROM tienda.producto;


/*#05*/
SELECT nombre AS "nombre de producto", precio AS "euros", precio * 1.1 AS "dólares" FROM producto;


/*#06*/
SELECT UPPER (nombre) AS nombre, precio FROM producto;


/*#07*/
SELECT LOWER(nombre) AS nombre, precio FROM producto;


/*#08*/
SELECT nombre, UPPER (LEFT(nombre,2)) AS iniciales FROM fabricante;


/*#09*/
SELECT nombre, ROUND (precio) AS precio FROM producto;


/*#010*/
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;


/*#011*/
SELECT DISTINCT codigo_fabricante FROM producto;


/*#012*/
SELECT codigo_fabricante FROM producto;


/*#013*/
SELECT nombre FROM fabricante ORDER BY nombre ASC;


/*#014*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;


/*#015*/
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;


/*#016*/
SELECT * FROM fabricante LIMIT 5;


/*#017*/
SELECT * FROM fabricante LIMIT 3,2;
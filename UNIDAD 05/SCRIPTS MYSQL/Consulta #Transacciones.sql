/*#00*/
SELECT *
FROM producto;

SET AUTOCOMMIT = 1;
SELECT @@AUTOCOMMIT;
DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE
);


INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');


/*#01  ¿Qué devolverá esta consulta?*/
SELECT *
FROM producto;
--Lo que hemos metido en el insert, las columnas de id, nombre y precio


/*#02 Vamos a intentar deshacer la transacción actual */
ROLLBACK;


/*#03 ¿Qué devolverá esta consulta? Justifique su respuesta.*/
SELECT *
FROM producto;
--- devolverá lo mismo ya que no hemos borrado la tabla producto, se queda igual


/*#04 Ejecutamos la siguiente transacción */
START TRANSACTION;
INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SELECT * FROM producto;
ROLLBACK;


/*#05 ¿Qué devolverá esta consulta? Justifique su respuesta. */
SELECT * FROM producto;
--Aunque hayamos hecho una transacción de insertar una nueva fila, devolverá solo las 3 primeras filas, ya que hemos hecho un rollback y no hemos hecho  un commit para poder guardar esa sentencia.


/*#06 Ejecutamos la siguiente transacción */
INSERT INTO producto (id, nombre) VALUES (5, 'Quinto');
ROLLBACK;


/*#07 ¿Qué devolverá esta consulta? Justifique su respuesta. */
SELECT * FROM producto;
---Solo devuelve las filas 1,2,3,5 ya que hemos hecho un rollback y no se ha guardado los datos


/*#08 Desactivamos el modo AUTOCOMMIT y borramos el contenido de la tabla */
SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;
DELETE FROM producto WHERE id > 0;


/*#09 Comprobamos que la tabla esta vacia */
SELECT * FROM producto;
-- Esta vacia


/*#010 Insertamos dos filas nuevas */
INSERT INTO producto (id, nombre) VALUES (6, 'Sexto');
INSERT INTO producto (id, nombre) VALUES (7, 'Séptimo');
SELECT * FROM producto;


/*#011 Hacemos un ROLLBACK */
ROLLBACK;


/*#012 ¿Qué devolverá esta consulta? Justifique su respuesta.*/
SELECT * FROM producto;
---Devuelve las filas 1,2,3,5 ya que se ha cargado los datos que se habian guardado antes del rollback


/*#013 Ejecutamos la siguiente transacción */
SET AUTOCOMMIT = 0;
START TRANSACTION;
CREATE TABLE fabricante (id INT UNSIGNED);
INSERT INTO fabricante (id) VALUES (1);
SELECT * FROM fabricante;
ROLLBACK;


/*#014 ¿Se puede hacer ROLLBACK de instrucciones de tipo DDL (CREATE, ALTER, DROP, RENAME y TRUNCATE)? */
---No, porque esas instrucciones (...)
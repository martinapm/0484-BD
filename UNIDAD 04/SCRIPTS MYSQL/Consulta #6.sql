/*#01*/
SELECT fabricante.nombre, producto.nombre
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;


/*#02*/
SELECT fabricante.nombre
FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo IS NULL;


/*#03*/
No, porque no pueden existir productos sin un fabricante asociado, porque
la tabla producto tiene una clave foránea (el codigo fabricante) que hace 
referencia a la columna codigo de la tabla fabricante.
Esta relación implica un producto siempre debe tener un fabricante existente 
en la tabla fabricante.



FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo);

Si intento insertar un  producto con un codigo_fabricante inexistente, la base
de datos generaría un error.
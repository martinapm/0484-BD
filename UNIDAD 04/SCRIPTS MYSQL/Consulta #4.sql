SELECT * FROM producto CROSS JOIN fabricante;

SELECT * FROM fabricante.nombre, producto.nombre FROM fabricante 
JOIN producto ON (fabricante.codigo = producto.codigo_fabricante)
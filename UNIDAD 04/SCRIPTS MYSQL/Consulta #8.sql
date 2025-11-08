/*#01*/
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);


/*#02*/
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);


/*#03*/
SELECT nombre
FROM producto
WHERE codigo_producto = (
									SELECT codigo_producto
									FROM detalle_pedido
									GROUP BY codigo_producto
									ORDER BY SUM(cantidad) DESC
									LIMIT 1
);


/*#04 (En vez de COALESCE USAR EL IFNULL)*/
SELECT nombre_cliente
FROM cliente
WHERE limite_credito > (SELECT SUM(forma_pago)
                        FROM pago
                        WHERE cliente.codigo_cliente = pago.codigo_cliente);


/*#05*/
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto);


/*#06*/
SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);


/*#07*/
SELECT nombre, apellido1, apellido2
FROM empleado
WHERE codigo_jefe = (
							SELECT codigo_empleado
							FROM empleado
							WHERE nombre = 'Alberto' AND apellido1 = 'Soria'
);


/*#08*/
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito
										FROM cliente
);


/*#09*/
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta
									FROM producto
);


/*#010*/
SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock
											FROM producto)
;


/*#011*/
SELECT nombre, apellido1, apellido2
FROM empleado
WHERE codigo_empleado NOT IN (SELECT DISTINCT codigo_empleado_rep_ventas
										FROM cliente
										WHERE codigo_empleado_rep_ventas IS NOT NULL
);


/*#012*/
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente NOT IN(
										SELECT DISTINCT codigo_cliente
										FROM pago
);


/*#013*/
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (
									SELECT DISTINCT codigo_cliente
									FROM pago
);


/*#014*/
SELECT nombre
FROM producto
WHERE codigo_producto NOT IN (
										SELECT DISTINCT codigo_producto
										FROM detalle_pedido
);


/*#015*/
SELECT nombre, apellido1, apellido2, puesto, oficina.telefono
FROM empleado
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE codigo_empleado NOT IN (
										SELECT DISTINCT codigo_empleado_rep_ventas
										FROM cliente
										WHERE codigo_empleado_rep_ventas IS NOT NULL
);


/*#017*/
SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (
									SELECT DISTINCT codigo_cliente
									FROM pedido
)
AND codigo_cliente NOT IN (
									SELECT DISTINCT codigo_cliente
									FROM pago
);
/*#01*/
SELECT DISTINCT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;



/*#02*/
SELECT DISTINCT cliente.nombre_cliente 
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente;


/*#03*/
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2, pago.codigo_cliente
FROM cliente
JOIN empleado ON (cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
)
LEFT JOIN pago ON (pago.codigo_cliente = cliente.codigo_cliente)
WHERE pago.codigo_cliente IS NULL


/*#04*/
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;


/*#05*/
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE cliente.codigo_cliente;


SELECT DISTINCT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;



/*#06*/
SELECT DISTINCT oficina.linea_direccion1, oficina.linea_direccion2
FROM oficina
JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina
JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.ciudad = 'Fuenlabrada';


SELECT DISTINCT oficina.linea_direccion1, oficina.linea_direccion2, oficina.ciudad, oficina.pais
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;
WHERE cliente.ciudad = 'Fuenlabrada';


/*#07*/
SELECT cliente.nombre_cliente, gama_producto.gama
FROM cliente 
JOIN pedido  ON cliente.codigo_cliente = pedido.codigo_cliente
JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
JOIN gama_producto ON producto.gama = gama_producto.gama
GROUP BY cliente.nombre_cliente, gama_producto.gama;



/*#08*/
SELECT
CONCAT_WS(' ',e.nombre, e.apellido1) AS empleado, j.nombre AS jefe
FROM empleado e
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado;


/*#09*/
SELECT 
CONCAT_WS (' ' ,empleado.nombre, empleado.apellido1, empleado.apellido2) AS empleado, 
CONCAT_WS (' ' ,j.nombre, j.apellido1, j.apellido2) AS jefe, 
CONCAT_WS (' ' ,jj.nombre, jj.apellido1, jj.apellido2) AS nombre_del_jefe_supremo
FROM empleado
LEFT JOIN empleado j ON empleado.codigo_jefe = j.codigo_empleado
LEFT JOIN empleado jj ON j.codigo_jefe = jj.codigo_empleado;


/*#010*/
SELECT DISTINCT cliente.nombre_cliente
FROM cliente
JOIN pedido ON cliente.codigo_cliente = pedido.codigo_pedido
WHERE pedido.fecha_entrega > pedido.fecha_esperada;


/*#011*/
SELECT DISTINCT cliente.nombre_cliente, gama_producto.gama
FROM cliente
JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
JOIN gama_producto ON producto.gama = gama_producto.gama;


/*#012*/
SELECT DISTINCT cliente.nombre_cliente AS clientes_ningun_pago
FROM cliente
LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;


/*#013*/
SELECT cliente.nombre_cliente AS clientes_ningun_pedido
FROM cliente
LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;


/*#014*/
SELECT cliente.nombre_cliente AS clientes_sin_pago_y_pedido
FROM cliente
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)
	AND cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pedido);


/*#015*/
SELECT empleado.nombre, empleado.apellido1
FROM empleado 
WHERE empleado.codigo_oficina IS NULL;

SELECT empleado.*
FROM empleado 
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_oficina IS NULL;


/*#016*/
SELECT empleado.nombre, empleado.apellido1
FROM empleado
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE cliente.codigo_empleado_rep_ventas IS NULL;


/*#017*/
SELECT empleado.nombre, empleado.apellido1, oficina.ciudad, oficina.linea_direccion1
FROM empleado
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.codigo_empleado_rep_ventas IS NULL;


/*#018*/
SELECT empleado.nombre, empleado.apellido1
FROM empleado
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE empleado.codigo_oficina IS NULL OR cliente.codigo_empleado_rep_ventas IS NULL;


/*#019*/
SELECT producto.codigo_producto, producto.nombre
FROM producto
LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL;


/*#020*/
SELECT producto.nombre, producto.descripcion
FROM producto
LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL;


/*#021*/
SELECT o.codigo_oficina, o.ciudad
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
LEFT JOIN gama_producto gp ON pr.gama = gp.gama
WHERE gp.gama = 'Frutales' AND e.codigo_empleado IS NULL;


/*#022*/
SELECT DISTINCT cliente.nombre_cliente
FROM cliente
JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;


/*#023*/
SELECT 
CONCAT_WS (' ', e.nombre, e.apellido1) AS empleado,
CONCAT_WS (' ' ,j.nombre, j.apellido1) AS jefe
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;


/*#024*/
SELECT COUNT (*) AS numero_empleados
FROM empleado;


/*#025*/
SELECT c.pais, COUNT(*), AS numero_clientes
FROM cliente c
GROUP BY c.pais;


/*#026*/
SELECT AVG(p.monto) AS pago_medio_2009
FROM pago p
WHERE strftime('%Y'), p.fecha_pago) = '2009';
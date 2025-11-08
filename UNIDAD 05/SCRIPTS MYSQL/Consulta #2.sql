/*#01*/
INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) 
VALUES ('ALM-ES', 'Almería', 'España', 'Andalucía', '04001', '+34 950 123456', 'Avenida Mediterráneo, 12', NULL);


/*#02*/
INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
VALUES ( 32, 'Marcos', 'Gutierrez', 'Avila', '40001', 'margutavil@jardineria.com', 'ALM-ES', NULL, 'Representantes de Ventas');  


/*#03*/
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) 
VALUES (42, 'Jardines Almería', 'Carlos', 'Martinez', '+34 950 654321', '+34 950 654322', 'Calle Altamira, 5', NULL, 'Almería', 'Andalucía', 'España', '04002', 32, 12000);


/*#04*/
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, estado, comentarios, codigo_cliente) 
VALUES (200, '2025-01-28', '2025-02-01', 'Pendiente', 'Pedido para Jardines Almería', 42);


/*#05*/
UPDATE cliente 
SET codigo_cliente = 50 
WHERE codigo_cliente = 42;


comprobar que ha salido:

SELECT * FROM pedido WHERE codigo_cliente = 50;
SELECT * FROM detalle_pedido WHERE codigo_pedido IN (
    SELECT codigo_pedido FROM pedido WHERE codigo_cliente = 50
);


/*#06*/
DELETE FROM cliente 
WHERE codigo_cliente = 50;


/*#07*/
DELETE FROM cliente 
WHERE codigo_cliente NOT IN (
    SELECT DISTINCT codigo_cliente 
    FROM pedido
);
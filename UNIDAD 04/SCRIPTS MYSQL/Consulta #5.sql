/*#01*/
#SQL1
SELECT *
FROM empleado , departamento
WHERE empleado.id_departamento = departamento.id


/*#SQL2*/
SELECT *
FROM empleado
JOIN departamento ON (empleado.id_departamento = departamento.id)
WHERE departamento.ID = 3;


/*#02*/
SELECT empleado.nombre, CONCAT_WS(' ', apellido1, apellido2) AS apellidos,
departamento.* FROM empleado
JOIN departamento
	ON(empleado.id_departamento = departamento.id)
	ORDER BY departamento.nombre ASC, apellidos ASC, empleado.nombre


/*#03*/
SELECT DISTINCT departamento.id, departamento.nombre
FROM departamento
JOIN empleado ON (empleado.id = departamento.id
)
WHERE empleado.id_departamento IS NOT NULL;


/*#04*/
SELECT DISTINCT departamento.id, departamento.nombre, departamento.presupuesto - departamento.gastos AS PRESUPUESTO_IDEAL
FROM departamento
JOIN empleado ON (empleado.id = departamento.id
)
WHERE empleado.id_departamento IS NOT NULL; 


/*#05*/
SELECT departamento.nombre
FROM departamento
JOIN empleado ON (empleado.id = departamento.id
)
WHERE empleado.nif = '38382980M'


/*#06*/
SELECT departamento.nombre
FROM departamento
JOIN empleado ON (empleado.id = departamento.id
)
WHERE empleado.nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana'


/*#06(2)*/
SELECT departamento.nombre
FROM departamento
JOIN empleado ON (empleado.id = departamento.id
)
WHERE CONCAT_WS( ' ', empleado.nombre, apellido1, apellido2 = 'Pepe ruiz santana')


/*#07*/
SELECT empleado.*
FROM empleado
JOIN departamento ON(empleado.id = departamento.id
)
WHERE 
departamento.nombre LIKE 'I+D'
ORDER BY empleado.nombre, empleado.apellido1


/*#08*/
SELECT empleado.*
FROM empleado
JOIN departamento ON(empleado.id = departamento.id
)
WHERE 
departamento.nombre IN ('I+D', 'sistemas','contabilidad')
ORDER BY empleado.nombre, empleado.apellido1


/*#09*/
SELECT empleado.*
FROM empleado
JOIN departamento ON(empleado.id = departamento.id
)
WHERE 
departamento.presupuesto NOT BETWEEN 100000 AND 200000
ORDER BY empleado.nombre, empleado.apellido1


/*#09(2)*/
SELECT empleado.*
FROM empleado
JOIN departamento ON(empleado.id = departamento.id
)
WHERE NOT
departamento.presupuesto >= 100000 AND 
departamento.presupuesto <= 200000
ORDER BY empleado.nombre, empleado.apellido1


/*#010*/
SELECT departamento.nombre
FROM empleado
JOIN departamento ON(empleado.id = departamento.id
)
WHERE apellido2 IS NULL
ORDER BY empleado.nombre, empleado.apellido2
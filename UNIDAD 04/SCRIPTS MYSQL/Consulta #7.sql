/*#01*/
SELECT empleado.nombre, departamento.nombre
FROM empleado
LEFT JOIN departamento
ON empleado.id_departamento = departamento.id;


/*#02*/
SELECT empleado.nombre
FROM empleado
LEFT JOIN departamento
ON empleado.id_departamento = departamento.id
WHERE departamento.id IS NULL;


/*#03*/
 SELECT departamento.nombre
 FROM departamento
 LEFT JOIN empleado
 ON departamento.id = empleado.id_departamento


/*#04*/
SELECT empleado.nombre, departamento.nombre
FROM empleado
LEFT JOIN departamento
ON empleado.id_departamento = departamento.id
ORDER BY departamento.nombre;

UNION 

 SELECT empleado.nombre
 departamento.nombre = NOMBRE, departamento.nombre, departmaneto.presupuesto, departamento.gastos
 FROM .*
 RIGHT JOIN departamento
 ON empleado.id_departamento = empleado.id_empleado


/*#05*/
SELECT empleado.nombre, departamento.nombre
FROM empleado
ON empleado.id_departamento = departamento.id;
WHERE empleado.id_departamento IS NULL OR departamento.id
ORDER BY departamento.nombre;

UNION 

 SELECT empleado.nombre
 departamento.nombre = NOMBRE, departamento.nombre, departmaneto.presupuesto, departamento.gastos
 FROM .*
 RIGHT JOIN departamento
 ON empleado.id_departamento = empleado.id_empleado
 WHERE ....
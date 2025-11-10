/*#01*/
INSERT INTO departamento (id, nombre, presupuesto, gastos)
VALUES (8, 'Marketing', 50000, 0);


SELECT * FROM departamento;


/*#02*/
INSERT INTO departamento (nombre, presupuesto)
VALUES ('Ventas', 30000);


SELECT * FROM departamento;


/*#03*/
INSERT INTO departamento (id, nombre, presupuesto, gastos)
VALUES (10, 'Logística', 80000, 10000);


/*#04*/
INSERT INTO empleado (id, nif, nombre, apellido1, apellido2, id_departamento)
VALUES (14, '12345678A', 'Alberto', 'Pérez', 'Salinas', 8);


/*#05*/
INSERT INTO empleado (nif, nombre, apellido1, apellido2, id_departamento)
VALUES ('547896321D', 'Macarena', 'García', 'Som', 5)

SELECT * FROM empleado;


/*#06*/
CREATE TABLE departamento_backup LIKE departamento;
INSERT INTO departamento_backup SELECT * FROM departamento;


/*#07*/
DELETE FROM departamento WHERE nombre = 'Proyectos';
(No es posible de primeras eliminarlo, porque hay restricciones de clave
foranea, hay que eliminar primero los empleados asociados a ese departamento)

Seria primero:

DELETE FROM empleado WHERE id_departamento = (SELECT id FROM departamento WHERE nombre = 'Proyectos');
DELETE FROM departamento WHERE nombre = 'Proyectos';
(CON ESTE NO HACE FALTA PONER LO DE ABAJO, SOLO LA PRIMERA LINEA)


/*#08*/
DELETE FROM empleado WHERE id_departamento = (SELECT id FROM departamento WHERE nombre = 'Desarrollo');
DELETE FROM departamento WHERE nombre = 'Desarrollo';


/*#09 Actualizar el código del departamento Recursos Humanos a 30:*/

UPDATE departamento SET departamento.id = 30 WHERE departamento.nombre = 'Recursos Humanos';
ALTER TABLE empleado MODIFY COLUMN EMPLEADO.ID_DEPARTAMENTO FOREIGN KEY(ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID)
ON UPDATE SET CASCADE;


/*#010 Actualizar el código del departamento Publicidad a 40: Similar al ejercicio anterior:*/
UPDATE empleado SET id_departamento = 40 WHERE id_departamento = (SELECT id FROM departamento WHERE nombre = 'Publicidad');
UPDATE departamento SET id = 40 WHERE nombre = 'Publicidad';


/*#011	Aumentar en 50,000 € el presupuesto de departamentos con menos de 20,000 €:*/
UPDATE departamento
SET presupuesto = presupuesto + 50000
WHERE presupuesto < 20000;


/*#012	Eliminar empleados sin un departamento asociado (con transacción):*/
START TRANSACTION;
DELETE FROM empleado WHERE id_departamento NOT IN (SELECT id FROM departamento);
COMMIT;
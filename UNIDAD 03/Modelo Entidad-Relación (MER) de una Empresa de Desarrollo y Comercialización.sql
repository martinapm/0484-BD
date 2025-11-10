CREATE TABLE SUCURSAL (
                                ID_SUCURSAL VARCHAR2(10) PRIMARY KEY,
                                NOMBRE VARCHAR2(20) NOT NULL,
                                DIRECCION VARCHAR2(20)
);

CREATE TABLE DEPARTAMENTO (
                                ID_DEPARTAMENTO VARCHAR2(10),
                                ID_SUCURSAL VARCHAR2 (10),
                                NOMBRE VARCHAR2 (20),
                                DIRECCION VARCHAR2(20),
                                PRIMARY KEY (ID_DEPARTAMENTO, ID_SUCURSAL),
                                FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL (ID_SUCURSAL)
);

CREATE TABLE COMERCIAL (
                                DNI VARCHAR2(9) PRIMARY KEY,
                                NOMBRE VARCHAR2(10),
                                APELLIDOS VARCHAR2(20),
                                FECHA_NACIMIENTO DATE,
                                BONIFICACION FLOAT (10) CHECK (BONIFICACION >=0),
                                TITULACION VARCHAR2 (20),
                                ID_DEPARTAMENTO VARCHAR2(10),
                                ID_SUCURSAL VARCHAR2(10),
                                FOREIGN KEY (ID_DEPARTAMENTO, ID_SUCURSAL) REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO, ID_SUCURSAL)
);

CREATE TABLE PROGRAMADOR (
                                DNI VARCHAR2(9) PRIMARY KEY,
                                NOMBRE VARCHAR2(10),
                                APELLIDOS VARCHAR2(10),
                                FECHA_NACIMIENTO DATE,
                                LENGUAJES VARCHAR2(20),
                                PUESTO VARCHAR2(20),
                                ID_DEPARTAMENTO VARCHAR2(10),
                                ID_SUCURSAL VARCHAR2(10),
                                FOREIGN KEY (ID_DEPARTAMENTO, ID_SUCURSAL) REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO, ID_SUCURSAL)
);

CREATE TABLE PROYECTOS (
                                COD_PROYECTO VARCHAR2 (10) PRIMARY KEY,
                                NOMBRE VARCHAR2(10),
                                DESCRIPCION VARCHAR2(30),
                                ID_DEPARTAMENTO VARCHAR2(10),
                                ID_SUCURSAL VARCHAR2(10),
                                FOREIGN KEY (ID_DEPARTAMENTO, ID_SUCURSAL) REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO, ID_SUCURSAL)
);

CREATE TABLE CLIENTE (
                               ID_CLIENTE VARCHAR2(10) PRIMARY KEY,
                               NOMBRE VARCHAR2(10),
                               TELEFONO NUMBER (9),
                               DIRECCION VARCHAR2(20),
                               EMAIL VARCHAR2(20) UNIQUE

);

CREATE TABLE PROYECTO_CLIENTE (
                              COD_PROYECTO VARCHAR2 (10),
                              ID_CLIENTE VARCHAR2(10),
                              PRIMARY KEY (COD_PROYECTO, ID_CLIENTE),
                              FOREIGN KEY (COD_PROYECTO) REFERENCES PROYECTOS (COD_PROYECTO),
                              FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);                       
             
             
CREATE VIEW VISTA_CLIENTE AS
SELECT NOMBRE, TELEFONO, DIRECCION, EMAIL 
FROM CLIENTE
            
             
             
//CREATE USER practica3 IDENTIFIED BY PASSWORD;
//GRANT SELECT, INSERT ON COMERCIAL TO practica3; 
             
             
             
             
             
                                     
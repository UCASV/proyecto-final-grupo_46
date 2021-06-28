CREATE DATABASE Vaccination_Program;
USE Vaccination_Program;
SET LANGUAGE us_english;


------------------------------------
CREATE TABLE DIRECCION_CIUDADANO(
	id INT PRIMARY KEY IDENTITY,
	colonia VARCHAR(40),
	calle VARCHAR(40) NOT NULL,
	no_casa INT NOT NULL,
	municipio VARCHAR(24) NOT NULL,
	departamento VARCHAR(12) NOT NULL,
); --1

CREATE TABLE ESTADO_VACUNACION(
	id INT PRIMARY KEY IDENTITY,
	estado VARCHAR(13) NOT NULL,
); --2 // (Estados: no vacunado, primera dosis, segunda dosis)

CREATE TABLE ENFERMEDAD(
	id INT PRIMARY KEY IDENTITY,
	enfermedad VARCHAR(100) NOT NULL,
); --3 // (Enfermedades cronicas: no determinadas)

CREATE TABLE INSTITUCION(
	id INT PRIMARY KEY IDENTITY,
	institucion VARCHAR(100) NOT NULL,
); --4 // (Institucion: Educacion, Salud, Policia Nacional Civil, Gobierno, Fuerza Armada, Periodismo, Otra)

CREATE TABLE EFECTO(
	id INT PRIMARY KEY IDENTITY,
	efecto VARCHAR(50) NOT NULL,
); --5 // tiempo en minutos // (Efectos: Dolor en el sitio de la inyección, sensibilidad en el sitio de la inyección,
-- enrojecimiento en el sitio de la inyección, fatiga, dolor de cabeza, fiebre, mialgia, artralgia, anafilaxia, otros)

CREATE TABLE TIEMPO_EFECTO(
	id INT PRIMARY KEY IDENTITY,
	tiempo_efecto TIME NOT NULL,
);

CREATE TABLE DOSIS(
	id INT PRIMARY KEY IDENTITY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_efecto INT,
	id_tiempo_efecto INT,
); --6 //FK: id_effecto

CREATE TABLE TELEFONO(
	id INT PRIMARY KEY IDENTITY,
	telefono INT CHECK (telefono LIKE '[2,7,8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	id_ciudadano INT,
); --7 //FK: id_ciudadano

CREATE TABLE FILA(
	id INT PRIMARY KEY IDENTITY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_ciudadano INT,
); --8 //FK: id_ciudadano

CREATE TABLE CIUDADANO(
	id INT PRIMARY KEY IDENTITY,
	dui CHAR(10) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo_electronico VARCHAR(89),
	id_direccion_ciudadano INT NOT NULL,
	id_dosis INT,
	id_estado_vacunacion INT,
	id_enfermedad INT,
	id_institucion INT,
); --9 //FK: id_dosis, id_estado_vacunacion, id_enfermedad, id_direccion_ciudadano, id_institucion

CREATE TABLE GRUPO_PRIORITARIO(
	id INT PRIMARY KEY IDENTITY,
	grupo_prioritario VARCHAR(63) NOT NULL,
);

CREATE TABLE FORMULARIO(
	id INT PRIMARY KEY IDENTITY,
	no_fromulario INT NOT NULL,
	id_ciudadano INT,
	id_gestor INT,
	id_grupo_prioritario INT,
); --10 //FK: id_ciudadano

CREATE TABLE GESTOR(
	id INT PRIMARY KEY IDENTITY,
	usuario VARCHAR(25) NOT NULL,
	contrasena VARCHAR(15) NOT NULL,
	id_registro INT,
); --11 //FK: id_registro, id_formulario

CREATE TABLE REGISTRO(
	id INT PRIMARY KEY IDENTITY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_cabina INT,
); --12 //FK: id_cabina


CREATE TABLE REGISTROXEMPLEADO(
	id INT PRIMARY KEY IDENTITY,
	id_registro INT,
	id_empleado INT,
); --13 //FK: id_registro, id_empleado

CREATE TABLE EMPLEADO(
	id INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(100),
	correo VARCHAR(89),
	id_direccion_empleado INT,
	id_gestor INT,
	id_cabina INT,
	id_tipo INT,
); --14 //FK: id_direccion, id_gestor, id_cabina, id_tipo

CREATE TABLE DIRECCION_EMPLEADO(
	id INT PRIMARY KEY IDENTITY,
	colonia VARCHAR(40),
	calle VARCHAR(40) NOT NULL,
	no_casa INT NOT NULL,
	municipio VARCHAR(24) NOT NULL,
	departamento VARCHAR(12) NOT NULL,
); --15

CREATE TABLE CABINA(
	id INT PRIMARY KEY IDENTITY,
	direccion VARCHAR(100) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(89) NOT NULL,
	telefono INT CHECK (telefono LIKE '[2][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
); --16

CREATE TABLE TIPO(
	id INT PRIMARY KEY IDENTITY,
	tipo VARCHAR(18) NOT NULL,
); --17

--------------------------------------------

ALTER TABLE DOSIS ADD FOREIGN KEY(id_efecto) REFERENCES EFECTO(id);
ALTER TABLE DOSIS ADD FOREIGN KEY(id_tiempo_efecto) REFERENCES TIEMPO_EFECTO(id);

ALTER TABLE TELEFONO ADD FOREIGN KEY(id_ciudadano) REFERENCES CIUDADANO(id);

ALTER TABLE FILA ADD FOREIGN KEY(id_ciudadano) REFERENCES CIUDADANO(id);

ALTER TABLE CIUDADANO ADD FOREIGN KEY(id_direccion_ciudadano) REFERENCES DIRECCION_CIUDADANO(id);
ALTER TABLE CIUDADANO ADD FOREIGN KEY(id_dosis) REFERENCES DOSIS(id);
ALTER TABLE CIUDADANO ADD FOREIGN KEY(id_estado_vacunacion) REFERENCES ESTADO_VACUNACION(id);
ALTER TABLE CIUDADANO ADD FOREIGN KEY(id_enfermedad) REFERENCES ENFERMEDAD(id);
ALTER TABLE CIUDADANO ADD FOREIGN KEY(id_institucion) REFERENCES INSTITUCION(id);

ALTER TABLE FORMULARIO ADD FOREIGN KEY(id_ciudadano) REFERENCES CIUDADANO(id);
ALTER TABLE FORMULARIO ADD FOREIGN KEY(id_grupo_prioritario) REFERENCES GRUPO_PRIORITARIO(id);
ALTER TABLE FORMULARIO ADD FOREIGN KEY(id_gestor) REFERENCES GESTOR(id);

ALTER TABLE GESTOR ADD FOREIGN KEY(id_registro) REFERENCES REGISTRO(id);

ALTER TABLE REGISTRO ADD FOREIGN KEY(id_cabina) REFERENCES CABINA(id);

ALTER TABLE REGISTROXEMPLEADO ADD FOREIGN KEY(id_registro) REFERENCES REGISTRO(id);
ALTER TABLE REGISTROXEMPLEADO ADD FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id);

ALTER TABLE EMPLEADO ADD FOREIGN KEY(id_direccion_empleado) REFERENCES DIRECCION_EMPLEADO(id);
ALTER TABLE EMPLEADO ADD FOREIGN KEY(id_gestor) REFERENCES GESTOR(id);
ALTER TABLE EMPLEADO ADD FOREIGN KEY(id_cabina) REFERENCES CABINA(id);
ALTER TABLE EMPLEADO ADD FOREIGN KEY(id_tipo) REFERENCES TIPO(id);

--------------------------------------------


INSERT INTO ESTADO_VACUNACION VALUES('No vacunado');
INSERT INTO ESTADO_VACUNACION VALUES('Primera dosis');
INSERT INTO ESTADO_VACUNACION VALUES('Segunda dosis');

INSERT INTO INSTITUCION VALUES('Educacion');
INSERT INTO INSTITUCION VALUES('Salud');
INSERT INTO INSTITUCION VALUES('Policia Nacional Civil');
INSERT INTO INSTITUCION VALUES('Gobierno');
INSERT INTO INSTITUCION VALUES('Fuerza Armada');
INSERT INTO INSTITUCION VALUES('Periodismo');
INSERT INTO INSTITUCION VALUES('Otra');

INSERT INTO EFECTO VALUES('Dolor en el sitio de la inyección');
INSERT INTO EFECTO VALUES('Sensibilidad en el sitio de la inyección');
INSERT INTO EFECTO VALUES('Enrojecimiento en el sitio de la inyección');
INSERT INTO EFECTO VALUES('Fatiga');
INSERT INTO EFECTO VALUES('Dolor de cabeza');
INSERT INTO EFECTO VALUES('Fiebre');
INSERT INTO EFECTO VALUES('Mialgia');
INSERT INTO EFECTO VALUES('Artralgia');
INSERT INTO EFECTO VALUES('Anafilaxia');
INSERT INTO EFECTO VALUES('Otros');

INSERT INTO GRUPO_PRIORITARIO VALUES('Adultos mayores de 60 años');
INSERT INTO GRUPO_PRIORITARIO VALUES('Personal del sistema integrado de salud');
INSERT INTO GRUPO_PRIORITARIO VALUES('Encargados de la seguridad nacional');
INSERT INTO GRUPO_PRIORITARIO VALUES('Personas mayores de 18 años con enfermedades no transmisibles o alguna discapacidad');
INSERT INTO GRUPO_PRIORITARIO VALUES('Personal del gobierno central');

INSERT INTO TIPO VALUES('Gestor');
INSERT INTO TIPO VALUES('Vacuador');
INSERT INTO TIPO VALUES('Asistente de salud');--

INSERT INTO DIRECCION_EMPLEADO VALUES('Buena Vista', 'Los cipreces' , 12,'Soyapango', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Buena Vista', 'Los cipreces' , 1,'Soyapango', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Escalon', '7a Calle Poniente' , 14,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Escalon', '7a Calle Poniente' , 25,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Escalon', '7a Calle Poniente' , 19,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Puerta Dorada', '7a Calle pte Bis' , 3,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Puerta Dorada', '7a Calle pte Bis' , 2,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Miramonte', 'Colima' , 7,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Miramonte', 'Av Paseo' , 13,'San Salvador', 'San Salvador');
INSERT INTO DIRECCION_EMPLEADO VALUES('Miramonte', 'Aconcugua' , 30,'San Salvador', 'San Salvador');--


INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Carmen Avila', 'carmen.a@vacunacion.sv', 1);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Davina Lopez', 'davina.l@gmail.com', 2);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Sabela LLopis', 'babelal@vacunacion.sv', 3);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Maria Vilches', 'maria.v@vacunacion.sv', 4);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Sarah Climent', 'sarah.c@hotmail.com', 1);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Borja Cuevas', 'borja.c@gmail,com', 4);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Christian Lopez', 'christian.v@vacunacion.sv', 3);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Andrea Requenea', 'andrea.r@vacunacion.sv', 1);
INSERT INTO EMPLEADO(nombre, id_direccion_empleado) VALUES('Baltazar Solano', 5);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Lucio Salameron', 'lucio.s@vacunacion.sv', 6);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Alexander Jaramillo', 'alexander.j@gmail.comv', 6);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Aida Arnaiz', 'aida.a@outlook.com', 10);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Gregorio Torres', 'gregorio.t@vacunacion.sv', 8);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Domingo Alvaro', 'domingo.a@hotmail.com', 7);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Elisabet Nieto', 'elisabet.n@vacunacion.sv', 7);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Anibal Romero', 'anibal.r@vacunacion.sv', 8);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Amal Manrique', 'amal.m@gamil.com', 10);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Leyre Vidal', 'leyre.v@outlook.com', 9);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Carlos Rodriguez', 'carlos.r@vacunacion.sv', 9);
INSERT INTO EMPLEADO(nombre, id_direccion_empleado) VALUES('Jeronima Francisco', 2);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES(' Victoria Teruel', 'victoria.t@gmail.com', 7);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Marcos Sanchez', 'marcos.s@vacunacion.sv', 1);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Hernar Baeza', 'hernar.b@vacunacion.sv', 7);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Maravillas de castro', 'maravillas.c@vacunacion.sv', 5);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Kevin Gonzales', 'kevin.g@vacunacion.sv', 8);
INSERT INTO EMPLEADO(nombre, correo, id_direccion_empleado) VALUES('Asencion Romero', 'asencion.r@gmail.com', 3);
INSERT INTO EMPLEADO(nombre, id_direccion_empleado) VALUES('Maria-Paz Mendoza', 9);

INSERT INTO GESTOR(usuario, contrasena) VALUES('carmen.a', 'CL/L9*&ntSs[>~2');
INSERT INTO GESTOR(usuario, contrasena) VALUES('maria.v', '2vgQ5/{auks!hKd');
INSERT INTO GESTOR(usuario, contrasena) VALUES('christian.l', 'zr_9$hH}xQQV`Tj');
INSERT INTO GESTOR(usuario, contrasena) VALUES('lucio.s', 'EhTW4Nb2/_*q%hf');
INSERT INTO GESTOR(usuario, contrasena) VALUES('gregorio.t', 'y7#m~2KN#(3Q<1.');
INSERT INTO GESTOR(usuario, contrasena) VALUES('anibal.r', 'Rr%N~W^D8-]Q]q#');
INSERT INTO GESTOR(usuario, contrasena) VALUES('carlos.r', '8#T26Pmd>tsA?kM');
INSERT INTO GESTOR(usuario, contrasena) VALUES('marcos.s', '#@NB4(.qGnhDzU/');
INSERT INTO GESTOR(usuario, contrasena) VALUES('kevin.g', 'K%Uq6HMPjr(]R{/'); 


--------------------------------------------

--DROP DATABASE VACCINATION_PROGRAM; para emergencias :)


--Transact-SQL (Diccionario de datos)

/*SELECT 
	'DATADICTIONARY' AS [REPORT],
	@@SERVERNAME AS [ServerName],
	DB_NAME() AS [DatabaseName],
	t.name AS [TableName], 
	schema_name(t.schema_id) AS [SchemaName], 
	c.name AS [ColumnName], 
	st.name AS [DataType], 
	c.max_length AS [MaxLength], 
	CASE 
		WHEN c.is_nullable = 0 THEN 'NO'
		ELSE 'YES'
	END AS [IsNull],
	CASE 
		WHEN c.is_identity = 0 THEN 'NO'
		ELSE 'YES'
	END AS [IsIdentity], 
	isnull(ep.value, '-- add description here') AS [Description]
FROM [sys].[tables] t
INNER JOIN [sys].[columns] c
	ON t.object_id= c.object_id 
INNER JOIN [sys].[systypes] st 
	ON c.system_type_id= st.xusertype 
INNER JOIN [sys].[objects] o 
	ON t.object_id= o.object_id 
LEFT JOIN [sys].[extended_properties] ep 
	ON o.object_id = ep.major_id 
	AND c.column_Id = ep.minor_id
WHERE t.name <> 'sysdiagrams' 
ORDER BY 
	t.name,
	c.column_Id*/
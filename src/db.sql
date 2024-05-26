CREATE DATABASE profesime;

CREATE TABLE Cat_Usuarios (
	ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Correo_Institucional_Usuario VARCHAR(50) UNIQUE NOT NULL,
    Correo_Alternativo_Usuario VARCHAR(50) UNIQUE,
	Contraseña_Usuario VARCHAR(50) NOT NULL
);


#-----------------------------------------------------------------

CREATE TABLE Cat_Comentario (
	ID_Comentario INT AUTO_INCREMENT PRIMARY KEY,
    Comentario VARCHAR(1000) NOT NULL
);
#TBL_calificacion
#tbl comentario
CREATE TABLE Cat_Comentarios (
	ID_Comentarios INT AUTO_INCREMENT PRIMARY KEY,cat_calificaciones
    Fecha_Comentario DATE NOT NULL,
    FK_Usuario_Comentarios INT,
    FOREIGN KEY (FK_Usuario_Comentarios) REFERENCES Cat_Usuarios(ID_Usuario),
	FK_Comentario INT,
    FOREIGN KEY (FK_Comentario) REFERENCES Cat_Comentario(ID_Comentario)
);

#-----------------------------------------------------------------

CREATE TABLE Cat_Calificacion (
	ID_Calificacion INT PRIMARY KEY NOT NULL,
    Calificacion INT UNIQUE NOT NULL 
);

#---------------------------
CREATE TABLE Cat_Calificaciones (
	ID_Calificaciones INT AUTO_INCREMENT PRIMARY KEY,
	FK_Usuario_Calificaciones INT,
    FOREIGN KEY (FK_Usuario_Calificaciones) REFERENCES Cat_Usuarios(ID_Usuario),
	FK_Calificacion INT,
    FOREIGN KEY (FK_Calificacion) REFERENCES Cat_Calificacion(ID_Calificacion)
);

#-----------------------------------------------------------------

RENAME TABLE cat_comentario to tvl_comentario;
RENAME TABLE cat_calificacion to tvl_calificacion;

CREATE TABLE Cat_Materias (
	ID_Materia INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Materias VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Cat_Docentes (
	ID_Docente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Docentes VARCHAR(20) NOT NULL,
    Apellido_Paterno_Docentes VARCHAR(20) NOT NULL,
    Apellido_Materno_Docentes VARCHAR(20),
    FK_Materia_Docentes INT,
    FOREIGN KEY (FK_Materia_Docentes) REFERENCES Cat_Materias(ID_Materia)
);

#-----------------------------------------------------------------

CREATE TABLE Cat_Perfil_Docente (
	ID_Perfil_Docente INT AUTO_INCREMENT PRIMARY KEY,
    FK_Docente_Perfil_Docente INT,
    FOREIGN KEY (FK_Docente_Perfil_Docente) REFERENCES Cat_Docentes(ID_Docente),
	FK_Comentario_Perfil_Docente INT,
    FOREIGN KEY (FK_Comentario_Perfil_Docente) REFERENCES Cat_Comentarios(ID_Comentarios),
    FK_Calificacion_Perfil_Docente  INT,
    FOREIGN KEY (FK_Calificacion_Perfil_Docente) REFERENCES Cat_Calificaciones(ID_Calificaciones)
);

#-------------------------------- INSERT------------------------------------------------
#------------------------------ Cat_Usuarios
#insert into Cat_Usuarios(Correo_Institucional_Usuario,Correo_Alternativo_Usuario,Contraseña_Usuario) VALUES
#('jsnachezv2001@alumno.ipn.mx','jairsanchez198@gmail','contraseña'),
#('alfonrt2004@alumno.ipn.mx','alfon2004@gmail.com','reptic'),
#('rubipe2000@alumno.ipn.mx','rubi2000@gmail.com','12345'),
#('perezav1999@alumno.ipn.mx','perezav19@gmail.com','567889'),
#('albert2001@alumno.ipn.mx','albert20@gmail.com','653278'),
#('denimz2003@alumno.ipn.mx','denimz2003@gmail.com','678943'),
#('rogelmz1997@alumno.ipn.mx','rogemz199@gmail.com','56432'),
#('saul2002@alumno.ipn.mx','saul202@gmail.com','64875167'),
#('jcarlosap2004@alumno.ipn.mx','jcarlos24@gmail.com','4687434'),
#('britafp2004@alumno.ipn.mx','brifp40@gmail.com','843576467');


select  * from Cat_Usuarios;
#--------------------------------------- CALIFICACION ---------------------------------
#insert into tvl_calificacion values
#(1,1),
#(2,2),
#(3,3),
#(4,4),
#(5,5),
#(6,6),
#(7,7),
#(8,8),
#(9,9),
#(10,10);

select * from tvl_calificacion;

#---------------------------------- materias
alter table drop cat_docentes;
select *from Cat_Docentes;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE cat_docentes;
#---------------------------------- Docente
insert into Cat_Docentes(Nombre_Docentes,Apellido_Paterno_Docentes,Apellido_Materno_Docentes) values
('Vera','Gonzalez','Medina'),
('Salvador Felipe','Diaz','Albarran'),
('Jose Juan','Ley ','Mandujano'),
('Jose Luis ','Villarreal','Aguirre'),
('Juan Gabriel','Martínez','López'),
('Pedro ','Morales','Vergara'),
('Xochitl','Cabrera','Rivas'),
('Rodolfo','Lopez','Gonzalez'),
('Santiago','Gonzalez','Lopez'),
('Irene ','Cubillos','Islas'),
('Edna Carla','Vasco','Mendez'),
('Froylan','Angel','Huerta'),
('Marisol','Hernandez','Lopez'),
('Lorena','Azuara','Perez'),
('Veronica','Salas','Jimenez'),
('Oscar','Cruz','García'),
('Jesus','Mora ','Jain'),
('Clarissa','Gonzalez','Acatitla'),
('Elsa ','Gonzalez','Paredes'),
('Maria Araceli','Moreno','Guzman'),
('Graciela Irene','Cervantes','Cabello'),
('Celsa Piedad','Santos','Jacome'),
('Citlalli','Flores','Martinez'),
('Jesus','Olivares','Mercado'),
('Francisco Javier','Benitez','Diaz'),
('Martha Elvia','Salazar','Galván'),
('Maribel','Rojo','Hernandez'),
('Irma Alicia','Amador','Zaragoza'),
('Julian Hugo','Aponte','Olaya'),
('Fernando David','Aquino','Salinas'),
('Amparo','Bañuelos','Duran'),
('Roberto Pedro','Galvan','De Sampedro'),
('Juan Gabriel','Martínez','Lopez'),
('Patricia','Cortés','Pineda'),
('Beatriz Eugenia','Corona ','Ramirez'),
('Sabas ','Flores','Ascencio'),
('Claudia','Azorín','Vega'),
('Roberto   ','Osornio','Soto'),
('Arturo','De La Cruz','Tellez'),
('Sandra Luz','Enriquez','Arreola'),
('Jessica','Valverde','Jimenez'),
('Juan Angel','Rodriguez','Gomez'),
('Jazmin','Ramirez','Hernandez'),
('Mario Antonio ','Muñoz','Guerrero'),
('Jesus','Rodríguez','Buendía'),
('Eliel','Carbajal','Quiroz'),
('Juan Francisco','Márquez','Rubio'),
('Orlando ','Vargas','Reyes'),
('Aldo','Hernandez','Suarez'),
('Anselmo','Angoa','Torres'),
('Jose Eduardo','Guzman','Rodriguez'),
('Adolfo Sabino','Ugalde','Licea'),
('Juan Jose','Cabrera','Tejeda'),
('Margarita','Martínez','Martinez'),
('Alejandro','Arcos','Pichardo'),
('Luis','Valles','Montañez'),
('Patricia','Rodriguez','Peralta'),
('Javier Fernando','Diaz','Rosas'),
('Teresa De Jesus','Monroy','Ostria'),
('Maria Juana','Vigueras','Bonilla'),
('Jazmin','Rodriguez','Hernandez'),
('Rosa Maria','Ramirez','Quintanar'),
('Claudio Augusto','Valdés','Galicia'),
('Carlos','De La Cruz','Alejo'),
('Carlos Alberto','Estrada','Arriaga'),
('Gonzalo Isaac','Duchén','Sánchez'),
('Marbella','Calvino','Gallardo'),
('Ricardo Israel','Calzada','Salas'),
('Juan Arturo ','Perez','Cebreros'),
('Braulio','Sanchez','Zamora'),
('Rogelio','Reyes','Reyes'),
('Carlos','Perez','Torres'),
('Pilar','Resenderiz','Colin'),
('Ricardo Israel','Calzada','Islas'),
('Luis Efren','Veloz','Ortiz'),
('Jesus','Mora','Jain'),
('Jesus','García','Ruíz'),
('Jose','Galvan','Chavez'),
('Jose Luis ','Bautista','Arias'),
('Adolfo  ','Rodriguez','Acosta'),
('Eduardo','Martínez','Corona'),
('Maria Alejandra','Martínez','Camargo'),
('María Elena','Mendiola','Medellín'),
('Clara','Cruz','Ramos'),
('Jose','Velazquez','Lopez'),
('Hayari Lizet','Cruz','Gonzalez'),
('Rosa Maria','Rodriguez','Quintanar'),
('Enrique','Escamilla','Hernández'),
('Daniel','Tapia','Sanchez'),
('José Antonio ','Loaiza','Brito'),
('Lidia','Prudente','Tixteco'),
('Raúl','Nuñez','Galindo'),
('Raymundo','Santana','Alquicira'),
('Leonor','Herrera','Resendiz'),
('Miguel Angel','Miranda','Hernandez'),
('Luis Carlos','Castro ','Madrid'),
('Gabriel ','Sanchez','Perez'),
('Eduardo','Vazquez','Fernandez'),
('Juan Gerardo','Avalos','Ochoa'),
('Carlos','Cortes','Bazan'),
('Pedro ','Guevara','Lopez'),
('Linda Karina','Toscano','Medina'),
('José  ','Portillo ','Portillo'),
('Luis Carlos','Castro','Madrid');

select * from Cat_Docentes
alter table drop table Cat_Docentes;
#------------------------------ MATERIA
insert into Cat_Materias(Nombre_Materias) values
('Calculo Diferencial'),
('FISICA CLASICA'),
('FUNDAMENTOS DE PROGRAMACION'),
('HUMANIDADES I INGENERIA, CIENCIA Y SOCIEDAD'),
('FUNDAMENTOS DE ALGEBRA'),
('QUIMICA BASICA'),
('CALCULO VECTORIAL'),
('ELECTRICIDAD Y MAGNETISMO'),
('PROGRAMACION ORIENTADA A OBJETOS'),
('HUMANIDADES II: LA COMUNICACION Y LA ING'),
('MATEMATICAS DISCRETAS'),
('ALGEBRA LINEAL'),
('ECUACIONES DIFERENCIALES'),
('CIRCUITOS DE C.A. Y C.D.'),
('ESTRUCTURA DE DATOS'),
('LENGUAJES DE BAJO NIVEL'),
('CIRCUITOS LOGICOS I'),
('HUMANIDADES III DESARROLLO HUMANO'),
('ANALISIS NUMERICO'),
('VARIABLE COMPLEJA Y ANALISIS DE FOURIER'),
('CIRCUITOS LOGICOS II'),
('ELECTRONICA ANALOGICA'),
('TEORIA DE AUTOMATAS'),
('HUMANIDADES IV:DES.PER.Y PROF.'),
('ANALISIS DE SEÑALES ANALOGICAS'),
('PROBABILIDAD Y ESTADISTICA'),
('ANALISIS DE ALGORITMOS'),
('COMPILADORES'),
('ORGANIZACION DE COMPUTADORAS'),
('HUMANIDADES V:EL HUM.FRENTE A LA GLOB.'),
('SISTEMAS OPERATIVOS'),
('ARQUITECTURA DE COMPUTADORAS'),
('INGENIERIA DE SOFTWARE'),
('MET. DE LA INV. O TOP.SELEC.DE LA ING.I'),
('MODULACIÓN DIGITAL'),
('TEORIA DE CONTROL ANALÓGICO'),
('TEORIA DE LA INFORMACION Y CODIFICACION'),
('TEORIA DE CONTROL DIGITAL'),
('NVAS. TEC. EN LA TRANSFER. DE INFOR.'),
('ADMINISTRACIÓN DE LA INGENERIA'),
('COMPUTO APLICADO A SISTEMAS ECOLOGICOS I'),
('SISTEMAS DE INFORMACION I'),
('TRANSFERENCIA Y PROC.DE LA INFORMACION I'),
('ALGORITMOS DE COMPUTO I'),
('INTERFASES INTELIGENTES I'),
('BASE DE DATOS'),
('PROYECTO DE INGENIERIA'),
('FORMULACION Y EVALUACION DE PROYECTOS'),
('REDES NEURONALES'),
('INTELIGENCIA ARTIFICIAL'),
('PROGRAMACION LOGICA'),
('LENGUAJES PARA ARQUITECTURA EN PARALELO'),
('SISTEMAS EXPERTOS'),
('DISEÑO ASISTIDO POR COMPUTADORA'),
('REDES DE COMPUTADORAS'),
('SISTEMAS DISTRIBUIDOS'),
('COMPUTO APLICADO A SISTEMAS ECOLOGICOS II'),
('SISTEMAS DE INFORMACION II'),
('TRANSFERENCIA Y PROC.DE LA INFORMACION II'),
('ALGORITMOS DE COMPUTO II'),
('INTERFASES INTELIGENTES II');

#------------------------- COMENTARIOS 
insert into tvl_comentarios(comentario)values
('El profesor Veloz explica los conceptos de manera clara y siempre está dispuesto a resolver dudas. Sus clases son dinámicas y muy interesantes.'),
('La profesora Gómez tiene buenos conocimientos, pero sus explicaciones a veces son confusas y es difícil seguir el ritmo de la clase.'),
('El profesor Froylan utiliza ejemplos prácticos que facilitan la comprensión. Además, fomenta la participación de los estudiantes, lo cual es muy positivo.'),
('El profesor Perez es competente, pero sus clases suelen ser monótonas y carecen de interacción con los alumnos. Podría mejorar su método de enseñanza.'),
('La profesora Rodríguez es muy apasionada por su materia y transmite esa pasión a sus estudiantes. Sus clases son motivadoras y enriquecedoras.'),
('El profesor Sabas sabe mucho sobre el tema, pero su manera de enseñar es muy teórica y le falta dinamismo. Podría incorporar más ejemplos prácticos.'),
('La profesora Sánchez prepara sus clases con mucho cuidado y siempre está disponible para ayudar fuera del horario de clases. Excelente docente'),
('El profesor Rogelio tiene buenos apuntes, pero a veces se desvía del tema principal, lo que puede ser confuso. Necesita estructurar mejor sus clases.'),
('El profesor Fernández es muy paciente y explica todo con detalle. Sus métodos de enseñanza son efectivos y logra captar la atención de todos.'),
('La profesora Clara tiene potencial, pero necesita mejorar su interacción con los estudiantes. Sus clases pueden ser un poco abrumadoras a veces.');


SELECT * FROM cat_materias;
select * from Cat_Docentes
select * from tvl_calificaciones;
select * from cat_usuarios
FROM cat_materias
ORDER BY ID_Materia ASC;
select * from tvl_comentarios;
SELECT *  FROM cat_materias;

#---------- se cambio el nombre de cat_comentario y cat_calificacion.alter
RENAME TABLE tvl_comentario to tvl_comentarios;
RENAME TABLE tvl_calificacion to tvl_calificaciones;

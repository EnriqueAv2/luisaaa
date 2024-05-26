create database profesime;
use profesime;

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


CREATE TABLE Cat_Comentarios(
ID_Comentarios INT AUTO_INCREMENT PRIMARY KEY,
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


insert into Cat_Usuarios(Correo_Institucional_Usuario,Correo_Alternativo_Usuario,Contraseña_Usuario) VALUES
('jsnachezv2001@alumno.ipn.mx','jairsanchez198@gmail','contraseña'),
('alfonrt2004@alumno.ipn.mx','alfon2004@gmail.com','reptic'),
('rubipe2000@alumno.ipn.mx','rubi2000@gmail.com','12345'),
('perezav1999@alumno.ipn.mx','perezav19@gmail.com','567889'),
('albert2001@alumno.ipn.mx','albert20@gmail.com','653278'),
('denimz2003@alumno.ipn.mx','denimz2003@gmail.com','678943'),
('rogelmz1997@alumno.ipn.mx','rogemz199@gmail.com','56432'),
('saul2002@alumno.ipn.mx','saul202@gmail.com','64875167'),
('jcarlosap2004@alumno.ipn.mx','jcarlos24@gmail.com','4687434'),
('britafp2004@alumno.ipn.mx','brifp40@gmail.com','843576467');
select * from Cat_Materias;

select*

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
select * from Cat_Docentes;
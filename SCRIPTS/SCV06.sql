/* 
    Titulo: Sistema de Cursos virtuales (SVC06)
    Autor: Brian Marquez
    Fecha de Creación: 20-11-2024 
    Update: 07-11-2025 
    Descripción: creacion de modelo logico
    Resumen de cambios: se creo la version V6
*/ 

/*****************************
  TABLAS DEL SISTEMA SCV 06
*****************************/

CREATE DATABASE SCV06
USE SCV06


CREATE TABLE [sysdLog] (
  [id_log] int PRIMARY KEY IDENTITY(1, 1),
  [cMsgErr] nvarchar(255),
  [cCodUsu] char(4),
  [tModifi] datetime
)
GO

CREATE TABLE [systCod] (
  [id_cod] int PRIMARY KEY IDENTITY(1, 1),
  [cOrden] char(3),
  [cTblFld] char(25),
  [cTipReg] char(1),
  [cCodigo] char(8),
  [cDescri] char(70),
  [cCodUsu] char(4),
  [tModifi] datetime
)
GO

CREATE TABLE [systTab] (
  [id_tabla] int PRIMARY KEY IDENTITY(1, 1),
  [cTabNom] char(20),
  [cTabDes] char(250),
  [cCodUsu] char(4),
  [tModifi] datetime
)
GO

CREATE TABLE [tblUsuarios] (
  [id_usuario] int PRIMARY KEY IDENTITY(1, 1),
  [cCodUsu] char(4),
  [cNomUsu] varchar(80),
  [cClave] char(128),
  [cnudoci] int,
  [cEstado] nvarchar(255),
  [cNivUsu] char(1),
  [tModifi] datetime,
  [cMail] nvarchar(255),
  [cRol] nvarchar(255),
  [cIdeUsu] varchar(32),
  [id_rol] int,
  [id_pais] int
)
GO

CREATE TABLE [tblRoles] (
  [id_rol] int PRIMARY KEY IDENTITY(1, 1),
  [cnomRol] nvarchar(255),
  [tModifi] datetime
)
GO

CREATE TABLE [tblInscripciones] (
  [id_inscripcion] int PRIMARY KEY,
  [id_usuario] int,
  [id_curso] int,
  [tFechaMod] datetime,
  [cEstado] nvarchar(255)
)
GO

CREATE TABLE [tblCursos] (
  [id_curso] int PRIMARY KEY IDENTITY(1, 1),
  [CnomCur] nvarchar(255),
  [cDescri] varchar(300),
  [cEstado] varchar(2)
)
GO

CREATE TABLE [tblModulos] (
  [modulos_id] integer PRIMARY KEY IDENTITY(1, 1),
  [curso_id] nvarchar(255),
  [cTitulo] varchar(120),
  [cDescri] varchar(120),
  [tModifi] datetime,
  [id_curso] int
)
GO

CREATE TABLE [tblEvaluaciones] (
  [id_evaluacion] int PRIMARY KEY IDENTITY(1, 1),
  [cTipEval] nvarchar(255),
  [tModifi] datetime,
  [id_modulos] int
)
GO

CREATE TABLE [tblCalificaciones] (
  [id_calificacion] int PRIMARY KEY IDENTITY(1, 1),
  [id_usuario] int,
  [id_evaluacion] int,
  [cCAlific] decimal,
  [tModifi] datetime
)
GO

CREATE TABLE [tblRespuestas] (
  [id_respuesta] INT PRIMARY KEY IDENTITY(1, 1),
  [id_evaluacion] INT,
  [id_usuario] INT,
  [cRespuesta] TEXT,
  [tFecRes] DATETIME
)
GO

CREATE TABLE [tblResultados] (
  [id_resultado] INT PRIMARY KEY IDENTITY(1, 1),
  [id_evaluacion] int,
  [id_usuario] int,
  [nPuntuacion] FLOAT,
  [tFecResult] DATETIME
)
GO

CREATE TABLE [tblFeedback] (
  [id_feedback] INT PRIMARY KEY IDENTITY(1, 1),
  [id_respuesta] INT,
  [cComenta] TEXT,
  [tModifi] datetime
)
GO

CREATE TABLE [tblPaises] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [cNomPais] varchar(255),
  [cZona] varchar(255),
  [tModifi] datetime
)
GO

CREATE TABLE [tblDepartamentos] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [CnomDepa] varchar(255),
  [pais_id] int
)
GO

CREATE TABLE [tblProvincias] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [CnomProv] varchar(255),
  [departamento_id] int
)
GO

CREATE TABLE [tblDistritos] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [CnomDist] varchar(255),
  [provincia_id] int
)
GO

--

ALTER TABLE [tblUsuarios] ADD FOREIGN KEY ([id_rol]) REFERENCES [tblRoles] ([id_rol])
GO

ALTER TABLE [tblUsuarios] ADD FOREIGN KEY ([id_pais]) REFERENCES [tblPaises] ([id])
GO

ALTER TABLE [tblInscripciones] ADD FOREIGN KEY ([id_usuario]) REFERENCES [tblUsuarios] ([id_usuario])
GO

ALTER TABLE [tblInscripciones] ADD FOREIGN KEY ([id_curso]) REFERENCES [tblCursos] ([id_curso])
GO

ALTER TABLE [tblCalificaciones] ADD FOREIGN KEY ([id_usuario]) REFERENCES [tblUsuarios] ([id_usuario])
GO

ALTER TABLE [tblCalificaciones] ADD FOREIGN KEY ([id_evaluacion]) REFERENCES [tblEvaluaciones] ([id_evaluacion])
GO

ALTER TABLE [tblRespuestas] ADD FOREIGN KEY ([id_evaluacion]) REFERENCES [tblEvaluaciones] ([id_evaluacion])
GO

ALTER TABLE [tblDepartamentos] ADD FOREIGN KEY ([pais_id]) REFERENCES [tblPaises] ([id])
GO

ALTER TABLE [tblProvincias] ADD FOREIGN KEY ([departamento_id]) REFERENCES [tblDepartamentos] ([id])
GO

ALTER TABLE [tblDistritos] ADD FOREIGN KEY ([provincia_id]) REFERENCES [tblProvincias] ([id])
GO

ALTER TABLE [tblModulos] ADD FOREIGN KEY ([id_curso]) REFERENCES [tblCursos] ([id_curso])
GO

ALTER TABLE [tblEvaluaciones] ADD FOREIGN KEY ([id_modulos]) REFERENCES [tblModulos] ([modulos_id])
GO

ALTER TABLE [tblRespuestas] ADD FOREIGN KEY ([id_usuario]) REFERENCES [tblUsuarios] ([id_usuario])
GO

ALTER TABLE [tblResultados] ADD FOREIGN KEY ([id_evaluacion]) REFERENCES [tblEvaluaciones] ([id_evaluacion])
GO

ALTER TABLE [tblResultados] ADD FOREIGN KEY ([id_usuario]) REFERENCES [tblUsuarios] ([id_usuario])
GO

ALTER TABLE [tblFeedback] ADD FOREIGN KEY ([id_respuesta]) REFERENCES [tblRespuestas] ([id_respuesta])
GO

--select * from tblPaises
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Perú', N'PET (UTC-5)',GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Argentina', N'ART (UTC-3)', GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Bolivia', N'BOT (UTC-4)',GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Brasil', N'BRT (UTC-3, algunas regiones) / AMT (UTC-4, algunas regiones)', GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Chile', N'CLT (UTC-3) / CLST (UTC-3, horario de verano)',GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Colombia', N'COT (UTC-5)', GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Ecuador', N'ECT (UTC-5)', GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Guyana', N'GYT (UTC-4)',GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Paraguay', N'PYT (UTC-4) / PYST (UTC-3, horario de verano)',GETDATE())
INSERT [dbo].[tblPaises] ([cNomPais], [cZona], [tModifi]) VALUES ('Venezuela', N'VET (UTC-4)',GETDATE())

--SELECT * FROM tblDepartamentos
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Amazonas', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Áncash', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Apurímac', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Arequipa', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Ayacucho', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Cajamarca', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Callao', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Cusco', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Huancavelica', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Huánuco', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Ica', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Junín', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('La Libertad', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Lambayeque', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Lima', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Loreto', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Madre de Dios', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Moquegua', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Pasco', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Piura', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Puno', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('San Martín', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Tacna', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Tumbes', 1)
INSERT [dbo].[tblDepartamentos] ([CnomDepa], [pais_id]) VALUES ('Ucayali', 1)



--SELECT * FROM tblProvincias
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Arequipa', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Camaná', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Caravelí', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Castilla', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Caylloma', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Condesuyos', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Islay', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('La Unión', 1)
INSERT [dbo].[tblProvincias] ([CnomProv], [departamento_id]) VALUES ('Tumbes', 1)



--

--SELECT * FROM tblDistritos
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Arequipa', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Alto Selva Alegre', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Cayma', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Cerro Colorado',09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Characato', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Chiguata', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Jacobo Hunter', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('La Joya', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Mariano Melgar', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Miraflores', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Mollebaya', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Paucarpata', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Pocsi', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Polobaya', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Quequeña', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Sabandía', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Sachaca', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('San Juan de Siguas', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('San Juan de Tarucani', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Santa Isabel de Siguas', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Santa Rita de Siguas', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Socabaya', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Tiabaya', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Uchumayo', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Vítor', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Yanahuara', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Yarabamba', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('Yura', 09)
INSERT [dbo].[tblDistritos] ([CnomDist], [provincia_id]) VALUES ('José Luis Bustamante y Rivero', 09)


--select * from tblCursos
INSERT INTO [dbo].[tblCursos] 
           ([CnomCur], [cDescri], [cEstado])
VALUES
           ('Turing Inteligencia Artificial', 
            'Optimiza tu eficiencia profesional y maximiza tus resultados usando herramientas de inteligencia artificial como ChatGPT y Copilot', 
            'I'),
           ('Introducción a Machine Learning', 
            'Aprende los conceptos básicos del aprendizaje automático y cómo aplicarlos en proyectos reales', 
            'A'),
           ('Big Data y Análisis de Datos', 
            'Explora el mundo del big data y las herramientas para analizar grandes volúmenes de datos', 
            'A'),
           ('Desarrollo de Software con IA', 
            'Descubre cómo integrar la inteligencia artificial en aplicaciones y servicios de software', 
            'I'),
           ('Redes Neuronales Artificiales', 
            'Domina los fundamentos y aplicaciones prácticas de las redes neuronales en diferentes industrias', 
            'A'),
           ('Automatización de Procesos Empresariales', 
            'Utiliza herramientas basadas en IA para automatizar tareas repetitivas en entornos corporativos', 
            'A');
GO

--select * from tblCursos
INSERT INTO [dbo].[tblCursos] 
           ([CnomCur], [cDescri], [cEstado])
VALUES
           ('Procesamiento de Lenguaje Natural', 
            'Explora cómo las máquinas entienden y generan lenguaje humano utilizando modelos avanzados como GPT y BERT', 
            'A'),
           ('Visión por Computadora', 
            'Aprende a desarrollar aplicaciones que interpretan imágenes y videos, desde reconocimiento facial hasta análisis de escenas', 
            'A'),
           ('Optimización con Algoritmos Genéticos', 
            'Descubre cómo los algoritmos genéticos pueden resolver problemas complejos de optimización', 
            'I'),
           ('Inteligencia Artificial en el Marketing', 
            'Usa herramientas de IA para personalizar campañas y mejorar la experiencia del cliente', 
            'A'),
           ('Data Science para Negocios', 
            'Aprende a tomar decisiones informadas mediante el análisis de datos con herramientas como Python y R', 
            'A'),
           ('Ingeniería de Datos en la Nube', 
            'Domina las habilidades para diseñar, construir y gestionar pipelines de datos en plataformas como AWS y Azure', 
            'A'),
           ('Ética en la Inteligencia Artificial', 
            'Analiza las implicaciones éticas del uso de la IA y cómo garantizar su uso responsable en la sociedad', 
            'A'),
           ('Desarrollo de Chatbots', 
            'Crea chatbots inteligentes usando herramientas como Dialogflow y Microsoft Bot Framework', 
            'A'),
           ('Deep Learning Avanzado', 
            'Profundiza en redes neuronales profundas y frameworks como TensorFlow y PyTorch', 
            'I'),
           ('IA en el Sector Salud', 
            'Aplica inteligencia artificial para mejorar la atención médica, desde diagnósticos hasta tratamientos personalizados', 
            'A');
GO


--select * from tblRoles

INSERT [dbo].[tblRoles] ([cnomRol], [tModifi]) VALUES ('Estudiante', GETDATE())
INSERT [dbo].[tblRoles] ([cnomRol], [tModifi]) VALUES ('Profesor', GETDATE())


--select * from tblUsuarios

INSERT [dbo].[tblUsuarios] ([cCodUsu], [cNomUsu], [cClave], [cnudoci], [cEstado], [cNivUsu], [tModifi], [cMail], [cRol], [cIdeUsu], [id_rol], [id_pais]) 
VALUES ('0001', 'Juan Perez', 'clave123', 12345678, 'Activo', '1', GETDATE(), 'juan.perez@email.com', 'Estudiante', 'juanperez', 1, 1)

select * from tblUsuarios
INSERT [dbo].[tblUsuarios] ([cCodUsu], [cNomUsu], [cClave], [cnudoci], [cEstado], [cNivUsu], [tModifi], [cMail], [cRol], [cIdeUsu], [id_rol], [id_pais]) 
VALUES ('9999', 'SISTEMA', 'admin', 999999999, 'Activo', '2', GETDATE(), 'sistema.perez@email.com', 'Admin', 'sistema', 1, 1)

INSERT INTO [dbo].[tblUsuarios] 
           ([cCodUsu], [cNomUsu], [cClave], [cnudoci], [cEstado], [cNivUsu], [tModifi], [cMail], [cRol], [cIdeUsu], [id_rol], [id_pais])
VALUES 
           ('0002', 'Ana Lopez', 'clave456', 87654321, 'Activo', '1', GETDATE(), 'ana.lopez@email.com', 'Estudiante', 'analopez', 1, 2),
           ('0003', 'Carlos Martínez', 'password789', 11223344, 'Inactivo', '2', GETDATE(), 'carlos.martinez@email.com', 'Profesor', 'carlosm', 2, 3),
           ('0004', 'María Rodríguez', 'clave321', 55667788, 'Activo', '1', GETDATE(), 'maria.rodriguez@email.com', 'Estudiante', 'mariar', 1, 4),
           ('0005', 'Luis Gómez', 'password123', 99887766, 'Activo', '2', GETDATE(), 'luis.gomez@email.com', 'Profesor', 'luisg', 2, 1),
           ('0006', 'Sofía Torres', 'sofiaPass', 44332211, 'Activo', '1', GETDATE(), 'sofia.torres@email.com', 'Estudiante', 'sofiat', 1, 5),
           ('0007', 'Pedro Ruiz', 'pedroKey', 33445566, 'Inactivo', '1', GETDATE(), 'pedro.ruiz@email.com', 'Estudiante', 'pedror', 1, 2),
           ('0008', 'Laura Campos', 'laura123', 77889900, 'Activo', '1', GETDATE(), 'laura.campos@email.com', 'Estudiante', 'laurac', 1, 3),
           ('0009', 'Fernando Salazar', 'fernando123', 22334455, 'Activo', '2', GETDATE(), 'fernando.salazar@email.com', 'Profesor', 'fernandos', 2, 4),
           ('0010', 'Gabriela Fernández', 'gabyPass', 55664433, 'Activo', '1', GETDATE(), 'gabriela.fernandez@email.com', 'Estudiante', 'gabyf', 1, 5),
           ('0011', 'Ricardo Castillo', 'ricardoKey', 11224433, 'Inactivo', '1', GETDATE(), 'ricardo.castillo@email.com', 'Estudiante', 'ricardoc', 1, 1),
           ('0012', 'Elena Morales', 'elena321', 66778899, 'Activo', '2', GETDATE(), 'elena.morales@email.com', 'Profesor', 'elenam', 2, 2),
           ('0013', 'Miguel Vega', 'miguelPass', 44556677, 'Activo', '1', GETDATE(), 'miguel.vega@email.com', 'Estudiante', 'miguelv', 1, 3),
           ('0014', 'Patricia Flores', 'paty123', 99886655, 'Activo', '1', GETDATE(), 'patricia.flores@email.com', 'Estudiante', 'pattyf', 1, 4),
           ('0015', 'Jorge Navarro', 'jorgeKey', 33221144, 'Activo', '2', GETDATE(), 'jorge.navarro@email.com', 'Profesor', 'jorgen', 2, 5);
GO


INSERT INTO [dbo].[tblUsuarios] 
           ([cCodUsu], [cNomUsu], [cClave], [cnudoci], [cEstado], [cNivUsu], [tModifi], [cMail], [cRol], [cIdeUsu], [id_rol], [id_pais])
VALUES
           ('0016', 'Lucía Ramos', 'lucia123', 11112222, 'Activo', '1', GETDATE(), 'lucia.ramos@email.com', 'Estudiante', 'luciar', 1, 1),
           ('0017', 'Alberto Castillo', 'albertoPass', 33334444, 'Activo', '2', GETDATE(), 'alberto.castillo@email.com', 'Profesor', 'albertoc', 2, 2),
           ('0018', 'Camila Hernández', 'camila321', 55556666, 'Inactivo', '1', GETDATE(), 'camila.hernandez@email.com', 'Estudiante', 'camilah', 1, 3),
           ('0019', 'Javier Pérez', 'javierKey', 77778888, 'Activo', '2', GETDATE(), 'javier.perez@email.com', 'Profesor', 'javierp', 2, 4),
           ('0020', 'Andrea Silva', 'andreaPass', 99990000, 'Activo', '1', GETDATE(), 'andrea.silva@email.com', 'Estudiante', 'andreas', 1, 5),
           ('0021', 'Francisco Ortega', 'francisco123', 22223333, 'Activo', '1', GETDATE(), 'francisco.ortega@email.com', 'Estudiante', 'franciscoo', 1, 1),
           ('0022', 'Carolina Méndez', 'carolinaPass', 44445555, 'Activo', '2', GETDATE(), 'carolina.mendez@email.com', 'Profesor', 'carolinam', 2, 2),
           ('0023', 'Diego Torres', 'diego321', 66667777, 'Inactivo', '1', GETDATE(), 'diego.torres@email.com', 'Estudiante', 'diegot', 1, 3),
           ('0024', 'Natalia Vega', 'nataliaKey', 88889999, 'Activo', '2', GETDATE(), 'natalia.vega@email.com', 'Profesor', 'nataliav', 2, 4),
           ('0025', 'Oscar Peña', 'oscarPass', 11114444, 'Activo', '1', GETDATE(), 'oscar.pena@email.com', 'Estudiante', 'oscarp', 1, 5),
           ('0026', 'Vanessa Ruiz', 'vanessa123', 33336666, 'Activo', '1', GETDATE(), 'vanessa.ruiz@email.com', 'Estudiante', 'vanessar', 1, 1),
           ('0027', 'Héctor Gómez', 'hectorPass', 55558888, 'Activo', '2', GETDATE(), 'hector.gomez@email.com', 'Profesor', 'hectorg', 2, 2),
           ('0028', 'Isabela Morales', 'isabela321', 77770000, 'Inactivo', '1', GETDATE(), 'isabela.morales@email.com', 'Estudiante', 'isabelam', 1, 3),
           ('0029', 'Rodrigo Sánchez', 'rodrigoKey', 22224444, 'Activo', '2', GETDATE(), 'rodrigo.sanchez@email.com', 'Profesor', 'rodrigos', 2, 4),
           ('0030', 'Valeria Ramos', 'valeriaPass', 44446666, 'Activo', '1', GETDATE(), 'valeria.ramos@email.com', 'Estudiante', 'valeriar', 1, 5),
           ('0031', 'Sebastián Castillo', 'sebastian123', 66669999, 'Activo', '1', GETDATE(), 'sebastian.castillo@email.com', 'Estudiante', 'sebastianc', 1, 1),
           ('0032', 'Paula Cruz', 'paulaPass', 88880000, 'Activo', '2', GETDATE(), 'paula.cruz@email.com', 'Profesor', 'paulac', 2, 2),
           ('0033', 'Tomás Pérez', 'tomas321', 11119999, 'Inactivo', '1', GETDATE(), 'tomas.perez@email.com', 'Estudiante', 'tomasp', 1, 3),
           ('0034', 'Diana López', 'dianaKey', 33335555, 'Activo', '2', GETDATE(), 'diana.lopez@email.com', 'Profesor', 'dianal', 2, 4),
           ('0035', 'Juanita Mendoza', 'juanitaPass', 55557777, 'Activo', '1', GETDATE(), 'juanita.mendoza@email.com', 'Estudiante', 'juanitam', 1, 5);
GO


-- --

--select * from tblModulos

INSERT INTO [dbo].[tblModulos]
           ([curso_id], [cTitulo], [cDescri], [tModifi], [id_curso])
VALUES
           ('CUR001', 'Introducción a la Inteligencia Artificial', 'Conceptos básicos y aplicaciones iniciales', GETDATE(), 1),
           ('CUR002', 'Aprendizaje Supervisado', 'Métodos y algoritmos en aprendizaje supervisado', GETDATE(), 1),
           ('CUR003', 'Aprendizaje No Supervisado', 'Clustering y métodos no supervisados', GETDATE(), 1),
           ('CUR004', 'Redes Neuronales', 'Arquitecturas y funcionamiento de redes neuronales', GETDATE(), 2),
           ('CUR005', 'Procesamiento del Lenguaje Natural', 'Análisis y generación de texto con IA', GETDATE(), 2),
           ('CUR006', 'Visión por Computadora', 'Reconocimiento de imágenes y videos', GETDATE(), 3),
           ('CUR007', 'Automatización de Tareas', 'Uso de herramientas IA para productividad', GETDATE(), 3),
           ('CUR008', 'Implementación en Proyectos', 'Aplicación de IA en casos reales', GETDATE(), 4),
           ('CUR009', 'Técnicas de Evaluación', 'Evaluación del impacto y resultados de IA', GETDATE(), 4),
           ('CUR010', 'Ética en la IA', 'Consideraciones éticas y responsabilidad', GETDATE(), 5);
GO


--select * from tblEvaluaciones

INSERT INTO [dbo].[tblEvaluaciones]
           ([cTipEval], [tModifi], [id_modulos])
VALUES
           ('Examen Final', GETDATE(), 1),
           ('Evaluación de Proyecto', GETDATE(), 2),
           ('Exposición Oral', GETDATE(), 3),
           ('Evaluación Práctica', GETDATE(), 3),
           ('Examen Teórico', GETDATE(), 4),
           ('Actividad Grupal', GETDATE(), 4),
           ('Simulación de Caso', GETDATE(), 5),
           ('Prueba de Conocimiento', GETDATE(), 5),
           ('Trabajo Individual', GETDATE(), 6),
           ('Examen en Línea', GETDATE(), 6),
           ('Quiz Rápido', GETDATE(), 7),
           ('Evaluación de Comprensión', GETDATE(), 7),
           ('Reflexión Final', GETDATE(), 8),
           ('Proyecto Final', GETDATE(), 8),
           ('Evaluación de Pares', GETDATE(), 9),
           ('Análisis de Caso', GETDATE(), 10)
GO




--select * from tblCalificaciones

INSERT INTO [dbo].[tblCalificaciones]
           ([id_usuario], [id_evaluacion], [cCAlific], [tModifi])
VALUES
           (1, 1, 90.0, GETDATE()),
           (2, 1, 85.0, GETDATE()),
           (3, 2, 88.0, GETDATE()),
           (4, 2, 92.0, GETDATE()),
           (5, 3, 78.0, GETDATE()),
           (6, 3, 95.0, GETDATE()),
           (7, 4, 80.0, GETDATE()),
           (8, 4, 88.0, GETDATE()),
           (9, 5, 84.0, GETDATE()),
           (10, 5, 91.0, GETDATE()),
           (1, 6, 77.0, GETDATE()),
           (2, 6, 79.0, GETDATE()),
           (3, 7, 85.0, GETDATE()),
           (4, 7, 89.0, GETDATE()),
           (5, 8, 90.0, GETDATE()),
           (6, 8, 93.0, GETDATE()),
           (7, 9, 95.0, GETDATE()),
           (8, 9, 96.0, GETDATE()),
           (9, 10, 92.0, GETDATE()),
           (10, 10, 94.0, GETDATE());
GO



-- select * from tblInscripciones

INSERT INTO [dbo].[tblInscripciones]
           ([id_inscripcion], [id_usuario], [id_curso], [tFechaMod], [cEstado])
VALUES
           (1, 1, 1, GETDATE(), 'A'),
           (2, 2, 2, GETDATE(), 'A'),
           (3, 3, 3, GETDATE(), 'I'),
           (4, 4, 4, GETDATE(), 'A'),
           (5, 5, 5, GETDATE(), 'A'),
           (6, 6, 6, GETDATE(), 'I'),
           (7, 7, 7, GETDATE(), 'A'),
           (8, 8, 8, GETDATE(), 'A'),
           (9, 9, 9, GETDATE(), 'I'),
           (10, 10, 10, GETDATE(), 'A'),
           (11, 1, 2, GETDATE(), 'A'),
           (12, 2, 3, GETDATE(), 'A'),
           (13, 3, 4, GETDATE(), 'I'),
           (14, 4, 5, GETDATE(), 'A'),
           (15, 5, 6, GETDATE(), 'A'),
           (16, 6, 7, GETDATE(), 'I'),
           (17, 7, 8, GETDATE(), 'A'),
           (18, 8, 9, GETDATE(), 'A'),
           (19, 9, 10, GETDATE(), 'I'),
           (20, 10, 1, GETDATE(), 'A');
GO


--select * from sysdLog

INSERT INTO [dbo].[sysdLog]
           ([cMsgErr], [cCodUsu], [tModifi])
     VALUES
           ('Fallo al intentar acceder a la base de datos', '0004', GETDATE()),
           ('Error de sintaxis en la consulta SQL', '0005', GETDATE()),
           ('Acceso denegado al usuario', '0006', GETDATE()),
           ('Conexión con el servidor interrumpida', '0007', GETDATE()),
           ('El registro no fue encontrado', '0008', GETDATE()),
           ('Error al insertar datos en la tabla', '0009', GETDATE()),
           ('El archivo solicitado no existe', '0010', GETDATE()),
           ('Operación exitosa', '0011', GETDATE()),
           ('Timeout en la ejecución de la consulta', '0012', GETDATE()),
           ('Usuario no autorizado para realizar la acción', '0013', GETDATE()),
           ('Los datos de entrada no son válidos', '0014', GETDATE()),
           ('Fallo al procesar la solicitud del usuario', '0015', GETDATE()),
           ('Error al actualizar el registro', '0016', GETDATE()),
           ('No se puede establecer conexión con el servidor remoto', '0017', GETDATE()),
           ('Error en la validación de los datos ingresados', '0018', GETDATE()),
           ('Fallo al generar el informe solicitado', '0019', GETDATE()),
           ('Error en la ejecución de la función de cálculo', '0020', GETDATE())
GO

INSERT INTO [dbo].[sysdLog]
           ([cMsgErr], [cCodUsu], [tModifi])
     VALUES
           ('Fallo al intentar acceder a la base de datos', '0001', GETDATE()),
           ('Error de sintaxis en la consulta SQL', '0002', GETDATE()),
           ('Acceso denegado al usuario', '0003', GETDATE()),
           ('Conexión con el servidor interrumpida', '0004', GETDATE()),
           ('El registro no fue encontrado', '0005', GETDATE()),
           ('Error al insertar datos en la tabla', '0006', GETDATE()),
           ('El archivo solicitado no existe', '0007', GETDATE()),
           ('Operación exitosa', '0008', GETDATE()),
           ('Timeout en la ejecución de la consulta', '0009', GETDATE()),
           ('Usuario no autorizado para realizar la acción', '0010', GETDATE()),
           ('Los datos de entrada no son válidos', '0011', GETDATE()),
           ('Fallo al procesar la solicitud del usuario', '0012', GETDATE()),
           ('Error al actualizar el registro', '0013', GETDATE()),
           ('No se puede establecer conexión con el servidor remoto', '0014', GETDATE()),
           ('Error en la validación de los datos ingresados', '0015', GETDATE()),
           ('Fallo al generar el informe solicitado', '0016', GETDATE()),
           ('Error en la ejecución de la función de cálculo', '0017', GETDATE()),
           ('Usuario no encontrado en la base de datos', '0018', GETDATE()),
           ('Permiso insuficiente para acceder al recurso', '0019', GETDATE()),
           ('El sistema ha detectado un ciclo de redirección', '0020', GETDATE()),
           ('Fallo en la conexión a la API externa', '0021', GETDATE()),
           ('Error al eliminar el registro solicitado', '0022', GETDATE()),
           ('No se puede cargar el archivo de configuración', '0023', GETDATE()),
           ('La consulta devolvió un valor nulo', '0024', GETDATE()),
           ('El usuario no tiene permisos de escritura', '0025', GETDATE()),
           ('La base de datos no responde', '0026', GETDATE()),
           ('El servidor de correo no está disponible', '0027', GETDATE()),
           ('El nombre de usuario ya está registrado', '0028', GETDATE()),
           ('Contraseña incorrecta', '0029', GETDATE()),
           ('Error al enviar la solicitud al servidor', '0030', GETDATE()),
           ('El campo obligatorio está vacío', '0031', GETDATE()),
           ('Datos incompatibles con el formato esperado', '0032', GETDATE()),
           ('El servicio está temporalmente fuera de servicio', '0033', GETDATE()),
           ('Los datos proporcionados son inválidos', '0034', GETDATE()),
           ('El parámetro de búsqueda es demasiado largo', '0035', GETDATE()),
           ('Error al acceder a la base de datos remota', '0036', GETDATE()),
           ('El archivo de respaldo está corrupto', '0037', GETDATE()),
           ('Error al realizar la transacción en línea', '0038', GETDATE()),
           ('La operación fue cancelada por el usuario', '0039', GETDATE()),
           ('Se ha excedido el límite de conexiones', '0040', GETDATE()),
           ('El valor de entrada está fuera de los límites permitidos', '0041', GETDATE()),
           ('Fallo al generar el archivo de exportación', '0042', GETDATE()),
           ('Error de red al intentar cargar los datos', '0043', GETDATE()),
           ('La operación se ha detenido debido a un error inesperado', '0044', GETDATE()),
           ('No se pudo encontrar el directorio de almacenamiento', '0045', GETDATE()),
           ('El servidor de archivos no está disponible', '0046', GETDATE()),
           ('Se ha producido un error al validar el token de seguridad', '0047', GETDATE()),
           ('La base de datos está en modo de solo lectura', '0048', GETDATE()),
           ('No se puede modificar el registro debido a restricciones', '0049', GETDATE()),
           ('El formato de fecha no es válido', '0050', GETDATE()),
           ('Fallo al intentar realizar la actualización', '0051', GETDATE()),
           ('El acceso a la carpeta está denegado', '0052', GETDATE()),
           ('El código de verificación es incorrecto', '0053', GETDATE()),
           ('El valor introducido no corresponde a un número válido', '0054', GETDATE()),
           ('El servicio de autenticación no está disponible', '0055', GETDATE()),
           ('El token de sesión ha caducado', '0056', GETDATE()),
           ('La contraseña es demasiado débil', '0057', GETDATE()),
           ('No se puede abrir el archivo de configuración', '0058', GETDATE()),
           ('El servidor web no está respondiendo', '0059', GETDATE()),
           ('El recurso solicitado no está disponible', '0060', GETDATE()),
           ('Fallo al verificar la integridad de los datos', '0061', GETDATE()),
           ('La consulta SQL no devuelve resultados', '0062', GETDATE()),
           ('No se pudo procesar la solicitud debido a un error de servidor', '0063', GETDATE()),
           ('El recurso de la API está temporalmente fuera de servicio', '0064', GETDATE()),
           ('No se encuentra la tabla en la base de datos', '0065', GETDATE()),
           ('Error al realizar la validación de datos en el servidor', '0066', GETDATE()),
           ('No se puede recuperar el registro solicitado', '0067', GETDATE()),
           ('El servidor de base de datos ha superado el límite de memoria', '0068', GETDATE()),
           ('El nombre del archivo excede el límite de caracteres permitido', '0069', GETDATE()),
           ('La fecha de expiración del certificado es inválida', '0070', GETDATE()),
           ('El archivo de datos no es accesible', '0071', GETDATE()),
           ('La contraseña no cumple con los requisitos de seguridad', '0072', GETDATE()),
           ('Se ha producido un error en el cálculo de la puntuación', '0073', GETDATE()),
           ('No se puede obtener el identificador del usuario', '0074', GETDATE()),
           ('La base de datos está bloqueada por otro proceso', '0075', GETDATE()),
           ('Se ha superado el tiempo de espera para la conexión', '0076', GETDATE()),
           ('El archivo de configuración está incompleto', '0077', GETDATE()),
           ('La tabla está vacía', '0078', GETDATE()),
           ('El registro no cumple con las restricciones de clave primaria', '0079', GETDATE()),
           ('Error de autenticación al acceder a los datos', '0080', GETDATE()),
           ('Se ha excedido el número de intentos de inicio de sesión', '0081', GETDATE()),
           ('La variable de sesión no está definida', '0082', GETDATE()),
           ('El formato de número no es válido', '0083', GETDATE()),
           ('No se pudo obtener la información del servidor', '0084', GETDATE()),
           ('El acceso al archivo está restringido', '0085', GETDATE()),
           ('Error al realizar la acción solicitada', '0086', GETDATE()),
           ('La dirección IP no está permitida', '0087', GETDATE()),
           ('El recurso solicitado está fuera de línea', '0088', GETDATE()),
           ('La base de datos está corrupta', '0089', GETDATE()),
           ('Error al enviar datos a través de la red', '0090', GETDATE()),
           ('La operación fue cancelada debido a un error crítico', '0091', GETDATE()),
           ('El archivo que se intenta cargar no tiene extensión válida', '0092', GETDATE()),
           ('La estructura de datos no es válida', '0093', GETDATE()),
           ('Error en la autenticación del servidor remoto', '0094', GETDATE()),
           ('El archivo está dañado y no puede abrirse', '0095', GETDATE()),
           ('Fallo al acceder al recurso solicitado', '0096', GETDATE()),
           ('La clave de seguridad no es válida', '0097', GETDATE()),
           ('El servidor no tiene suficiente espacio para completar la operación', '0098', GETDATE()),
           ('La conexión con la base de datos ha sido restablecida', '0099', GETDATE()),
           ('El servidor de DNS no responde', '0100', GETDATE())
GO

--Select * from [tblRespuestas]

INSERT INTO [dbo].[tblRespuestas]
           ([id_evaluacion], [id_usuario], [cRespuesta], [tFecRes])
VALUES
           (5, 4, 'Mi respuesta incluye una propuesta innovadora.', GETDATE()),
           (7, 4, 'Consideré experiencias personales para enriquecer la respuesta.', GETDATE()),
           (7, 4, 'Hice uso de referencias académicas para sustentar mi respuesta.', GETDATE()),
           (7, 4, 'Respondí utilizando las herramientas de simulación del curso.', GETDATE()),
           (7, 4, 'El formato de evaluación me ayudó a estructurar mi respuesta.', GETDATE()),
           (7, 4, 'Respondí considerando los objetivos del aprendizaje.', GETDATE()),
           (7, 4, 'Incluí citas textuales relevantes en mi respuesta.', GETDATE()),
           (7, 4, 'La respuesta fue validada con ejemplos del módulo 4.', GETDATE()),
           (7, 4, 'Incluí recomendaciones prácticas en mi respuesta.', GETDATE()),
           (7, 4, 'Respondí siguiendo un enfoque analítico.', GETDATE()),
           (7, 4, 'Hice uso de herramientas digitales para complementar mi respuesta.', GETDATE()),
           (7, 4, 'La respuesta incluye observaciones críticas.', GETDATE()),
           (7, 4, 'Incluí una comparación entre diferentes escenarios.', GETDATE()),
           (7, 4, 'Respondí considerando los conceptos clave.', GETDATE()),
           (7, 4, 'Incluí ejemplos visuales en mi respuesta.', GETDATE()),
           (7, 4, 'El cuestionario me ayudó a estructurar una respuesta completa.', GETDATE()),
           (7, 4, 'Incluí observaciones personales en mi respuesta.', GETDATE()),
           (7, 4, 'Respondí aplicando modelos matemáticos.', GETDATE()),
           (7, 5, 'La respuesta fue el resultado de una discusión grupal.', GETDATE()),
           (7, 5, 'Incluí gráficos estadísticos en mi respuesta.', GETDATE()),
           (7, 5, 'El curso fue fundamental para responder correctamente.', GETDATE()),
           (7, 5, 'Respondí considerando las observaciones previas del instructor.', GETDATE()),
           (7, 5, 'La respuesta incluye ejemplos del módulo práctico.', GETDATE())

		   

--select * from tblFeedback

INSERT INTO [dbo].[tblFeedback]
           ([id_respuesta], [cComenta], [tModifi])
VALUES
           (2, 'Sería genial que se incluyeran más ejemplos prácticos.', GETDATE()),
           (3, 'Me encantó la dinámica del instructor.', GETDATE()),
           (19, 'El curso no cumplió con mis expectativas.', GETDATE()),
           (20, 'El material complementario fue muy útil.', GETDATE()),           
           (3, 'Me gustaría que se incluyera una sección de preguntas frecuentes.', GETDATE()),
           (2, 'El instructor respondió rápidamente a mis dudas.', GETDATE()),
           (16, 'El curso tiene una estructura muy clara.', GETDATE()),
           (15, 'No logré completar el curso debido a problemas técnicos.', GETDATE()),
           (14,' El precio del curso es muy accesible.', GETDATE()),
           (18, 'Me ayudó mucho en mi trabajo diario.', GETDATE()),
           (19, 'El certificado fue entregado rápidamente.', GETDATE()),
           (10, 'Me gustaría ver cursos más avanzados sobre este tema.', GETDATE())
GO


--select * from tblResultados

INSERT INTO [dbo].[tblResultados]
           ([id_evaluacion], [id_usuario], [nPuntuacion], [tFecResult])
VALUES
           --(1, 1, 85.5, GETDATE()),
           (2, 2, 92.3, GETDATE()),
           (2, 2, 78.9, GETDATE()),
           (2, 2, 88.0, GETDATE()),
           (2, 2, 95.7, GETDATE()),
           (2, 2, 83.4, GETDATE()),
           (2, 3, 90.2, GETDATE()),
           (2, 3, 77.5, GETDATE()),
           (2, 3, 84.6, GETDATE()),
           (2, 4, 91.9, GETDATE()),
           (2, 4, 80.0, GETDATE()),
           (2, 4, 93.3, GETDATE()),
           (2, 4, 87.2, GETDATE()),
           (2, 4, 89.1, GETDATE()),
           (2, 4, 76.8, GETDATE()),
           (2, 5, 85.9, GETDATE()),
           (2, 5, 90.0, GETDATE()),
           (2, 5, 82.5, GETDATE()),
           (2, 5, 79.3, GETDATE()),
           (2, 5, 94.1, GETDATE()),
           (2, 5, 88.7, GETDATE()),
           (2, 6, 85.0, GETDATE()),
           (2, 6, 91.5, GETDATE()),
           (2, 6, 83.8, GETDATE()),
           (2, 6, 87.9, GETDATE()),
           (2, 6, 80.4, GETDATE()),
           (2, 6, 92.0, GETDATE()),
           (2, 6, 75.6, GETDATE()),
           (2, 6, 89.5, GETDATE()),
           (2, 7, 93.7, GETDATE()),
           (2, 7, 86.4, GETDATE()),
           (3, 7, 84.2, GETDATE()),
           (3, 7, 77.9, GETDATE()),
           (3, 7, 94.5, GETDATE()),
           (3, 7, 80.9, GETDATE()),
           (3, 7, 90.7, GETDATE()),
           (3, 7, 82.3, GETDATE()),
           (3, 8, 88.4, GETDATE()),
           (3, 8, 91.2, GETDATE()),
           (3, 8, 78.5, GETDATE()),
           (3, 8, 84.9, GETDATE()),
           (3, 8, 93.1, GETDATE()),
           (3, 8, 87.3, GETDATE()),
           (3, 8, 89.7, GETDATE()),
           (3, 8, 81.0, GETDATE()),
           (3, 8, 94.9, GETDATE()),
           (3, 8, 83.5, GETDATE()),
           (3, 8, 91.8, GETDATE()),
           (3, 8, 76.7, GETDATE()),
           (3, 8, 88.2, GETDATE()),
           (3, 8, 90.5, GETDATE()),
           (3, 8, 85.7, GETDATE()),
           (3, 8, 79.1, GETDATE()),
           (3, 8, 92.9, GETDATE()),
           (3, 8, 87.6, GETDATE()),
           (3, 8, 80.2, GETDATE()),
           (3, 8, 89.3, GETDATE()),
           (3, 8, 93.5, GETDATE()),
           (4, 8, 86.8, GETDATE()),
           (4, 8, 78.2, GETDATE()),
           (4, 8, 91.1, GETDATE()),
           (4, 8, 84.3, GETDATE()),
           (4, 8, 90.4, GETDATE()),
           (4, 8, 82.0, GETDATE()),
           (4, 8, 88.8, GETDATE()),
           (4, 8, 85.4, GETDATE()),
           (4, 8, 93.2, GETDATE()),
           (4, 8, 81.5, GETDATE()),
           (4, 8, 87.4, GETDATE()),
           (4, 8, 89.8, GETDATE()),
           (4, 8, 77.1, GETDATE()),
           (4, 8, 90.3, GETDATE()),
           (4, 8, 83.6, GETDATE()),
           (4, 8, 88.1, GETDATE()),
           (4, 8, 91.6, GETDATE()),
           (4, 8, 79.7, GETDATE()),
           (4, 8, 85.8, GETDATE()),
           (4, 8, 94.0, GETDATE()),
           (4, 8, 82.7, GETDATE()),
           (4, 9, 90.6, GETDATE()),
           (4, 9, 84.8, GETDATE()),
           (4, 9, 87.0, GETDATE()),
           (4, 9, 89.2, GETDATE()),
           (4, 9, 80.6, GETDATE()),
           (4, 9, 92.4, GETDATE()),
           (4, 9, 86.2, GETDATE()),
           (4, 9, 83.2, GETDATE()),
           (4, 9, 91.4, GETDATE()),
           (4, 9, 85.3, GETDATE()),
           (4, 9, 88.6, GETDATE()),
           (4, 9, 79.8, GETDATE()),
           (4, 9, 90.8, GETDATE()),
           (5, 9, 84.0, GETDATE()),
           (5, 9, 92.6, GETDATE()),
           (5, 9, 87.7, GETDATE()),
           (5, 9, 81.9, GETDATE()),
           (5, 9, 89.0, GETDATE()),
           (5, 9, 93.9, GETDATE()),
           (5, 9, 86.1, GETDATE()),
           (5, 10, 88.9, GETDATE());
GO


--select * from systTab

INSERT INTO [dbo].[systTab]
           ([cTabNom], [cTabDes], [cCodUsu], [tModifi])
VALUES
           ('tblCursos', 'Tabla de cursos disponibles', '9999', GETDATE()),
           ('tblUsuarios', 'Tabla de usuarios registrados', '9999', GETDATE()),
           ('systCod', 'Tabla de codigos del Sistema', '9999', GETDATE()),
           ('tblRoles', 'Tabla de roles del sistema', '9999', GETDATE()),
           ('tblEvaluaciones', 'Tabla de evaluaciones realizadas', '9999', GETDATE()),
           ('tblResultados', 'Tabla de resultados de las evaluaciones', '9999', GETDATE()),
           ('tblFeedback', 'Tabla de retroalimentación de respuestas', '9999', GETDATE()),
           ('tblRespuestas', 'Tabla de respuestas de evaluaciones', '9999', GETDATE()),
           ('tblInscripciones', 'Tabla de inscripciones a cursos', '9999', GETDATE()),
           ('sysdLog', 'Tabla de registros de errores del sistema', '9999', GETDATE()),
           ('systTab', 'Tabla de descripción de tablas', '9999', GETDATE()),
		   ('tblCalificaciones', 'Tabla de calificaciones de los estudiantes', '9999', GETDATE()),
		   ('tblModulos', 'Tabla de los modulos del sistema', '9999', GETDATE()),
		   ('tblDepartamentos', 'Tabla de los departamentos', '9999', GETDATE()),
		   ('tblDistritos', 'Tabla de los los distritos', '9999', GETDATE()),
		   ('tblPaises', 'Tabla de los los paises', '9999', GETDATE()),
		   ('tblProvincias', 'Tabla de las provincias', '9999', GETDATE())
GO


--select * from systCod

INSERT INTO [dbo].systCod
           ([cOrden], [cTblFld], [cTipReg] , [cCodigo], [cDescri], [cCodUsu], [tModifi])
VALUES
           ('002', 'TBLUSUARIOS.CESTADO',  '1', 'A', 'ACTIVO', '0002', GETDATE()),
		   ('002', 'TBLUSUARIOS.CESTADO',  '1', 'I', 'INACTIVO', '0002', GETDATE())



/*------------------------------------------------------------------------------------------------
DEMO - TEST
--------------------------------------------------------------------------------------------------*/

use SCV06

EXEC sp_rename 'sysTab', 'systTab'; -- renombrar una tabla

--TABLAS DEL SISTEMAS
select * from sysdLog       
select * from systCod		
select * from systTab       

-- LOGICA
select * from tblCursos       
select * from tblRoles        
select * from tblUsuarios     

select * from tblCalificaciones  
select * from tblEvaluaciones    
select * from tblModulos         
select * from tblInscripciones   
select * from tblFeedback	     
select * from tblRespuestas      
select * from tblResultados      

-- UBIGEO
select * from tblDepartamentos  
select * from tblDistritos      
select * from tblPaises         
select * from tblProvincias     

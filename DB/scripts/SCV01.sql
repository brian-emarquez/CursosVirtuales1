CREATE DATABASE SCV04
GO

USE SCV04
GO

CREATE TABLE [sysdlog] (
  [id_log] int PRIMARY KEY,
  [cMsgErr] nvarchar(255),
  [cCodUsu] char(4),
  [tModifi] datetime
)
GO


CREATE TABLE [systcod] (
  [id_cod] int PRIMARY KEY,
  [cOrden] char(3),
  [cTblFld] char(25),
  [cTipReg] char(1),
  [cCodigo] char(8),
  [cDescri] char(70),
  [cCodUsu] char(4),
  [tModifi] datetime
)
GO

CREATE TABLE [systab] (
  [id_tabla] int PRIMARY KEY,
  [cTabNom] char(10),
  [cTabDes] char(45),
  [cCodUsu] char(4),
  [tModifi] datetime
)

CREATE TABLE [tblUsuarios] (
  [id_usuario] int PRIMARY KEY,
  [cCodUsu] char(4),
  [cNomUsu] varchar(80),
  [cClave] char(128),
  [cnudoci] int,
  [cEstado] nvarchar(255),
  [cNivUsu] char(1),
  [tModifi] datetime,
  [cMail] nvarchar(255),
  [cUser] nvarchar(255),
  [cRol] nvarchar(255),
  [cIdeUsu] varchar(32),
  [id_rol] int
)
GO

CREATE TABLE [tblRoles] (
  [id_rol] int PRIMARY KEY,
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
  [id_curso] int PRIMARY KEY,
  [nombre_curso] nvarchar(255)
)
GO

CREATE TABLE [tblModulos] (
  [modulos_id] integer PRIMARY KEY,
  [curso_id] nvarchar(255),
  [cTitulo] varchar(120),
  [cDescri] varchar(120),
  [tModifi] datetime,
  [id_curso] int
)
GO


CREATE TABLE [tblEvaluaciones] (
  [id_evaluacion] int PRIMARY KEY,
  [cTipEval] nvarchar(255),
  [tModifi] datetime,
  [id_modulos] int
)
GO

CREATE TABLE [tblCalificaciones] (
  [id_calificacion] int PRIMARY KEY,
  [id_usuario] int,
  [id_evaluacion] int,
  [cCAlific] decimal,
  [tModifi] datetime
)
GO

CREATE TABLE [tblRespuestas] (
  [id_respuesta] INT PRIMARY KEY,
  [id_evaluacion] INT,
  [id_usuario] INT,
  [cRespuest] TEXT,
  [tFecres] DATETIME
)
GO

CREATE TABLE [tblResultados] (
  [id_resultado] INT PRIMARY KEY,
  [id_evaluacion] int,
  [id_usuario] int,
  [nPuntuacion] FLOAT,
  [tFecResult] DATETIME
)
GO

CREATE TABLE [tblFeedback] (
  [id_feedback] INT PRIMARY KEY,
  [id_respuesta] INT,
  [cComenta] TEXT,
  [tModifi] datetime
)
GO

CREATE TABLE [tblPaises] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [CnomPais] varchar(255)
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


ALTER TABLE [tblUsuarios] ADD FOREIGN KEY ([id_rol]) REFERENCES [tblRoles] ([id_rol])
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

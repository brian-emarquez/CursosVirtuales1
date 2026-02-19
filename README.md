# SQL Server Database - Sistema de Gestión de Aprendizaje E-Learning

![Demo 1](https://img.shields.io/badge/Version-Demo%201-blueviolet)
![Platform Windows](https://img.shields.io/badge/Platform-Windows-blue)
![Platform Linux](https://img.shields.io/badge/Platform-Linux-darkblue)
![SQL Server](https://img.shields.io/badge/SQL-Server-CC2927)
![License MIT](https://img.shields.io/badge/License-MIT-green)

## 📋 Descripción del Proyecto

Este repositorio contiene la base de datos centralizada para la **Aplicación de Microservicios en Desarrollo de Software E-Learning**, diseñada para la gestión integral del aprendizaje en línea en la empresa **Grupo Ollarves E.I.R.L.**

El proyecto implementa una arquitectura de base de datos robusta utilizando **SQL Server**, soportando múltiples esquemas de cursos virtuales y proporcionando escalabilidad para entornos empresariales.

---

## 🎯 Características Principales

- **Arquitectura Modular**: Esquemas independientes por curso virtual (SCV01, SCV03, SCV04, SCV05, SCV06)
- **Diseño Normalizado**: Modelos de datos en diagrama DBML para mejor visualización
- **Control de Versiones**: Seguimiento de cambios y respaldos de base de datos
- **Scripts Automatizados**: SQL scripts listos para implementación y migración
- **Documentación Completa**: Especificaciones técnicas de cada módulo

---

## 📦 Prerrequisitos

Antes de iniciar, asegúrese de tener instalado:

- **[SQL Server Developer Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)** - Motor de base de datos
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/es-es/ssms/install/install)** - Interfaz gráfica
- **.NET Framework** (si se requiere integración con microservicios)
- **Git** - Para control de versiones

---

## 🚀 Instalación

### 1. Clonar el Repositorio

```bash
git clone https://github.com/brian-emarquez/CursosVirtuales1.git
cd CursosVirtuales1
```

### 2. Configurar SQL Server

1. Abra **SQL Server Management Studio**
2. Conéctese a la instancia local de SQL Server
3. Navegue a la carpeta `/SCRIPTS`

### 3. Ejecutar Scripts de Base de Datos

```sql
-- Ejecute los scripts en orden:
-- 1. SCV01.sql
-- 2. SCV04-1.sql
-- 3. SCV05.sql
-- 4. SCV06.sql
```

---

## 📁 Estructura del Proyecto

```
CursosVirtuales1/
├── SCRIPTS/                    # Scripts SQL de inicialización
│   ├── SCV01.sql             # Esquema del Curso Virtual 01
│   ├── SCV04-1.sql           # Esquema del Curso Virtual 04
│   ├── SCV05.sql             # Esquema del Curso Virtual 05
│   ├── SCV06.sql             # Esquema del Curso Virtual 06
│   └── readme.md             # Documentación de scripts
├── DBML/                       # Diagramas de base de datos
│   ├── SCV01/                # Diagrama SCV01
│   ├── SCV03/                # Diagrama SCV03
│   ├── SCV04/                # Diagrama SCV04
│   ├── SCV05/                # Diagrama SCV05
│   ├── SVC04/                # Diagrama SVC04
│   ├── SC0V2/                # Diagrama SC0V2
│   └── readme.md             # Guía de diagramas
├── BACKUP/                     # Respaldos de base de datos
│   ├── SCV05_2024-11-21
│   └── SCV06_2025-11-07
├── assets/                     # Recursos visuales
├── CHANGELOG.md              # Historial de cambios
├── LICENCE                   # Información de licencia
└── README.md                 # Este archivo
```

---

## 🔗 Herramientas Recomendadas

| Herramienta | Descripción | Enlace |
|------------|-------------|--------|
| DBML Editor | Diseñador visual de modelos de datos | [dbml.dbdiagram.io](https://dbml.dbdiagram.io/home) |
| SQL Server Developer | Motor de base de datos gratuito | [Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) |
| SSMS | Herramienta de gestión estándar | [SSMS Installer](https://learn.microsoft.com/es-es/ssms/install/install) |

---

## 📖 Documentación

- **[DBML Documentation](./DBML/readme.md)** - Especificación de diagramas de base de datos
- **[Scripts Documentation](./SCRIPTS/readme.md)** - Descripción y uso de scripts SQL
- **[CHANGELOG](./CHANGELOG.md)** - Historial de versiones y cambios

---

## 🤝 Contribución

Las contribuciones son bienvenidas. Para cambios importantes:

1. Cree un branch con su funcionalidad (`git checkout -b feature/AmazingFeature`)
2. Realice commit de sus cambios (`git commit -m 'Add some AmazingFeature'`)
3. Push al branch (`git push origin feature/AmazingFeature`)
4. Abra un Pull Request

---

## 📄 Licencia

Este proyecto está bajo la licencia especificada en el archivo [LICENCE](./LICENCE).

---

## 👤 Autor

**Brian Emarquez**  
📧 [GitHub](https://github.com/brian-emarquez)

---

## 📝 Notas

- Los diagramas DBML se pueden editar y visualizar en [dbml.dbdiagram.io](https://dbml.dbdiagram.io/)
- Asegúrese de crear respaldos antes de ejecutar scripts en producción
- Consulte el CHANGELOG para ver historial de cambios y versiones anteriores


## Docker

```bash
docker ps                # ver contenedores
docker images            # ver imágenes
docker compose up -d     # levantar
docker compose down      # bajar
docker logs <container>  # ver logs
```

---

**Última actualización**: Febrero 2026

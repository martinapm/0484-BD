-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para instituto
CREATE DATABASE IF NOT EXISTS `instituto` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `instituto`;

-- Volcando estructura para tabla instituto.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `NumMatricula` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`NumMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto.asignatura
CREATE TABLE IF NOT EXISTS `asignatura` (
  `CodAsignatura` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdProfesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodAsignatura`),
  KEY `IdProfesor` (`IdProfesor`),
  CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`IdProfesor`) REFERENCES `profesor` (`IdProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto.profesor
CREATE TABLE IF NOT EXISTS `profesor` (
  `IdProfesor` int(11) NOT NULL,
  `NIF_P` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdProfesor`),
  UNIQUE KEY `NIF_P` (`NIF_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto.recibe
CREATE TABLE IF NOT EXISTS `recibe` (
  `NumMatricula` int(11) NOT NULL,
  `CodAsignatura` int(11) NOT NULL,
  `CursoEscolar` varchar(9) NOT NULL,
  PRIMARY KEY (`NumMatricula`,`CodAsignatura`,`CursoEscolar`),
  KEY `CodAsignatura` (`CodAsignatura`),
  CONSTRAINT `recibe_ibfk_1` FOREIGN KEY (`NumMatricula`) REFERENCES `alumno` (`NumMatricula`),
  CONSTRAINT `recibe_ibfk_2` FOREIGN KEY (`CodAsignatura`) REFERENCES `asignatura` (`CodAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

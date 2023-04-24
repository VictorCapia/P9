-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-04-2023 a las 13:50:19
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mibasevictorcapia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `CIestudiante` varchar(20) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `nota1` int(11) DEFAULT NULL,
  `nota2` int(11) DEFAULT NULL,
  `nota3` int(11) DEFAULT NULL,
  `nota_final` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`CIestudiante`, `sigla`, `nota1`, `nota2`, `nota3`, `nota_final`) VALUES
('4441', 'INF-111', 20, 20, 11, 51),
('4441', 'INF-113', 20, 20, 13, 53),
('4442', 'INF-111', 21, 15, 30, 66),
('4442', 'INF-121', 15, 10, 12, 37),
('4443', 'INF-113', 30, 20, 30, 80),
('4444', 'INF-121', 23, 21, 19, 63),
('4445', 'INF-121', 33, 10, 10, 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ci` varchar(20) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `departamento` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `nombre_completo`, `fecha_de_nacimiento`, `telefono`, `departamento`) VALUES
('1111', 'Mario Lopez Tapia', '1980-07-15', '(591) 75757575', '02'),
('2221', 'Jesus Gutierrez Alanoca', '1991-08-19', '(591) 75757575', '03'),
('3331', 'Jose Aguilar Vargas', '1990-03-06', '(591) 75757575', '04'),
('4441', 'Ramiro Perez Guerrero', '1998-08-22', '(591) 75757575', '05'),
('4442', 'Rene Gutierrez Vaca', '2000-04-03', '(591) 75757575', '01'),
('4443', 'Jorge Ruiz Flores', '1996-05-18', '(591) 75757575', '02'),
('4444', 'Diego Rodriguez Rodriguez', '1988-06-27', '(591) 75757575', '03'),
('4445', 'Lucas Mendoza Angulo', '1980-01-11', '(591) 75757575', '01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `ci` varchar(20) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`ci`, `usuario`, `password`, `rol`) VALUES
('1111', 'maacma', '123456', 'DIRECTOR'),
('2221', 'jegual', '222123', 'DIRECTOR'),
('3331', 'joagva', '333123', 'DOCENTE'),
('4441', 'rapegu', '444123', 'ESTUDIANTE'),
('4442', 'reguva', '444124', 'ESTUDIANTE'),
('4443', 'jorufl', '444125', 'ESTUDIANTE'),
('4444', 'didiro', '444126', 'ESTUDIANTE'),
('4445', 'lumean', '444127', 'ESTUDIANTE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`CIestudiante`,`sigla`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`ci`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`CIestudiante`) REFERENCES `persona` (`ci`);

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `rol_usuario_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

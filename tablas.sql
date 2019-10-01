-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2019 a las 06:50:30
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `docdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_citas`
--

CREATE TABLE `horarios_citas` (
  `Idhorario` int(11) NOT NULL,
  `tiempo_cita` time NOT NULL,
  `numero_cita` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `idDoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `horarios_citas`
--

INSERT INTO `horarios_citas` (`Idhorario`, `tiempo_cita`, `numero_cita`, `hora_inicio`, `hora_final`, `idDoc`) VALUES
(1, '23:09:09', 5, '13:09:09', '17:10:13', 2),
(2, '16:11:22', 5, '14:11:13', '17:09:12', 3),
(3, '10:09:16', 3, '17:10:33', '14:11:22', 5),
(4, '15:24:17', 3, '18:15:17', '17:10:24', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_cita`
--

CREATE TABLE `item_cita` (
  `idItemC` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `IdHorario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `idtarea` int(11) NOT NULL,
  `tarea` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `lugar` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtarea`, `tarea`, `lugar`, `hora`, `fecha`, `descripcion`) VALUES
(1, 'Reunion de Doctores', 'Sala de Reuniones', '14:11:14', '2019-09-26', 'Departamento de medicina'),
(2, 'Reunion de Doctoras', 'Sala de Reuniones', '20:12:08', '2019-09-26', 'Departamento de cirugia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_usuarios`
--

CREATE TABLE `tareas_usuarios` (
  `idUtarea` int(11) NOT NULL,
  `tarea` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `lugar` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `idusers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas_usuarios`
--

INSERT INTO `tareas_usuarios` (`idUtarea`, `tarea`, `descripcion`, `lugar`, `hora`, `fecha`, `idusers`) VALUES
(1, 'Reporte de Pacientes con Gripe', 'Reporte minimo de 2 paginas', 'Para Secretaria', '13:11:13', '2019-09-26', 1),
(2, 'Vacunacion de Pacientes', 'Vacunar pacientes mayores de edad', 'consultorio 1', '16:08:00', '2019-09-26', 2),
(3, 'Junta directiva', 'Juanta con todos los doctores', 'Sala de reuiniones', '24:11:10', '2019-09-26', 3),
(4, 'Reuniones', 'Mensuales', 'Sala de reuniones', '21:11:15', '2019-09-26', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horarios_citas`
--
ALTER TABLE `horarios_citas`
  ADD PRIMARY KEY (`Idhorario`);

--
-- Indices de la tabla `item_cita`
--
ALTER TABLE `item_cita`
  ADD PRIMARY KEY (`idItemC`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`idtarea`);

--
-- Indices de la tabla `tareas_usuarios`
--
ALTER TABLE `tareas_usuarios`
  ADD PRIMARY KEY (`idUtarea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horarios_citas`
--
ALTER TABLE `horarios_citas`
  MODIFY `Idhorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `item_cita`
--
ALTER TABLE `item_cita`
  MODIFY `idItemC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `idtarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas_usuarios`
--
ALTER TABLE `tareas_usuarios`
  MODIFY `idUtarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

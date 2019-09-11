-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2019 a las 00:50:47
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

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
-- Estructura de tabla para la tabla `auth`
--

CREATE TABLE `auth` (
  `idauth` int(11) NOT NULL,
  `nombre` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `token` varchar(65) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth`
--

INSERT INTO `auth` (`idauth`, `nombre`, `token`) VALUES
(1, 'X-API-Key', '3392d6c9-0ecd-44ca-b701-e153ddeef995');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idcita` int(11) NOT NULL,
  `fecha_Cita` date NOT NULL,
  `hora_Cita` time NOT NULL,
  `nombre_Paciente` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_Paciente` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `num_Consultorio` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `idconsulta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `num_Consultorio` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `nombres` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Nac` date NOT NULL,
  `sexo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado_Civil` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `dui` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `especialidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Contratacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `iduser`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `nit`, `especialidad`, `telefono`, `celular`, `email`, `departamento`, `municipio`, `direccion`, `fecha_Contratacion`) VALUES
(3, 0, 'Stiven', 'Jimenez', '2019-07-21', 'Masculino', 'Soltero', '90124578', '56123jkl', 'Medico General', '12457889', '231456', 'valdesHumv', 'Ahuachapán', 'El Refugio', 'Calle principal colonia El Angel', '2019-07-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idespecialidad` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `idexamen` int(11) NOT NULL,
  `tipo_Examen` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Examen` date NOT NULL,
  `estado_examen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Limite` date NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `num_Expediente` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`idexamen`, `tipo_Examen`, `fecha_Examen`, `estado_examen`, `fecha_Limite`, `idpaciente`, `num_Expediente`) VALUES
(1, 'vladimir', '2019-08-09', 'jhgajhgdhjdgjkdakjda', '2019-08-09', 3, '879ipo'),
(3, 'vladimirHm', '2019-08-09', 'ORINA', '2019-08-09', 3, '879ipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_espera`
--

CREATE TABLE `item_espera` (
  `iditemlista` int(11) NOT NULL,
  `idlista` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idpaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `item_espera`
--

INSERT INTO `item_espera` (`iditemlista`, `idlista`, `nombre`, `apellido`, `idpaciente`) VALUES
(1, 1, 'Byron David', 'Martinez Jiménez', 4),
(2, 1, 'Vladimir', 'Valdes', 5),
(3, 1, 'Stiven', 'Jimenez', 10),
(4, 1, 'Jessica', 'Arévalo', 12),
(5, 1, 'Jose', 'Chavez', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_expediente`
--

CREATE TABLE `item_expediente` (
  `iditemexp` int(11) NOT NULL,
  `diagnostico` text COLLATE utf8_spanish_ci NOT NULL,
  `tratamiento` text COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` text COLLATE utf8_spanish_ci NOT NULL,
  `receta` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_Exam` text COLLATE utf8_spanish_ci NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idconsulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `item_expediente`
--

INSERT INTO `item_expediente` (`iditemexp`, `diagnostico`, `tratamiento`, `observaciones`, `receta`, `descripcion_Exam`, `idpaciente`, `idconsulta`) VALUES
(19, 'Diagnóstico', 'Tratamiento', 'Observaciones', 'Receta médica', 'Examen', 12, 15),
(21, 'hshshs\n', 'vsbshs', 'hshajs', 'hshshs', 'hshsbs', 4, 16),
(22, 'Gripe', 'Acetaminofen\n', 'Ningúna\n\n', 'Acetaminofen ', 'No ', 5, 17),
(23, 'diagnóstico', 'tratamiento', 'observaciones', 'receta', 'exámenes', 4, 18),
(24, 'diag', 'trat', 'obs', 'rec', 'exa', 4, 19),
(25, 'jajaja', 'jajajajaja', 'ajjajajajajaja', 'jajajajajajajajjaja', 'aajajajajajajajajajjajajaa', 4, 25),
(26, 'hrh', 'ghgh', 'ghggh', 'er1', 'ef', 5, 26),
(27, 'swdasdas', 'ssadsdasd', 'sdasd', 'sad', 'sadsad', 10, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_espera`
--

CREATE TABLE `lista_espera` (
  `idlista` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `num_Consultorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `lista_espera`
--

INSERT INTO `lista_espera` (`idlista`, `nombre`, `num_Consultorio`) VALUES
(1, 'Jorge Alberto Campos', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idmedicamentos` int(11) NOT NULL,
  `nom_Medicamento` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `cod_Medicamento` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_U` float NOT NULL,
  `fecha_V` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`idmedicamentos`, `nom_Medicamento`, `cod_Medicamento`, `cantidad`, `precio_U`, `fecha_V`) VALUES
(4, 'paracetamol', '12312312', 23, 2.9, '2019-05-08'),
(5, 'Nux vomica', 'QWE', 23, 23.5, '2014-07-19'),
(6, 'Diclofenaco', '123bh', 56, 12, '2021-07-19'),
(7, 'Acetaminfen', 'Hg45', 5, 65.6, '2021-07-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `idpaciente` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `nombres` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Nac` date NOT NULL,
  `sexo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado_Civil` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `dui` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idpaciente`, `iduser`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `email`, `departamento`, `municipio`, `direccion`, `telefono`) VALUES
(4, 0, 'Byron David', 'Martinez Jiménez', '2019-07-23', 'Masculino', 'Soltero', '123456782', 'byronjimenez9911@gmail.com', 'Ahuachapán', 'El Refugio', 'El Refugio calle 5', 12345102);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pending_quotes`
--

CREATE TABLE `pending_quotes` (
  `idpending` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(11) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pending_quotes`
--

INSERT INTO `pending_quotes` (`idpending`, `fecha`, `hora`, `tipo`, `idpaciente`, `nombre`, `apellido`, `idempleado`) VALUES
(6, '2019-07-23', '05:00:00', 'Consulta general', 4, 'Byron', 'Jimenez', 7),
(10, '2019-07-24', '12:30:00', 'Consulta general', 4, 'Byron David', 'Martinez Jiménez', 5),
(11, '2019-07-24', '14:00:00', 'Ginecologia', 4, 'Byron David', 'Martinez Jiménez', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_paciente`
--

CREATE TABLE `perfil_paciente` (
  `idperfil` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `peso` float NOT NULL,
  `altura` float NOT NULL,
  `temperatura` float NOT NULL,
  `presion` float NOT NULL,
  `frec_Cardiaca` float NOT NULL,
  `pulso` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `perfil_paciente`
--

INSERT INTO `perfil_paciente` (`idperfil`, `fecha`, `peso`, `altura`, `temperatura`, `presion`, `frec_Cardiaca`, `pulso`, `idpaciente`) VALUES
(2, '2019-02-22', 100, 20, 40, 25, 30, 85, 2),
(3, '2018-09-21', 10, 101, 101, 4, 0, 40, 4),
(4, '2019-02-22', 100, 20, 40, 25, 30, 85, 4),
(5, '2019-07-20', 500, 20, 40, 25, 30, 85, 4),
(6, '2019-07-22', 50, 65, 1, 12, 12, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tips`
--

CREATE TABLE `tips` (
  `idtip` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tips`
--

INSERT INTO `tips` (`idtip`, `titulo`, `descripcion`) VALUES
(1, 'Come frutas y verduras', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i'),
(2, 'Duerme bien', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'Haz ejercicio', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i'),
(5, 'Haz yoga', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `user_Name` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `user_Password` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `user_Name`, `user_Password`, `email`, `user_type`) VALUES
(1, 'admin', 'admin', 'rodolfo@gamil.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`idauth`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idcita`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`idconsulta`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`idespecialidad`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`idexamen`);

--
-- Indices de la tabla `item_espera`
--
ALTER TABLE `item_espera`
  ADD PRIMARY KEY (`iditemlista`),
  ADD UNIQUE KEY `idpaciente` (`idpaciente`);

--
-- Indices de la tabla `item_expediente`
--
ALTER TABLE `item_expediente`
  ADD PRIMARY KEY (`iditemexp`);

--
-- Indices de la tabla `lista_espera`
--
ALTER TABLE `lista_espera`
  ADD PRIMARY KEY (`idlista`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`idmedicamentos`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idpaciente`);

--
-- Indices de la tabla `pending_quotes`
--
ALTER TABLE `pending_quotes`
  ADD PRIMARY KEY (`idpending`);

--
-- Indices de la tabla `perfil_paciente`
--
ALTER TABLE `perfil_paciente`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indices de la tabla `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`idtip`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `user_Name` (`user_Name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth`
--
ALTER TABLE `auth`
  MODIFY `idauth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idcita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `idconsulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idespecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `item_espera`
--
ALTER TABLE `item_espera`
  MODIFY `iditemlista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `item_expediente`
--
ALTER TABLE `item_expediente`
  MODIFY `iditemexp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `lista_espera`
--
ALTER TABLE `lista_espera`
  MODIFY `idlista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `idmedicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `pending_quotes`
--
ALTER TABLE `pending_quotes`
  MODIFY `idpending` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `perfil_paciente`
--
ALTER TABLE `perfil_paciente`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tips`
--
ALTER TABLE `tips`
  MODIFY `idtip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

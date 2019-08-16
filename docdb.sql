-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-08-2019 a las 04:41:44
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

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
  `nombre_Doctor` varchar(65) COLLATE utf8_spanish_ci NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idcita`, `fecha_Cita`, `hora_Cita`, `nombre_Paciente`, `apellido_Paciente`, `num_Consultorio`, `nombre_Doctor`, `idpaciente`, `idempleado`) VALUES
(18, '2019-12-19', '12:12:00', 'Karina', 'Diaz', 3, 'Jaja', 6, 7),
(20, '2019-12-19', '12:12:00', 'Karina', 'Diaz', 3, 'Jaja', 6, 7),
(21, '2019-07-06', '21:12:00', 'Byron', 'Martinez', 2, 'Perez', 4, 7),
(35, '2019-07-24', '05:00:00', 'Byron David', 'Martinez Jiménez', 5, 'David', 4, 7),
(37, '2019-07-24', '05:15:00', 'Byron David', 'Martinez Jiménez', 5, 'David Jimenez', 4, 7),
(38, '2019-07-24', '00:00:00', 'Stiven', 'Jimenez', 5, 'David Jimenez', 10, 7),
(39, '2019-07-24', '00:00:00', 'Byron David', 'Martinez Jiménez', 2, 'David', 4, 7),
(40, '2019-07-24', '00:00:00', 'Byron David', 'Martinez Jiménez', 2, 'David', 4, 7),
(41, '2019-07-24', '00:00:00', 'Byron David', 'Martinez Jiménez', 2, 'David', 4, 7),
(42, '2019-07-25', '06:00:00', 'Byron David', 'Martinez Jiménez', 8, 'David', 4, 7),
(43, '2019-07-27', '09:00:00', 'Byron David', 'Martinez Jiménez', 2, 'Jorge Alberto', 4, 5);

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
  `nom_Doctor` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`idconsulta`, `fecha`, `hora`, `nombres`, `apellidos`, `num_Consultorio`, `nom_Doctor`, `idpaciente`, `idempleado`) VALUES
(15, '2019-07-21', '07:16', 'Jessica', 'Arévalo', 5, 'Byron', 12, 7),
(16, '2019-07-21', '10:04', 'Byron David', 'Martinez Jiménez', 5, 'Byron', 4, 7),
(17, '2019-07-22', '09:51', 'Vladimir', 'Valdes', 5, 'Byron', 5, 7),
(18, '2019-07-23', '08:59', 'Byron David', 'Martinez Jiménez', 5, 'David', 4, 7),
(19, '2019-07-24', '10:22', 'Byron David', 'Martinez Jiménez', 5, 'Byron', 4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
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
  `antecedentes` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `solvencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `constancia_Titulo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `certificado_Salud` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_Contratacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `nit`, `especialidad`, `telefono`, `celular`, `email`, `departamento`, `municipio`, `direccion`, `antecedentes`, `solvencia`, `constancia_Titulo`, `certificado_Salud`, `fecha_Contratacion`) VALUES
(1, 'Vladimir', 'Valdez', '2019-07-22', 'Masculino', 'Casado', '90124578', '561555889999996', 'Cirujano', '12457889', '231456', 'byronjimenez9911@gmail.com', ' Santa Ana', 'Congo', 'Calle 3 ave. 2', 'Entregado', 'Entregado', 'Entregado', 'Entregado', '2019-07-22'),
(3, 'Stiven', 'Jimenez', '2019-07-21', 'Masculino', 'Soltero', '90124578', '56123jkl', 'Medico General', '12457889', '231456', 'valdesHumv', 'Ahuachapán', 'El Refugio', 'Calle principal colonia El Angel', 'Entregado', 'Entregado', 'Entregado', 'Entregado', '2019-07-21'),
(5, 'Jorge Alberto', 'Campos Odriozola', '2019-07-23', 'Masculino', 'Casado', '90124578', '563218194674478', 'doctor', '12457889', '231456', 'vladimir@gmail.com', ' Ana', 'le', 'calle numero la no se', 'Pendiente', 'Entregado', 'Pendiente', 'Entregado', '2019-07-23'),
(6, 'Wenceslado Edilberto ', 'Cucurella Zaldívar', '2019-07-23', 'Femenino', 'Casado', '616161', '177172', 'Odontologo', '727272', '626262', 'zaldivar@gmail.com', 'sjsjs', 'jsjsjs', 'hshshs', 'Entregado', 'Entregado', 'Entregado', 'Entregado', '2019-07-23'),
(7, 'David', 'Jimenez', '2019-07-21', 'Masculino', 'Viudo', '616161661', '64646464646', 'doctor', '64646466', '64646464', 'davud@gmail.com', 'Santa Ana', 'Santa Ana', 'Calle 25 pasaje 3', 'Pendiente', 'Entregado', 'Entregado', 'Pendiente', '2019-07-21');

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
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idfactura`, `fecha`, `hora`, `nombre`, `idpaciente`, `subtotal`, `total`) VALUES
(3, '2019-02-22', '12:12', 'Byron', 4, 12, 12),
(8, '2019-07-22', '12:15', 'byron', 4, 0, 1),
(9, '2019-07-22', '01:21', 'Byron', 4, 0, 5),
(10, '2019-07-22', '07:41', 'Byron', 4, 0, 5);

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
(24, 'diag', 'trat', 'obs', 'rec', 'exa', 4, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_factura`
--

CREATE TABLE `item_factura` (
  `iditemfactura` int(11) NOT NULL,
  `idfactura` int(11) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item_factura`
--

INSERT INTO `item_factura` (`iditemfactura`, `idfactura`, `concepto`, `cantidad`, `precio`, `total`) VALUES
(1, 3, 'Pago consulta', 1, 5, 5),
(2, 3, 'Acetaminofen', 2, 12, 24),
(3, 3, 'Paracetamol', 1, 5, 5),
(5, 8, 'pagooo', 1, 1, 1),
(6, 9, 'pago consulta', 1, 5, 5),
(7, 10, 'Pago consulta', 1, 5, 5);

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

INSERT INTO `paciente` (`idpaciente`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `email`, `departamento`, `municipio`, `direccion`, `telefono`) VALUES
(4, 'Byron David', 'Martinez Jiménez', '2019-07-23', 'Masculino', 'Soltero', '123456782', 'byronjimenez9911@gmail.com', 'Ahuachapán', 'El Refugio', 'El Refugio calle 5', 12345102),
(5, 'Vladimir', 'Valdes', '0199-01-07', 'Masculino', 'Soltero', '00178945-5', 'vladimirValdes@gmail.com', 'Santa Ana', 'Coatepeque', 'Coatepeque', 104798656),
(10, 'Stiven', 'Jimenez', '0000-00-00', 'Masculino', 'Soltero', '792992', 'stiven@gmail.com', 'Ahuachapán', 'El Refugio', 'Local 2', 718181818),
(12, 'Jessica', 'Arévalo', '2019-07-21', 'Femenino', 'Soltero', '717172', 'michelle@gmail.com', 'Santa Ana', 'Chalchuapa', 'Av. 2 de abril', 71727272),
(13, 'Jose', 'Chavez', '2019-07-21', 'Masculino', 'Casado', '631619911', 'jose@gmail.com', 'Ahuachapán', 'Atiquizaya', 'Barrio el centro', 61346469),
(14, 'Vladimir ', 'Valdes ', '1994-07-22', 'Masculino', 'Soltero', '646494994', 'vladimir.valdes@proyectosfgk.org', 'Sants Ana ', 'Metapan ', 'Metapan ', 5455566),
(18, '\"truncate table pacientes\" ', 'Hsjjsjw', '2019-07-22', 'Masculino', 'Soltero', '55555588', 'castilllodemancia@hotmail.es', 'Jsjwjw', 'Uwuwuwuw', 'Ueudjjdjdj', 58655),
(19, 'truncate table paciente', 'Hsjjsjw', '2019-07-22', 'Masculino', 'Soltero', '55555588', 'castilllodemancia@hotmail.es', 'Jsjwjw', 'Uwuwuwuw', 'Ueudjjdjdj', 58655),
(20, 'Juan Carlos Jose', 'Salcedo Magaña', '2019-07-23', 'Masculino', 'Casado', '646466646', 'byronjimenez9911@gmail.com', 'Santa Ana', 'Metapan', 'Metapán', 52545455);

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
  `user_type` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `reference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `user_Name`, `user_Password`, `email`, `user_type`, `reference`) VALUES
(1, 'admin', 'admin', 'rodolfo@gamil.com', 'admin', 7),
(3, 'Byron', '1234', 'byron@gamil.com', 'user', 4),
(4, 'admin2', 'admin2', 'rodolfo@gamil.com', 'doctor', 5),
(6, 'vlad', '1234', 'valdesHumv', 'archivo', 0),
(11, 'usuario', 'usuario', 'user@email.com', 'user', 12);

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
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`idexamen`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idfactura`);

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
-- Indices de la tabla `item_factura`
--
ALTER TABLE `item_factura`
  ADD PRIMARY KEY (`iditemfactura`);

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
  MODIFY `idcita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `idconsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `item_espera`
--
ALTER TABLE `item_espera`
  MODIFY `iditemlista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `item_expediente`
--
ALTER TABLE `item_expediente`
  MODIFY `iditemexp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `item_factura`
--
ALTER TABLE `item_factura`
  MODIFY `iditemfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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

-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2019 a las 04:39:08
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

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

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`idconsulta`, `fecha`, `hora`, `nombres`, `apellidos`, `num_Consultorio`, `idpaciente`, `idempleado`) VALUES
(1, '2019-10-16', '07:58', 'Maria', 'Gozalez', 63, 6, 1);

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
  `idespecialidad` int(11) NOT NULL,
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

INSERT INTO `empleado` (`idempleado`, `iduser`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `nit`, `idespecialidad`, `telefono`, `celular`, `email`, `departamento`, `municipio`, `direccion`, `fecha_Contratacion`) VALUES
(3, 1, 'Stiven', 'Jimenez', '2019-07-21', 'Masculino', 'Soltero', '90124578', '56123jkl', 0, '12457889', '231456', 'valdesHumv', 'Ahuachapán', 'El Refugio', 'Calle principal colonia El Angel', '2019-07-21'),
(4, 0, 'Carlos', 'Henriquez', '2000-01-01', 'Femenino', 'Soltero', '323243243', '432432432432432', 2, '43243243', '43432432', 'fdfdsfdfds@ddd.bn', 'Gfdgfdgfd', 'Gfdfdggfd', 'Gfdfd', '2019-10-10'),
(5, 2, 'Byron', 'Jimenez', '2000-01-18', 'Masculino', 'Soltero', '53886677-5', '5752-555255-885-8', 1, '5488-5545', '5485-6558', 'byejsjs@jajaa.jsk', 'Hsjaja', 'Jqjqjs', 'Jsjajq', '2019-10-16'),
(6, 0, 'Jorge', 'Gutiérrez ', '2019-10-16', 'Masculino', 'Soltero', '42285387-5', '5588-245655-558-5', 1, '2555-5555', '5554-8855', 'jsjjsjw@jskkw.ks', 'Jsjwjkwkw', 'Jwjsjsjwks', 'Jsjskskkw', '2019-10-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idespecialidad` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `publico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`idespecialidad`, `nombre`, `publico`) VALUES
(1, 'Doctor', 1),
(2, 'Enfermera', 0),
(3, 'ginecologia', 1),
(4, 'Pediatría ', 1);

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
-- Estructura de tabla para la tabla `horarios_citas`
--

CREATE TABLE `horarios_citas` (
  `Idhorario` int(11) NOT NULL,
  `tiempo_cita` time NOT NULL,
  `numero_cita` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `fecha` date NOT NULL,
  `idDoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `horarios_citas`
--

INSERT INTO `horarios_citas` (`Idhorario`, `tiempo_cita`, `numero_cita`, `hora_inicio`, `hora_final`, `fecha`, `idDoc`) VALUES
(1, '23:09:09', 5, '13:09:09', '17:10:13', '2019-10-21', 5),
(2, '16:11:22', 5, '14:11:13', '17:09:12', '2019-10-21', 3),
(3, '10:09:16', 3, '17:10:33', '14:11:22', '2019-10-21', 5),
(4, '15:24:17', 3, '18:15:17', '17:10:24', '2019-10-21', 9);

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
(27, 'swdasdas', 'ssadsdasd', 'sdasd', 'sad', 'sadsad', 10, 27),
(28, 'Jjskwkwks', 'Jwiwkwks', 'Jwjwjjwjw', 'Jwuwuuwjw', 'Uwuwiwkkwjw', 6, 1);

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
  `telefono` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idpaciente`, `iduser`, `nombres`, `apellidos`, `fecha_Nac`, `sexo`, `estado_Civil`, `dui`, `email`, `departamento`, `municipio`, `direccion`, `telefono`) VALUES
(4, 0, 'Byron David', 'Martinez Jiménez', '2019-07-23', 'Masculino', 'Soltero', '123456782', 'byronjimenez9911@gmail.com', 'Ahuachapán', 'El Refugio', 'El Refugio calle 5', '12345102'),
(5, 0, 'Prueba', 'Prueba', '2000-02-14', 'Masculino', 'Casado', '213232312', 'gasdf@gmail.com', 'Sadasdas', 'Sadasd', 'Easdasd', '23121232'),
(6, 3, 'Maria', 'Gozalez', '2019-10-16', 'Femenino', 'Casado', '53886579-6', 'bjskaka@kakq.com', 'Lekdkdns', 'Jsjsjjsjs', 'Jwuwuiqiw', '5653-8888');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pending_quotes`
--

CREATE TABLE `pending_quotes` (
  `idpending` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pending_quotes`
--

INSERT INTO `pending_quotes` (`idpending`, `fecha`, `hora`, `idpaciente`, `idempleado`) VALUES
(6, '2019-07-23', '05:00:00', 4, 7),
(10, '2019-07-24', '12:30:00', 4, 5),
(11, '2019-07-24', '14:00:00', 4, 5);

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
(6, '2019-07-22', 50, 65, 1, 12, 12, 1, 5),
(7, '2019-10-16', 56, 180, 56, 56, 56, 56, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermisos` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermisos`, `valor`) VALUES
(1, 77777777),
(2, 70070000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `idtarea` int(11) NOT NULL,
  `tarea` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `lugar_Tarea` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `hora_Tarea` time NOT NULL,
  `fecha_Tarea` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idtarea`, `tarea`, `lugar_Tarea`, `hora_Tarea`, `fecha_Tarea`) VALUES
(1, 'Reunion de Doctores', 'Sala de Reuniones', '14:11:14', '2019-09-26'),
(2, 'Reunion de Doctoras', 'Sala de Reuniones', '20:12:08', '2019-09-26');

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
  `user_type` int(11) NOT NULL,
  `idpermisos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `user_Name`, `user_Password`, `email`, `user_type`, `idpermisos`) VALUES
(1, 'admin', 'admin', 'rodolfo@gamil.com', 1, 1),
(2, 'byron', '1234', 'byejsjs@jajaa.jsk', 1, 2),
(3, 'user', 'user', 'user@user.com', 2, 0);

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
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermisos`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`idtarea`);

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
  MODIFY `idconsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idespecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `iditemexp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pending_quotes`
--
ALTER TABLE `pending_quotes`
  MODIFY `idpending` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `perfil_paciente`
--
ALTER TABLE `perfil_paciente`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermisos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `idtarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tips`
--
ALTER TABLE `tips`
  MODIFY `idtip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

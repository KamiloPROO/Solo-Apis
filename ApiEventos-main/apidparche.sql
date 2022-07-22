-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2022 a las 15:46:41
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apidparche`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eventsAddOrEdit` (IN `_id` INT, IN `_nombre` VARCHAR(100), IN `_imagen` VARCHAR(255), IN `_descripcion` VARCHAR(500), IN `_fecha` VARCHAR(20), IN `_direccion` VARCHAR(100))   BEGIN
	IF _id = 0 THEN
		INSERT INTO eventos (nombre, imagen, descripcion, fecha, direccion)
        VALUES (_nombre, _imagen, _descripcion, _fecha, _direccion);
        
		SET _id = LAST_INSERT_ID();
    ELSE 
		UPDATE eventos
        SET
			nombre = _nombre,
            imagen = _imagen,
            descripcion = _descripcion,
            fecha = _fecha,
            direccion = _direccion
            WHERE id = _id;
	END IF;
    
    SELECT _id AS id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `imagen`, `descripcion`, `fecha`, `direccion`) VALUES
(9, 'Evento motos', 'https://www.revistaautocrash.com/wp-content/uploads/2017/09/ROYAL-ENFIELD-REUNION-MOTOCICLISTAS.jpg', 'un evento que no te puedes perder', '2022-06-16', 'calle 5#12-31'),
(11, 'Evento de Autos', 'https://www.uniradioserver.com/media/news_thumbs/201807/20180724120857_58.jpg', 'No te lo pierdas!!', '2022-06-16', 'calle 5#12-31'),
(12, 'Evento de Piscinas', 'https://i.pinimg.com/736x/d3/e4/04/d3e4043399ea386a1986805a6aa84ed0--swimming-pool-decorations-decorations-for-weddings.jpg', 'un evento que no te puedes perder, te esperamos!!', '2022-06-29', 'en las vegas'),
(13, 'Evento de Gala', 'https://bmotionav.com/wp-content/uploads/2020/12/gala-evento-plus-2020.jpg', 'Un evento para gente fina', '2022-06-29', 'En washington');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

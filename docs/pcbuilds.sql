-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2025 a las 04:02:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pcbuilds`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClientRol` (IN `p_usercod` BIGINT)   BEGIN
    -- Asignar directamente el valor recibido
    DECLARE v_rolescod VARCHAR(10);
    SET v_rolescod = 'PBL';
    -- Insertar el rol para el usuario recién creado
    INSERT INTO roles_usuarios (
        usercod, rolescod, roleuserest, roleuserfch, roleuserexp
    )
    VALUES (
        p_usercod, v_rolescod, 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR)
    );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretilla`
--

CREATE TABLE `carretilla` (
  `usercod` bigint(10) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretillaanon`
--

CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `id_producto` int(18) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `estado_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_categoria`, `nombre_categoria`, `estado_categoria`) VALUES
(1, 'Procesadores', 'ACT'),
(2, 'Placas Madre', 'ACT'),
(3, 'Memorias RAM', 'ACT'),
(4, 'Almacenamiento', 'ACT'),
(5, 'Tarjetas Gráficas', 'ACT'),
(6, 'Fuentes de poder', 'ACT'),
(7, 'Gabinetes', 'ACT'),
(8, 'Mouse', 'ACT'),
(9, 'Teclados', 'ACT'),
(10, 'Headsets', 'ACT'),
(11, 'Silla Gamer', 'ACT'),
(12, 'Monitores', 'ACT'),
(13, 'Refrigeración', 'ACT'),
(14, 'Accesorios', 'ACT'),
(15, 'Soluciones térmicas', 'ACT'),
(16, 'Laptops', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_producto`
--

CREATE TABLE `estado_producto` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estado_producto`
--

INSERT INTO `estado_producto` (`id_estado`, `estado`) VALUES
(1, 'ACT'),
(2, 'INA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Admin\\Categorias\\Categoria', 'Acceso al controlador de categoría', 'ACT', 'CTR'),
('Controllers\\Admin\\Categorias\\Categorias', 'Permiso para ver listado de categorías', 'ACT', 'CTR'),
('Controllers\\Admin\\Categorias\\Categorias\\delete', 'Permiso para borrar categorías', 'ACT', 'FNC'),
('Controllers\\Admin\\Categorias\\Categorias\\new', 'Permiso para crear nuevas categorías', 'ACT', 'FNC'),
('Controllers\\Admin\\Categorias\\Categorias\\update', 'Permiso para editar categorías', 'ACT', 'FNC'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRol', 'Acceso al controlador de funciones por rol', 'ACT', 'CTR'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRoles', 'Permiso para ver listado de roles con funciones', 'ACT', 'CTR'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\delete', 'Permiso para eliminar o desactivar roles', 'ACT', 'FNC'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\new', 'Permiso para crear nuevos roles', 'ACT', 'FNC'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\update', 'Permiso para actualizar roles', 'ACT', 'FNC'),
('Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\view', 'Permiso para ver detalle de rol', 'ACT', 'FNC'),
('Controllers\\Admin\\FuncionesRoles\\FuncionRol', 'Acceso al controlador de rol individual', 'ACT', 'CTR'),
('Controllers\\Admin\\Funciones\\Funcion', 'Acceso al controlador de funciones', 'ACT', 'CTR'),
('Controllers\\Admin\\Funciones\\Funciones', 'Permiso para ver listado de funciones', 'ACT', 'CTR'),
('Controllers\\Admin\\Funciones\\Funciones\\delete', 'Permiso para eliminar funciones', 'ACT', 'FNC'),
('Controllers\\Admin\\Funciones\\Funciones\\new', 'Permiso para crear nuevas funciones', 'ACT', 'FNC'),
('Controllers\\Admin\\Funciones\\Funciones\\update', 'Permiso para actualizar funciones existentes', 'ACT', 'FNC'),
('Controllers\\Admin\\Marcas\\Marca', 'Acceso al controlador de marcas', 'ACT', 'CTR'),
('Controllers\\Admin\\Marcas\\Marcas', 'Permiso para ver listado de marcas', 'ACT', 'CTR'),
('Controllers\\Admin\\Marcas\\Marcas\\delete', 'Permiso para eliminar marcas', 'ACT', 'FNC'),
('Controllers\\Admin\\Marcas\\Marcas\\new', 'Permiso para crear nuevas marcas', 'ACT', 'FNC'),
('Controllers\\Admin\\Marcas\\Marcas\\update', 'Permiso para editar marcas', 'ACT', 'FNC'),
('Controllers\\Admin\\Orders\\Envio', 'Manejo de Envios', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Envios', 'Manejo de Envios', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Pedido', 'Manejo de Pedidos', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Pedidos', 'Manejo de Pedidos', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\TransHist', 'Histórico de Transacciones', 'ACT', 'CTR'),
('Controllers\\Admin\\Products\\Product', 'Acceso al controlador de producto', 'ACT', 'CTR'),
('Controllers\\Admin\\Products\\Products', 'Acceso general a productos', 'ACT', 'CTR'),
('Controllers\\Admin\\Products\\Products\\delete', 'Permiso para eliminar productos', 'ACT', 'FNC'),
('Controllers\\Admin\\Products\\Products\\new', 'Permiso para crear productos', 'ACT', 'FNC'),
('Controllers\\Admin\\Products\\Products\\update', 'Permiso para actualizar productos', 'ACT', 'FNC'),
('Controllers\\Admin\\RolesUsuarios\\RolesUsuario', 'Acceso al controlador de roles por usuario', 'ACT', 'CTR'),
('Controllers\\Admin\\RolesUsuarios\\RolesUsuarios', 'Acceso al controlador general de roles-usuario', 'ACT', 'CTR'),
('Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\delete', 'Permiso para quitar rol a usuario', 'ACT', 'FNC'),
('Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\new', 'Permiso para asignar rol a usuario', 'ACT', 'FNC'),
('Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\update', 'Permiso para ver roles asignados por usuario', 'ACT', 'FNC'),
('Controllers\\Admin\\Roles\\Rol', 'Acceso al controlador de rol individual', 'ACT', 'CTR'),
('Controllers\\Admin\\Roles\\Roles', 'Permiso para ver listado de roles', 'ACT', 'CTR'),
('Controllers\\Admin\\Roles\\Roles\\delete', 'Permiso para eliminar o desactivar roles', 'ACT', 'FNC'),
('Controllers\\Admin\\Roles\\Roles\\new', 'Permiso para crear nuevo rol', 'ACT', 'FNC'),
('Controllers\\Admin\\Roles\\Roles\\update', 'Permiso para actualizar rol existente', 'ACT', 'FNC'),
('Controllers\\Admin\\Roles\\Roles\\view', 'Permiso para ver detalle de rol', 'ACT', 'FNC'),
('Controllers\\Admin\\Transactions\\Transaction', 'Acceso al controlador de Transacción', 'ACT', 'CTR'),
('Controllers\\Admin\\Transactions\\Transactions', 'Permiso para ver listado de Transacciones', 'ACT', 'CTR'),
('Controllers\\Admin\\Usuarios\\Usuario', 'Acceso al controlador de usuarios', 'ACT', 'CTR'),
('Controllers\\Admin\\Usuarios\\Usuarios', 'Acceso general a usuarios', 'ACT', 'CTR'),
('Controllers\\Admin\\Usuarios\\Usuarios\\delete', 'Permiso para eliminar usuarios', 'ACT', 'FNC'),
('Controllers\\Admin\\Usuarios\\Usuarios\\new', 'Permiso para crear usuarios', 'ACT', 'FNC'),
('Controllers\\Admin\\Usuarios\\Usuarios\\update', 'Permiso para actualizar usuarios', 'ACT', 'FNC'),
('Controllers\\Checkout\\Checkout', 'Acceso al controlador de pago', 'ACT', 'CTR'),
('Controllers\\Checkout\\History', 'Permiso para ver historial de transacciones', 'ACT', 'CTR'),
('Controllers\\Checkout\\HistoryDetail', 'Acceso al detalle del historial de transacciones', 'ACT', 'CTR'),
('Controllers\\Maintenance\\Security\\RolForm', 'Acceso a formulario de seguridad de rol', 'ACT', 'CTR'),
('Menu_Admin_Categorias', 'Entrada del menú para administrar categorías', 'ACT', 'MNU'),
('Menu_Admin_Envios', 'Menu_Envios', 'ACT', 'MNU'),
('Menu_Admin_Funciones', 'Entrada del menú para administrar funciones', 'ACT', 'MNU'),
('Menu_Admin_FuncionesRoles', 'Entrada del menú para administrar funciones y roles', 'ACT', 'MNU'),
('Menu_Admin_Marcas', 'Entrada del menú para administrar marcas', 'ACT', 'MNU'),
('Menu_Admin_Pedidos', 'Menu_Pedidos', 'ACT', 'MNU'),
('Menu_Admin_Products', 'Entrada del menú para administrar productos', 'ACT', 'MNU'),
('Menu_Admin_Roles', 'Entrada del menú para administrar roles', 'ACT', 'MNU'),
('Menu_Admin_RolesUsuario', 'Entrada del menú para roles por usuario', 'ACT', 'MNU'),
('Menu_Admin_RolesUsuarios', 'Menu_Admin_RolesUsuarios', 'ACT', 'MNU'),
('Menu_Admin_Transactions', 'Entrada del menú para historial de transacciones', 'ACT', 'MNU'),
('Menu_Admin_Usuarios', 'Entrada del menú para administrar usuarios', 'ACT', 'MNU'),
('Menu_OrdersHist', 'Entrada del menú para historial de pedidos', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Entrada del menú para checkout de pagos', 'ACT', 'MNU'),
('Menu_TransHist', 'Entrada del menú para historial de transacciones', 'ACT', 'MNU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'Controllers\\Admin\\Categorias\\Categoria', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Categorias\\Categorias', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Categorias\\Categorias\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Categorias\\Categorias\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Categorias\\Categorias\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRol', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRoles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionesRoles\\view', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\FuncionesRoles\\FuncionRol', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Funciones\\Funcion', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Funciones\\Funciones', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Funciones\\Funciones\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Funciones\\Funciones\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Funciones\\Funciones\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Marcas\\Marca', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Marcas\\Marcas', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Marcas\\Marcas\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Marcas\\Marcas\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Marcas\\Marcas\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Orders\\Envio', 'ACT', '2026-07-27 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Orders\\Envios', 'ACT', '2026-07-27 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Orders\\Pedido', 'ACT', '2026-07-27 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Orders\\Pedidos', 'ACT', '2026-07-27 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Products\\Product', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Products\\Products', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Products\\Products\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Products\\Products\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Products\\Products\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuario', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Rol', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\view', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Transactions\\Transaction', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Transactions\\Transactions', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuario', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Categorias', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Envios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Funciones', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_FuncionesRoles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Marcas', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Pedidos', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Products', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Roles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_RolesUsuario', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Usuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_TransHist', 'ACT', '2025-10-10 00:00:00'),
('PBL', 'Controllers\\Checkout\\Checkout', 'ACT', '2026-07-27 03:14:24'),
('PBL', 'Controllers\\Checkout\\History', 'ACT', '2026-07-27 03:14:24'),
('PBL', 'Controllers\\Checkout\\HistoryDetail', 'ACT', '2026-07-27 03:14:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_producto`
--

CREATE TABLE `marca_producto` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `estado_marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `marca_producto`
--

INSERT INTO `marca_producto` (`id_marca`, `nombre_marca`, `estado_marca`) VALUES
(1, 'AMD', 'ACT'),
(2, 'Intel', 'ACT'),
(3, 'Asus', 'ACT'),
(4, 'MSI', 'ACT'),
(5, 'ASRock', 'ACT'),
(6, 'GIGABYTE', 'ACT'),
(7, 'Patriot', 'ACT'),
(8, 'Adata', 'ACT'),
(9, 'Kingston', 'ACT'),
(10, 'Micron', 'ACT'),
(11, 'Samsung', 'ACT'),
(12, 'G.Skill', 'ACT'),
(13, 'Corsair', 'ACT'),
(14, 'Arktek', 'ACT'),
(15, 'Seasonic', 'ACT'),
(16, 'AeroCool', 'ACT'),
(17, 'Cooler Master', 'ACT'),
(18, 'Lian Li', 'ACT'),
(19, 'Hyte', 'ACT'),
(20, 'InWin', 'ACT'),
(21, 'Logitech', 'ACT'),
(22, 'Razer', 'ACT'),
(23, 'Argom', 'ACT'),
(24, 'JNL', 'ACT'),
(25, 'Sharkoon', 'ACT'),
(26, 'LG', 'ACT'),
(27, 'AOC', 'ACT'),
(28, 'DeepCool', 'ACT'),
(29, 'Thermaltake', 'ACT'),
(30, 'EK', 'ACT'),
(31, 'Genius', 'ACT'),
(32, 'Thermal Grizzly', 'ACT'),
(33, 'HP', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `orderid` bigint(20) NOT NULL,
  `usercod` bigint(10) NOT NULL,
  `transactionId` bigint(20) DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `shipping_status` varchar(50) NOT NULL DEFAULT 'PENDING',
  `total` decimal(10,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `orderdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`orderid`, `usercod`, `transactionId`, `order_status`, `shipping_status`, `total`, `currency`, `orderdate`) VALUES
(2, 2, 1, 'COMPLETED', 'SHIPPING', 1172.68, 'USD', '2025-08-01 19:48:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_detalle`
--

CREATE TABLE `ordenes_detalle` (
  `orderItemid` bigint(20) NOT NULL,
  `orderid` bigint(20) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `transdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ordenes_detalle`
--

INSERT INTO `ordenes_detalle` (`orderItemid`, `orderid`, `id_producto`, `cantidad`, `precio`, `transdate`) VALUES
(3, 2, 12, 1, 755.22, '0000-00-00 00:00:00'),
(4, 2, 14, 2, 208.73, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` double(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `imagen` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion`, `precio`, `stock`, `imagen`, `id_categoria`, `id_marca`, `id_estado`) VALUES
(1, 'Core i5', '14400F', 250.47, 10, 'https://www.pcbuildshonduras.com/web/image/product.product/3590/image_1024/%5BBX8071514400F%5D%20Intel%20Core%20i5-14400F?unique=4d4f36d', 1, 2, 1),
(2, 'Core i7', '14700', 527.51, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3039/image_512/%5BBX8071514700%5D%20Intel%20Core%20i7-14700?unique=f8c89db', 1, 2, 1),
(3, 'Core i3', '14100', 231.50, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/2928/image_512/%5BB0CQ1S3L53%5D%20Intel%20Core%20i3-14100%20?unique=f2b3f82', 1, 2, 1),
(4, 'Core i5', '14600KF', 451.61, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/2726/image_512/Intel%20Core%20i5-14600KF?unique=7f8a4a6', 1, 2, 1),
(5, 'Core i9', '14900K', 759.01, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2646/image_512/Intel%20Core%20i9-14900K?unique=3326e72', 1, 2, 1),
(6, 'Core i3', '13100F', 170.78, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/2007/image_512/%5BBX8071513100F%5D%20Intel%20Core%20i3-13100F?unique=7f8a4a6', 1, 2, 1),
(7, 'Core i7', '12700F', 398.48, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/1250/image_512/Intel%20Core%20i7-12700F?unique=3da9b61', 1, 2, 1),
(8, 'Core i5', '12400', 223.91, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/1143/image_512/%5BBX8071512400%5D%20Intel%20Core%20i5-12400?unique=02a750c', 1, 2, 1),
(9, 'Core i5', '12600KF (6P+4E) Cores 4.9 GHz Unlocked', 273.24, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/1139/image_512/Intel%20Core%20i5-12600KF%20%286P%2B4E%29%20Cores%204.9%20GHz%20Unlocked?unique=6a34171', 1, 2, 1),
(10, 'Core i3', '10100F', 106.26, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/705/image_512/%5BBX8070110100F%5D%20Intel%20Core%20i3-10100F?unique=7f8a4a6', 1, 2, 1),
(11, 'Core i3', '10100', 140.42, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/422/image_512/Intel%20Core%20i3-10100?unique=65705d3', 1, 2, 1),
(12, 'Ryzen 7', '9800X3D', 755.22, 0, 'https://www.pcbuildshonduras.com/web/image/product.template/3474/image_512/%5B100-100001084WOF%5D%20AMD%20Ryzen%207%209800X3D?unique=7570deb', 1, 1, 1),
(13, 'Ryzen 7', '8700G', 379.51, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/2824/image_512/AMD%20Ryzen%207%208700G?unique=fdcca45', 1, 1, 1),
(14, 'Ryzen 7', '5700G', 208.73, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/1023/image_512/AMD%20Ryzen%207%205700G?unique=53365ae', 1, 1, 1),
(15, 'Athlon', '3000G', 72.11, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/423/image_512/AMD%20Athlon%203000G?unique=7f8a4a6', 1, 1, 1),
(16, 'PRO Z790-A MAX', 'WIFI DDR5', 398.48, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3642/image_512/%5B911-7E07-014%5D%20%20MSI%20PRO%20Z790-A%20MAX%20WIFI%20DDR5?unique=7511903', 2, 4, 1),
(17, 'PRO Z790-P', 'WiFi DDR5 LGA 1700', 322.58, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3499/image_512/%5B911-7E06-038%5D%20MSI%20PRO%20Z790-P%20WiFi%20DDR5%20LGA%201700?unique=785cc08', 2, 4, 1),
(18, 'MAG B650 Tomahawk', 'WiFi ATX DDR5', 326.38, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2652/image_512/MSI%20MAG%20B650%20Tomahawk%20WiFi%20ATX%20DDR5?unique=60c261e', 2, 4, 1),
(19, 'MAG B550 TOMAHAWK', 'ATX', 261.86, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/337/image_512/%5B911-7C91-044%5D%20MSI%20MAG%20B550%20TOMAHAWK%20ATX?unique=cf5b34d', 2, 4, 1),
(20, 'ROG STRIX B850-F GAMING ', 'WIFI DDR5', 474.38, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/3537/image_512/%5B90MB1J70-M0EAY0%5D%20%20ASUS%20ROG%20STRIX%20B850-F%20GAMING%20WIFI%20%7C%20DDR5%20?unique=7abe035', 2, 3, 1),
(21, 'Prime A620M-K', 'DDR5', 113.85, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/3133/image_512/%5B90MB1F40-M0EAY0%5D%20ASUS%20Prime%20A620M-K%20%7C%20DDR5?unique=9f36b24', 2, 3, 1),
(22, 'Prime X670-P', 'WiFi', 413.66, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2949/image_512/ASUS%20Prime%20X670-P%20WiFi?unique=b87f002', 2, 3, 1),
(23, 'ROG STRIX B760-A GAMING', 'DDR5 WIFI', 333.97, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/2723/image_512/%5B90MB1EP0-M1AAY0%5D%20%20ASUS%20ROG%20STRIX%20B760-A%20GAMING%20%7C%20DDR5%20%7C%20WIFI?unique=a366272', 2, 3, 1),
(24, 'Z790 PRO', 'RS/D4', 292.22, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/3504/image_512/%5BMBZ790MITXWIFI%5D%20ASROCK%20Z790M-ITX%20%7C%20WIFI%20%7C%20DDR5?unique=d74dc1a', 2, 5, 1),
(25, 'B560M-HDV', 'R3.0 1200', 94.88, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/2351/image_512/%5BB560M-HDV%20R3.0%5D%20ASROCK%20B560M-HDV%20R3.0%201200?unique=42d8957', 2, 5, 1),
(26, 'B760 GAMING X AX', 'DDR5', 311.20, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/1823/image_512/GIGABYTE%20B650%20AORUS%20ELITE%20AX%20AM5?unique=9b79f93', 2, 6, 1),
(27, 'B550 AORUS ELITE', 'AX V2', 273.24, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/1720/image_512/Gigabyte%20B550%20AORUS%20ELITE%20AX%20V2%20?unique=40a29a1', 2, 6, 1),
(28, 'VIPER STEEL RGB', '16GB DDR4 3600MHZ', 64.52, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/3740/image_512/%5BPVSR416G360C0%20V4S%5D%20PATRIOT%20VIPER%20STEEL%20RGB%2016GB%20DDR4%203600MHZ?unique=9627476', 3, 7, 1),
(29, 'VIPER STEEL RGB', '8GB DDR4 3200MHZ', 37.95, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/3691/image_512/%5BPVSR48G320C8%20V4S%5D%20PATRIOT%20VIPER%20STEEL%20RGB%208GB%20DDR4%203200MHZ?unique=c794619', 3, 7, 1),
(30, 'VIPER STEEL RGB', '8GB DDR4 3600MHZ', 56.93, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/1230/image_512/%5BPVSR48G360C0%20V4S%5D%20PATRIOT%20VIPER%20STEEL%20RGB%208GB%20DDR4%203600MHZ%20?unique=0ac694c', 3, 7, 1),
(31, 'GOLD', 'DDR5 32 GB 5600MHZ | LAPTOP', 113.85, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/3633/image_512/%5BGD5S5600732G-SMI%5D%20ADATA%20GOLD%20DDR5%2032%20GB%205600MHZ%20%7C%20LAPTOP?unique=b2bbd32', 3, 8, 1),
(32, 'GOLD', 'DDR5 16 GB 5600MHZ | LAPTOP', 60.72, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/3632/image_512/%5BGD5S5600716G-SMI%5D%20ADATA%20GOLD%20DDR5%2016%20GB%205600MHZ%20%7C%20LAPTOP?unique=d3d96e0', 3, 8, 1),
(33, 'Fury Beast RGB', '8GB 5600MT/s DDR5', 56.93, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2933/image_512/%5BKF556C40BBA-8%5D%20Kingston%20Fury%20Beast%20RGB%208GB%205600MT-s%20DDR5?unique=151715b', 3, 9, 1),
(34, 'Value', '8GB (2 x 4GB) DDR4 2400', 26.57, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/1910/image_512/%5BF4-2400C17D-8GNT%5D%20G.SKILL%20Value%208GB%20%282%20x%204GB%29%20DDR4%202400?unique=6fb8484', 3, 12, 1),
(35, 'Value', '8GB (2 x 8GB) DDR4 2400', 37.95, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/1898/image_512/%5BF4-2400C17D-16GNT%5D%20G.Skill%20Value%202x8GB%20DDR4%202400Mhz?unique=4f89ed7', 3, 12, 1),
(36, 'Trident Z Royal Series', '16GB (2 x 8GB) DDR4 3600 MHz GOLD', 110.06, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/655/image_512/%5BF4-3600C18D-16GTRG%5D%20G.SKILL%20Trident%20Z%20Royal%20Series%2016GB%20%282%20x%208GB%29%20DDR4%203600%20MHz%20GOLD?unique=aa67b85', 3, 12, 1),
(37, 'PC5-44800', '8GB DDR5-5600MT', 75.90, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3727/image_512/Samsung%208GB%20PC5-44800%20DDR5-5600MT?unique=f2158b4', 3, 11, 1),
(38, 'PC5-5600B', '8 GB DDR5 SODIMM', 75.90, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/3726/image_512/%5BMTC4C10163S1SC56BD1%5D%20Micron%208%20GB%20DDR5%20PC5-5600B%20SODIMM?unique=55f725e', 3, 10, 1),
(39, 'AORUS 5000E', '1TB M.2 Gen4', 148.01, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/3574/image_512/GIGABYTE%20AORUS%205000E%20%7C%201TB%20M.2%20Gen4?unique=1b2fcc5', 4, 6, 1),
(40, 'MP600 GS', '500GB M.2 GEN4', 94.88, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/3527/image_512/%5BCSSD-F0500GBMP600GS%5D%20CORSAIR%20MP600%20GS%20500GB%20M.2%20GEN4?unique=c8be4a4', 4, 13, 1),
(41, 'NV3', '500GB M.2 | PCIe 4.0 Gen 4x4', 56.93, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/3453/image_512/%5BSNV3S-500G%5D%20KINGSTON%20NV3%20500GB%20M.2%20%7C%20PCIe%204.0%20Gen%204x4?unique=b37a1f0', 4, 9, 1),
(42, 'LEGEND 700', '1TB M.2 | GEN3', 83.49, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3151/image_512/%5BALEG-700-1TCS%5D%20ADATA%20LEGEND%20700%201TB%20M.2%20%7C%20GEN3?unique=54d3bb1', 4, 8, 1),
(43, 'XPG', '1TB GAMMIX S70 Blade Gen4', 113.85, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/1431/image_512/%5BAGAMMIXS70B-1T-CS%5D%20ADATA%20XPG%201TB%20GAMMIX%20S70%20Blade%20Gen4?unique=ce4f417', 4, 8, 1),
(44, 'A400', '240 GB', 37.95, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/156/image_512/%5BSA400S37-240G%5D%20Kingston%20A400%20240%20GB?unique=eee1a17', 4, 9, 1),
(45, 'GEFORCE RTX 5060 TI', '16G GAMING TRIO OC 16GB', 929.79, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3646/image_512/%5B912-V535-030%5D%20MSI%20GEFORCE%20RTX%205060%20TI%2016G%20GAMING%20TRIO%20OC%2016GB?unique=e819bc1', 5, 4, 1),
(46, 'GeForce RTX 5080', '16G VENTUS 3X OC', 1666.03, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/3444/image_512/%5BVG-MSIG5080-16V3C%5D%20MSI%20GeForce%20RTX%205080%2016G%20VENTUS%203X%20OC%20?unique=4635170', 5, 4, 1),
(47, 'GeForce RTX 4060', 'VENTUS 2X 8G OC | BLACK', 489.56, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/2683/image_512/%5B912-V516-012%5D%20MSI%20GeForce%20RTX%204060%20VENTUS%202X%208G%20OC%20%7C%20BLACK?unique=e291aa6', 5, 4, 1),
(48, 'Dual Radeon RX 7600', 'EVO OC Edition 8GB GDDR6', 451.61, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/3535/image_512/%5B90YV0LD0-M0AA00%5D%20ASUS%20Dual%20Radeon%20RX%207600%20EVO%20OC%20Edition%208GB%20GDDR6?unique=c357b74', 5, 3, 1),
(49, 'GT710', '2GB DDR3', 56.93, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3396/image_512/%5BAKN710D3S2GL1%5D%20%20ARKTEK%20GT710%202GB%20DDR3?unique=5f546c8', 5, 14, 1),
(50, 'Vertex', '1000W 80+ PLATINUM MODULAR | ATX 3.0 | PCIe 5.0', 330.17, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/3476/image_512/%5BVERTEXPX-100012102PXAFS%5D%20SEASONIC%201000W%2080%2B%20PLATINUM%20MODULAR%20%7C%20ATX%203.0%20%7C%20PCIe%205.0%20?unique=ea7fbb8', 6, 15, 1),
(51, 'VX PLUS', '500W', 34.16, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/3065/image_512/%5BACPN-VB50MUY.11%5D%20AEROCOOL%20VX%20PLUS%20%7C%20500W%20?unique=0621cec', 6, 16, 1),
(52, 'KCAS', '600W BRONZE', 64.52, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2979/image_512/%5BACPB-KC60FUC.12%5D%20AEROCOOL%20KCAS%20%7C%20600W%20BRONZE%20?unique=66ea313', 6, 16, 1),
(53, 'MWE', 'BRONZE V2 650W', 102.47, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/2971/image_512/%5BMPE-6501-ACAAB-US%5D%20COOLER%20MASTER%20MWE%20BRONZE%20V2%20650W?unique=66ea313', 6, 17, 1),
(54, 'UD850', '850W 80+ GOLD | MODULAR', 151.80, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/2748/image_512/%5BGP-UD850GM%5D%20GIGABYTE%20850W%2080%2B%20GOLD%20%7C%20MODULAR?unique=41554b3', 6, 6, 1),
(55, ' SP 750', '80+ Gold SFX', 151.80, 3, 'https://www.pcbuildshonduras.com/web/image/product.template/2625/image_512/%5BG89.SP750B.00US%5D%20LIAN%20LI%20-%20SP%20750%2080%2B%20Gold%20SFX?unique=4cb1f55', 6, 18, 1),
(56, 'Y40', 'ATX | RED&BLACK', 159.39, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/3637/image_512/%5BCS-HYTE-Y40-BR%5D%20HYTE%20Y40%20ATX%20%7C%20RED%26BLACK?unique=ceb1655', 7, 19, 1),
(57, 'REVOLT 3', 'ITX | BLACK', 170.78, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3502/image_512/%5BCS-HYTE-REVOLT3-B%5D%20%20HYTE%20REVOLT%203%20ITX%20%7C%20BLACK?unique=69d5971', 7, 19, 1),
(58, 'Y70', 'ATX | WHITE', 284.63, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/3332/image_512/%5BCS-HYTE-Y70-WW%5D%20HYTE%20Y70%20ATX%20%7C%20WHITE?unique=a035d47', 7, 19, 1),
(59, 'Y60', 'ATX | BLACK', 246.68, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/3325/image_512/%5BCS-HYTE-Y60-B%5D%20HYTE%20Y60%20ATX%20%7C%20BLACK?unique=0fd1dce', 7, 19, 1),
(60, 'O11 Vision', 'WHITE', 170.78, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/3320/image_512/%5BG99.O11VW.00%5D%20Lian%20Li%20O11%20Vision%20-%20WHITE?unique=f96a72b', 7, 18, 1),
(61, '6500X', '| ATX | WHITE', 246.68, 9, 'https://www.pcbuildshonduras.com/web/image/product.template/3087/image_512/%5BCC-9011258-WW%5D%20CORSAIR%206500X%20%7C%20ATX%20%7C%20WHITE?unique=2f0a431', 7, 13, 1),
(62, 'AIRFLOW 2500D', '| MICRO-ATX | BLACK', 189.75, 10, 'https://www.pcbuildshonduras.com/web/image/product.template/3086/image_512/%5BCC-9011263-WW%5D%20CORSAIR%20AIRFLOW%202500D%20%7C%20MICRO-ATX%20%7C%20BLACK?unique=5e73f24', 7, 13, 1),
(63, 'OBSIDIAN SERIES', '1000D RGB', 690.70, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3071/image_512/%5BCC-9011148-WW%5D%20CORSAIR%20OBSIDIAN%20SERIES%201000D%20RGB?unique=0bd0f8a', 7, 13, 1),
(64, 'Obsidian Series', '500D RGB SE Premium', 379.51, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/2354/image_512/%5BCC-9011139-WW%5D%20Corsair%20Obsidian%20Series%20500D%20RGB%20SE%20Premium?unique=7c6db0a', 7, 13, 1),
(65, 'G309', 'LIGHTSPEED', 94.88, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3617/image_512/%5B910-007197%5D%20LOGITECH%20G309%20LIGHTSPEED?unique=586abb5', 8, 21, 1),
(66, 'G502', 'X Lightspeed Wireless BLACK', 144.21, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2521/image_512/%5B910-006178%5D%20Logitech%20G502%20X%20Lightspeed%20Wireless%20%7C%20BLACK?unique=eec0558', 8, 21, 1),
(67, 'G203 ', 'LIGHTSYNC - Lilac', 30.36, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/1037/image_512/%5B910-005851%5D%20Logitech%20G203%20LIGHTSYNC%20-%20Lilac?unique=44c4a5c', 8, 21, 1),
(68, 'Viper V2 Pro', 'PUBG', 216.32, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/3048/image_512/%5BRZ01-04390600-R3M1%5D%20Razer%20Viper%20V2%20Pro%20-%20PUBG?unique=cebfa82', 8, 22, 1),
(69, 'DeathAdder V3', 'Ultra-lightweight', 83.49, 7, 'https://www.pcbuildshonduras.com/web/image/product.template/2166/image_512/%5BRZ01-04640100-R3U1%5D%20Razer%20DeathAdder%20V3%20Ultra-lightweight?unique=9cc306b', 8, 22, 1),
(70, 'Basilisk V3 Pro', 'Customizable | Wireless', 178.37, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/1938/image_512/%5BRZ01-04620100-R3U1%5D%20Razer%20Basilisk%20V3%20Pro%20%7C%20Customizable%20%7C%20Wireless?unique=d8af26c', 8, 22, 1),
(71, 'Viper V2 Pro', 'HyperSpeed Wireless | BLACK', 174.57, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/1715/image_512/%5BRZ01-04390100-R3U1%5D%20Razer%20Viper%20V2%20Pro%20HyperSpeed%20Wireless%20%7C%20BLACK?unique=ad5e091', 8, 22, 1),
(72, 'Ironclaw', 'RGB', 68.31, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/1635/image_512/%5BCH-9307011-NA%5D%20Corsair%20Ironclaw%20RGB?unique=5588054', 8, 13, 1),
(73, 'ERGO WAVE KEYS', 'BLACK', 72.11, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3620/image_512/%5B920-012278%5D%20LOGITECH%20ERGO%20WAVE%20KEYS%20%7C%20BLACK?unique=d0a23b2', 9, 21, 1),
(74, 'G515 LIGHTSPEED TKL', 'Tactile Brown Switch | WHITE', 178.37, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3615/image_512/%5B920-012535%5D%20LOGITECH%20G515%20LIGHTSPEED%20TKL%20%7C%20Tactile%20Brown%20Switch%20%7C%20WHITE?unique=88bc2d3', 9, 21, 1),
(75, 'K120', 'BLACK', 15.18, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/3333/image_512/%5B920-002478%5D%20%20Logitech%20K120%20?unique=8d70393', 9, 21, 1),
(76, 'G PRO X TKL Wireless', 'BLACK', 258.06, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/3061/image_512/%5B920-012127%5D%20LOGITECH%20G%20PRO%20X%20TKL%20Wireless%20%7C%20BLACK?unique=b749124', 9, 21, 1),
(77, 'G915 TKL', 'Tenkeyless Lightspeed Wireless RGB Mechanical', 223.91, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/1368/image_512/%5B920-009495%5D%20Logitech%20G915%20TKL%20Tenkeyless%20Lightspeed%20Wireless%20RGB%20Mechanical?unique=92aa2c8', 9, 21, 1),
(78, 'CK550 V2', 'Brown Switch', 102.47, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3044/image_512/%5BCK-550-GKTM1-US%5D%20Cooler%20Master%20CK550%20V2%20%7C%20Brown%20Switch?unique=ad9b5f1', 9, 17, 1),
(79, 'Master MS111', 'Combo', 60.72, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/1669/image_512/%5BMS-111-KKMF1-LS%5D%20Combo%20Cooler%20Master%20MS111?unique=82c82fd', 9, 17, 1),
(80, 'K100 RGB', 'BLACK | CHERRY MX SPEED RGB', 296.02, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/856/image_512/%5BCH-912A01A-%20NA%5D%20Corsair%20K100%20RGB%20%7C%20BLACK%20%7C%20CHERRY%20MX%20SPEED%20RGB?unique=d8ab05d', 9, 13, 1),
(81, 'K95 RGB Platinum XT', 'Cherry MX SPEED RGB Silver', 235.29, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/334/image_512/%5BCH-9127414-NA%5D%20Corsair%20K95%20RGB%20Platinum%20XT%20%7C%20Cherry%20MX%20SPEED%20RGB%20Silver?unique=889dd2d', 9, 13, 1),
(82, 'K1', 'Gaming Keyboard', 148.01, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/2175/image_512/%5BGK-AORUSK1%5D%20AORUS%20K1%20Gaming%20Keyboard?unique=d8e2587', 9, 16, 1),
(83, 'PUREWRITER TKL RGB', 'BLACK', 83.49, 6, 'https://www.pcbuildshonduras.com/web/image/product.template/2760/image_512/%5B4044951021505%5D%20SHARKOON%20PUREWRITER%20TKL%20RGB%20%7C%20BLACK%20?unique=a8d88fd', 9, 25, 1),
(84, 'BLACKSHARK V2 PRO', 'BLACK', 242.88, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3619/image_512/%5BRZ04-04530500-R3U1%5D%20RAZER%20BLACKSHARK%20V2%20PRO%20%7C%20BLACK?unique=f5040ac', 10, 22, 1),
(85, 'Barracuda Wireless Gaming', 'BLACK', 185.96, 8, 'https://www.pcbuildshonduras.com/web/image/product.template/3618/image_512/%5BRZ04-03790100-R3U1%5D%20Razer%20Barracuda%20Wireless%20Gaming%20%7C%20BLACK?unique=e6b692c', 10, 22, 1),
(86, 'Barracuda Wireless', 'WHITE', 182.16, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/2966/image_512/Razer%20Barracuda%20Wireless%20%7C%20WHITE?unique=08be7e6', 10, 22, 1),
(87, 'BlackShark V2', 'X Wired Gaming Headset 3.5mm | Green', 45.54, 2, 'https://www.pcbuildshonduras.com/web/image/product.template/1375/image_512/%5BRZ04-03240600-R3U1%5D%20Razer%20BlackShark%20V2%20X%20Wired%20Gaming%20Headset%203.5mm%20%7C%20Green?unique=00dcf9b', 10, 22, 1),
(88, 'A50', 'X LIGHTSPEED WIRELESS + BASE STATION | BLACK', 440.23, 4, 'https://www.pcbuildshonduras.com/web/image/product.template/3517/image_512/%5B939-002126%5D%20LOGITECH%20A50%20X%20LIGHTSPEED%20WIRELESS%20%2B%20BASE%20STATION%20%7C%20BLACK?unique=a85f230', 10, 21, 1),
(89, 'ASTRO Gaming A10', 'Gen2 | BLACK', 83.49, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3059/image_512/%5B939-002055%5D%20Logitech%20ASTRO%20Gaming%20A10%20%7C%20Gen2%20%7C%20BLACK?unique=b4bca3e', 10, 21, 1),
(90, 'Zone 300 Wireless', 'WHITE', 68.31, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/3052/image_512/%5B981-001416%5D%20Logitech%20Zone%20300%20Wireless%20%7C%20WHITE?unique=a194b6c', 10, 21, 1),
(91, 'G733', 'Lightspeed Wireless | BLACK', 174.57, 1, 'https://www.pcbuildshonduras.com/web/image/product.template/2519/image_512/%5B981-000863%5D%20Logitech%20G733%20Lightspeed%20Wireless%20%7C%20BLACK?unique=b5bfac4', 10, 21, 1),
(92, 'G PRO X', 'Wireless Lightspeed', 216.32, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/1389/image_512/%5B981-000906%5D%20Logitech%20G%20PRO%20X%20Wireless%20Lightspeed?unique=72b21bb', 10, 21, 1),
(93, 'ROG DELTA', 'BLACK', 235.29, 5, 'https://www.pcbuildshonduras.com/web/image/product.template/2770/image_512/ASUS%20ROG%20DELTA%20%7C%20BLACK%20?unique=5b2e79b', 10, 3, 1),
(94, 'THUNDERX3 CORE-MODERN', 'CORE-MODERN | BLACK', 413.66, 9, 'https://www.pcbuildshonduras.com/web/image/product.product/3092/image_1024/%5BTEGC-2057101.11%5D%20AEROCOOL%20THUNDERX3%20CORE-MODERN%20%7C%20BLACK?unique=6f694af', 11, 16, 1),
(95, 'Enki X Essential', 'BLACK', 463.00, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/1220/image_1024/%5BRZ38-03880100-R3U1-AF%5D%20Razer%20Enki%20X%20Essential?unique=f49784f', 11, 22, 1),
(96, 'Ultragear 24GS65F-B', '| 24\" | IPS | HDR10 | 1920x1080 | 180 Hz | 1ms |', 223.91, 4, 'https://www.pcbuildshonduras.com/web/image/product.product/3575/image_1024/%5B24GS65F-B%5D%20LG%20Ultragear%2024%22%20%7C%2024GS65F-B%20%7C%20IPS%20%7C%20HDR10%20%7C%201920x1080%20%7C%20180%20Hz%20%7C%201ms%20%7C?unique=9d5b7c3', 12, 26, 1),
(97, 'Ultragear 27GS65F-B', '| 27\" | 27GS65F-B | IPS | 1920x1080 | 180 | Hz | 1ms', 273.24, 6, 'https://www.pcbuildshonduras.com/web/image/product.product/3416/image_1024/%5B27GS65F-B%5D%20LG%2027GS65F-B%20%7C%2027%22%20%7C%2027GS65F-B%20%7C%20IPS%20%7C%201920x1080%20%7C%20180%20%7C%20Hz%20%7C%201ms?unique=3092f42', 12, 26, 1),
(98, '27G4', 'FHD 27\" | 1920 × 1080 | 180HZ | 0.5MS | IPS', 261.86, 7, 'https://www.pcbuildshonduras.com/web/image/product.product/3413/image_1024/AOC%2027G4%20FHD%2027%22%20%7C%201920%20%C3%97%201080%20%7C%20180HZ%20%7C%200.5MS%20%7C%20IPS?unique=5b1f71c', 12, 27, 1),
(99, '24G4', '24\" | IPS | 1920 x 1080 | 180 Hz | 0.5MS', 254.27, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/3371/image_1024/AOC%2024G4%20de%2024%22%20%7C%20IPS%20%7C%201920%20x%201080%20%7C%20180%20Hz%20%7C%200.5MS?unique=c8ae54b', 12, 27, 1),
(100, 'THICC Q60', 'DIGITAL 240MM', 368.12, 9, 'https://www.pcbuildshonduras.com/web/image/product.product/3589/image_1024/%5BFAN-HYTE-Q60-BW%5D%20HYTE%20THICC%20Q60%20DIGITAL%20240MM?unique=f60f8d5', 13, 19, 1),
(101, 'LT360', 'ARGB 360MM', 178.37, 4, 'https://www.pcbuildshonduras.com/web/image/product.product/3487/image_1024/%5BR-LT360-BKAMNC-G-1%5D%20DEEPCOOL%20LT360%20ARGB%20360MM%20?unique=3829ed7', 13, 28, 1),
(102, 'AG400', 'ARGB | WHITE', 37.95, 1, 'https://www.pcbuildshonduras.com/web/image/product.product/3468/image_1024/%5BAG400-WHANMC-G2%5D%20DEEPCOOL%20AG400%20ARGB%20%7C%20WHITE?unique=fc0207c', 13, 28, 1),
(103, 'UX100', 'ARGB', 22.77, 9, 'https://www.pcbuildshonduras.com/web/image/product.product/2594/image_1024/%5BCL-P064-AL12SW-A%5D%20Thermaltake%20UX100%20ARGB?unique=2f978dd', 13, 29, 1),
(104, 'MIRAGE 5', 'ARGB PWM | BLACK', 37.95, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/3466/image_1024/%5BACTC-MR90517.13%5D%20%20AEROCOOL%20MIRAGE%205%20ARGB%20PWM%20%7C%20BLACK?unique=518b508', 13, 16, 1),
(105, 'MIRAGE L240', 'ARGB 240MM | WHITE', 98.67, 6, 'https://www.pcbuildshonduras.com/web/image/product.product/3463/image_1024/%5BACLAMR24127.73%5D%20AEROCOOL%20MIRAGE%20L240%20ARGB%20240MM%20%7C%20WHITE?unique=1284ed3', 13, 16, 1),
(106, 'MIRAGE L120', 'ARGB 120MM | BLACK', 83.49, 8, 'https://www.pcbuildshonduras.com/web/image/product.product/3462/image_1024/%5BACLA%20MR12117.73%5D%20%20AEROCOOL%20MIRAGE%20L120%20ARGB%20120MM%20%7C%20BLACK?unique=21d9ac6', 13, 16, 1),
(107, 'CYLON 4F', 'ARGB | WHITE', 37.95, 7, 'https://www.pcbuildshonduras.com/web/image/product.product/3011/image_1024/%5BACTC-CL30430.02%5D%20AEROCOOL%20CYLON%204F%20ARGB%20%7C%20WHITE?unique=7a94cdf', 13, 16, 1),
(108, 'MIRAGE L360', 'ARGB 360MM', 110.06, 6, 'https://www.pcbuildshonduras.com/web/image/product.product/2917/image_1024/%5BACLA-MR36117.73%5D%20AEROCOOL%20MIRAGE%20L360%20ARGB%20360MM?unique=1284ed3', 13, 16, 1),
(109, 'MasterLiquid 240L', 'Core 240mm | BLACK', 129.03, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/2690/image_1024/%5BMLW-D24M-A18PZ-R1%5D%20Cooler%20Master%20MasterLiquid%20240L%20Core%20240mm%20%7C%20BLACK?unique=8e65221', 13, 17, 1),
(110, 'G-STAND M200', 'BASE PARA LAPTOP BLACK', 15.18, 4, 'https://www.pcbuildshonduras.com/web/image/product.product/3473/image_1024/%5B31250020400%5D%20BASE%20PARA%20LAPTOP%20GENIUS%20G-STAND%20M200%20%7C%20BLACK?unique=3d24fae', 14, 31, 1),
(111, 'SHARK BLADE', 'RGB STRIP', 15.18, 8, 'https://www.pcbuildshonduras.com/web/image/product.product/3460/image_1024/%5B4044951026883%5D%20SHARKOON%20%7C%20SHARK%20BLADE%20RGB%20STRIP?unique=9dec1dd', 14, 25, 1),
(112, 'Seiren V3 Mini', 'USB Microphone | WHITE', 72.11, 8, 'https://www.pcbuildshonduras.com/web/image/product.product/3018/image_1024/%5BRZ19-05050300-R3U1%5D%20Razer%20Seiren%20V3%20Mini%20%7C%20USB%20Microphone%20%7C%20WHITE?unique=5725eea', 14, 22, 1),
(113, 'Base Station V2', 'Chroma', 102.47, 6, 'https://www.pcbuildshonduras.com/web/image/product.product/1954/image_1024/Razer%20Base%20Station%20V2%20Chroma?unique=76555b7', 14, 22, 1),
(114, 'C920S PRO', 'HD 1080P', 102.47, 8, 'https://www.pcbuildshonduras.com/web/image/product.product/2671/image_1024/%5B960-001257%5D%20LOGITECH%20C920S%20PRO%20HD%201080P?unique=5725eea', 14, 21, 1),
(115, 'ST100', 'RGB Premium Headset Stand with 7.1 Surround Sound', 121.44, 7, 'https://www.pcbuildshonduras.com/web/image/product.product/1953/image_1024/Corsair%20ST100%20RGB%20Premium%20Headset%20Stand%20with%207.1%20Surround%20Sound?unique=67bc810', 14, 13, 1),
(116, 'ST50', 'Premium Headset Stand Black', 53.13, 4, 'https://www.pcbuildshonduras.com/web/image/product.product/1952/image_1024/Corsair%20ST50%20Premium%20Headset%20Stand%20Black?unique=4b3577b', 14, 13, 1),
(117, 'Spatula', '3 pcs', 5.69, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/2790/image_1024/%5BTG-AS-3%5D%20Thermal%20Grizzly%20Spatula%20-%203%20pcs?unique=9dec1dd', 15, 32, 1),
(118, 'Contact Sealing Frame', 'AM5', 22.77, 1, 'https://www.pcbuildshonduras.com/web/image/product.product/2782/image_1024/%5BTG-CSF-AM5%5D%20Thermal%20Grizzly%20Contact%20Sealing%20Frame%20-%20AM5?unique=97041e4', 15, 32, 1),
(119, 'Aeronaut', '3,9g / 1,5ml', 11.39, 6, 'https://www.pcbuildshonduras.com/web/image/product.product/2761/image_1024/%5BTG-A-015-R%5D%20Thermal%20Grizzly%20Aeronaut%20-%203%2C9g%20-%201%2C5ml%20?unique=f41329e', 15, 32, 1),
(120, 'Lapping Tool', 'Ryzen 7000', 18.98, 3, 'https://www.pcbuildshonduras.com/web/image/product.product/2781/image_1024/%5BTG-LT-aR7000%5D%20Thermal%20Grizzly%20Lapping%20Tool%20-%20Ryzen%207000?unique=675574b', 15, 32, 1),
(121, '240 G9 14', '| I5-1235U | 8GB RAM | 256GB SSD |', 603.42, 5, 'https://www.pcbuildshonduras.com/web/image/product.product/3356/image_1024/LAPTOP%20HP%20240%20G9%2014%22%20%7C%20I5-1235U%20%7C%208GB%20RAM%20%7C%20256GB%20SSD%20%7C%20?unique=dfe3050', 16, 33, 1),
(122, 'X1504ZA-NJ246 15.6', '| I5-1235U | 8GB RAM | 512GB SSD |', 717.27, 4, 'https://www.pcbuildshonduras.com/web/image/product.product/3355/image_1024/%5B90NB1022-M00UA0%5D%20LAPTOP%20ASUS%20X1504ZA-NJ246%2015.6%22%20%7C%20I5-1235U%20%0A%7C%208GB%20RAM%20%7C%20512GB%20SSD%20%7C%20?unique=e0a5bcd', 16, 3, 1),
(123, 'E1504GA-NJ276 15.6', '| I3-N305 | 8GB RAM | 512GB SSD |', 527.51, 8, 'https://www.pcbuildshonduras.com/web/image/product.product/3354/image_1024/%5B90NB0ZT2-M00LM0%5D%20LAPTOP%20ASUS%20E1504GA-NJ276%2015.6%22%20%7C%20I3-N305%20%0A%7C%208GB%20RAM%20%7C%20512GB%20SSD%20%7C?unique=8be612c', 16, 3, 1),
(124, 'MODERN 15 B7M-426 15.6', 'RYZEN 5 7530U | 16GB RAM | 512GB SSD |', 907.02, 11, 'https://www.pcbuildshonduras.com/web/image/product.product/3353/image_1024/%5B9S7-15HK12-426%5D%20LAPTOP%20MSI%20MODERN%2015%20B7M-426%2015.6%22%20RYZEN%205%207530U%20%7C%2016GB%20RAM%20%7C%20512GB%20SSD%20%7C%20?unique=e0a5bcd', 16, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador', 'ACT'),
('PBL', 'Cliente', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
(1, 'ADMIN', 'ACT', '2025-07-31 14:16:43', '2026-07-31 14:16:43'),
(2, 'PBL', 'ACT', '2025-08-01 19:44:51', '2026-08-01 19:44:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `transactionId` bigint(20) NOT NULL,
  `usercod` bigint(10) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `transdate` datetime DEFAULT current_timestamp(),
  `transstatus` varchar(45) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `orderjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`orderjson`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`transactionId`, `usercod`, `orderid`, `transdate`, `transstatus`, `amount`, `currency`, `orderjson`) VALUES
(1, 2, '63630090TW8207600', '2025-08-01 19:49:01', 'COMPLETED', 1172.68, 'USD', '{\"id\":\"63630090TW8207600\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-843umd44878307@personal.example.com\",\"account_id\":\"9GLV72MRBEEHA\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1744099311\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"1M044335XA743011N\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"1172.68\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"1172.68\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"57.76\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"1114.92\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1M044335XA743011N\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1M044335XA743011N\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/63630090TW8207600\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-08-02T01:48:59Z\",\"update_time\":\"2025-08-02T01:48:59Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-843umd44878307@personal.example.com\",\"payer_id\":\"9GLV72MRBEEHA\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/63630090TW8207600\",\"rel\":\"self\",\"method\":\"GET\"}]}');

--
-- Disparadores `transactions`
--
DELIMITER $$
CREATE TRIGGER `after_transaction_insert` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    DECLARE last_orderid BIGINT;
    
    -- Obtener el último orderid de la tabla ordenes
    SELECT orderid INTO last_orderid FROM ordenes ORDER BY orderid DESC LIMIT 1;

    -- Actualizar el último registro de ordenes con el transactionId recién insertado
    UPDATE ordenes SET transactionId = NEW.transactionId WHERE orderid = last_orderid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
(1, 'cuenta_admin123@gmail.com', 'Administrador', '$2y$10$/PEN4VOiiaAtTw6x.YAzxuFI8qZgGUV6Ohkdr/ed0F6EV/sLHFh7m', '2025-07-31 14:16:43', 'ACT', '2025-10-29 00:00:00', 'ACT', '1574982ad95691c9318622069d6fc453e8f40b4a171833b2d4f11e80c8a9cede', '2025-07-31 14:16:43', 'ADM'),
(2, 'vanessa2212valladares@gmail.com', 'Vanessa_123', '$2y$10$7milVIHC4z9MejnvxNt6nuCGthqndaHxEHl6MrHxxh.Tqq/sAbvPa', '2025-08-01 19:44:51', 'ACT', '2025-10-30 00:00:00', 'ACT', 'b4300e13281b6eb3cde4c625000cd7882b74069a819a3a0a8accc169216f1eaf', '2025-08-01 19:44:51', 'PBL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD PRIMARY KEY (`usercod`,`id_producto`),
  ADD KEY `id_producto_idx` (`id_producto`);

--
-- Indices de la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD PRIMARY KEY (`anoncod`,`id_producto`),
  ADD KEY `id_producto_idx` (`id_producto`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `marca_producto`
--
ALTER TABLE `marca_producto`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `usercod` (`usercod`),
  ADD KEY `transactionId` (`transactionId`);

--
-- Indices de la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  ADD PRIMARY KEY (`orderItemid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`),
  ADD KEY `fk_producto_marca` (`id_marca`),
  ADD KEY `fk_producto_estado` (`id_estado`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `fk_transactions_user_idx` (`usercod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca_producto`
--
ALTER TABLE `marca_producto`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  MODIFY `orderItemid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usercod` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`),
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`transactionId`) REFERENCES `transactions` (`transactionId`);

--
-- Filtros para la tabla `ordenes_detalle`
--
ALTER TABLE `ordenes_detalle`
  ADD CONSTRAINT `ordenes_detalle_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `ordenes` (`orderid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordenes_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado_producto` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca_producto` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_user` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

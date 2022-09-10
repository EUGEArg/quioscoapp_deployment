/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `pedido` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoriaId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_categoriaId_fkey` (`categoriaId`),
  CONSTRAINT `Producto_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('596261b3-bf6c-49be-ae8c-ac24d66ad6ad', 'e6e8cae43b67d8bb7d10215d78afce3586b7b6ff76020b0e9e324c4770151e9d', '2022-07-23 13:49:15.719', '20220723134915_categoria_y_productos', NULL, NULL, '2022-07-23 13:49:15.543', 1);
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('fd6a99db-a210-48f3-ae73-3a1d5d43f727', 'a95dec0fde2a69dae5501ef366105fe918bac2bba73a79a3418d17b6f891c38a', '2022-07-25 11:19:57.159', '20220725111957_ordenes', NULL, NULL, '2022-07-25 11:19:57.089', 1);


INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(1, 'Café', 'cafe');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(2, 'Hamburguesas', 'hamburguesa');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(3, 'Pizzas', 'pizza');
INSERT INTO `categoria` (`id`, `nombre`, `icono`) VALUES
(4, 'Donas', 'dona'),
(5, 'Pasteles', 'pastel'),
(6, 'Galletas', 'galletas');



INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(1, 'Café Caramel con Chocolate', 59.9, 'cafe_01', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(2, 'Café Frio con Chocolate Grande', 49.9, 'cafe_02', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(3, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_03', 1);
INSERT INTO `producto` (`id`, `nombre`, `precio`, `imagen`, `categoriaId`) VALUES
(4, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_04', 1),
(5, 'Malteada Fria con Chocolate Grande', 54.9, 'cafe_05', 1),
(6, 'Café Mocha Caliente Chico', 39.9, 'cafe_06', 1),
(7, 'Café Mocha Caliente Grande con Chocolate', 59.9, 'cafe_07', 1),
(8, 'Café Caliente Capuchino Grande', 59.9, 'cafe_08', 1),
(9, 'Café Mocha Caliente Mediano', 49.9, 'cafe_09', 1),
(10, 'Café Mocha Frio con Caramelo Mediano', 49.9, 'cafe_10', 1),
(11, 'Café Mocha Frio con Chocolate Mediano', 49.9, 'cafe_11', 1),
(12, 'Café Espresso', 29.9, 'cafe_12', 1),
(13, 'Café Capuchino Grande con Caramelo', 59.9, 'cafe_13', 1),
(14, 'Café Caramelo Grande', 59.9, 'cafe_14', 1),
(15, 'Paquete de 3 donas de Chocolate', 39.9, 'donas_01', 4),
(16, 'Paquete de 3 donas Glaseadas', 39.9, 'donas_02', 4),
(17, 'Dona de Fresa ', 19.9, 'donas_03', 4),
(18, 'Dona con Galleta de Chocolate ', 19.9, 'donas_04', 4),
(19, 'Dona glass con Chispas Sabor Fresa ', 19.9, 'donas_05', 4),
(20, 'Dona glass con Chocolate ', 19.9, 'donas_06', 4),
(21, 'Dona de Chocolate con MÁS Chocolate ', 19.9, 'donas_07', 4),
(22, 'Paquete de 3 donas de Chocolate ', 39.9, 'donas_08', 4),
(23, 'Paquete de 3 donas con Vainilla y Chocolate ', 39.9, 'donas_09', 4),
(24, 'Paquete de 6 Donas', 69.9, 'donas_10', 4),
(25, 'Paquete de 3 Variadas', 39.9, 'donas_11', 4),
(26, 'Dona Natural con Chocolate', 19.9, 'donas_12', 4),
(27, 'Paquete de 3 Donas de Chocolate con Chispas', 39.9, 'donas_13', 4),
(28, 'Dona Chocolate y Coco', 19.9, 'donas_14', 4),
(29, 'Paquete Galletas de Chocolate', 29.9, 'galletas_01', 6),
(30, 'Paquete Galletas de Chocolate y Avena', 39.9, 'galletas_02', 6),
(31, 'Paquete de Muffins de Vainilla', 39.9, 'galletas_03', 6),
(32, 'Paquete de 4 Galletas de Avena', 24.9, 'galletas_04', 6),
(33, 'Galletas de Mantequilla Variadas', 39.9, 'galletas_05', 6),
(34, 'Galletas de sabores frutales', 39.9, 'galletas_06', 6),
(35, 'Hamburguesa Sencilla', 59.9, 'hamburguesas_01', 2),
(36, 'Hamburguesa de Pollo', 59.9, 'hamburguesas_02', 2),
(37, 'Hamburguesa de Pollo y Chili', 59.9, 'hamburguesas_03', 2),
(38, 'Hamburguesa Queso y  Pepinos', 59.9, 'hamburguesas_04', 2),
(39, 'Hamburguesa Cuarto de Libra', 59.9, 'hamburguesas_05', 2),
(40, 'Hamburguesa Doble Queso', 69.9, 'hamburguesas_06', 2),
(41, 'Hot Dog Especial', 49.9, 'hamburguesas_07', 2),
(42, 'Paquete 2 Hot Dogs', 69.9, 'hamburguesas_08', 2),
(43, '4 Rebanadas de Pay de Queso', 69.9, 'pastel_01', 5),
(44, 'Waffle Especial', 49.9, 'pastel_02', 5),
(45, 'Croissants De la casa', 39.9, 'pastel_03', 5),
(46, 'Pay de Queso', 19.9, 'pastel_04', 5),
(47, 'Pastel de Chocolate', 29.9, 'pastel_05', 5),
(48, 'Rebanada Pastel de Chocolate', 29.9, 'pastel_06', 5),
(49, 'Pizza Spicy con Doble Queso', 69.9, 'pizzas_01', 3),
(50, 'Pizza Jamón y Queso', 69.9, 'pizzas_02', 3),
(51, 'Pizza Doble Queso', 69.9, 'pizzas_03', 3),
(52, 'Pizza Especial de la Casa', 69.9, 'pizzas_04', 3),
(53, 'Pizza Chorizo', 69.9, 'pizzas_05', 3),
(54, 'Pizza Hawaiana', 69.9, 'pizzas_06', 3),
(55, 'Pizza Tocino', 69.9, 'pizzas_07', 3),
(56, 'Pizza Vegetales y Queso', 69.9, 'pizzas_08', 3),
(57, 'Pizza Pepperoni y Queso', 69.9, 'pizzas_09', 3),
(58, 'Pizza Aceitunas y Queso', 69.9, 'pizzas_10', 3),
(59, 'Pizza Queso, Jamón y Champiñones', 69.9, 'pizzas_11', 3);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
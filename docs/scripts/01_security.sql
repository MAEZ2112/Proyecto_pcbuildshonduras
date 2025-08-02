CREATE TABLE `usuario` (
    `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
    `useremail` varchar(80) DEFAULT NULL,
    `username` varchar(80) DEFAULT NULL,
    `userpswd` varchar(128) DEFAULT NULL, 
    `userfching` datetime DEFAULT NULL,
    `userpswdest` char(3) DEFAULT NULL,
    `userpswdexp` datetime DEFAULT NULL,
    `userest` char(3) DEFAULT NULL,
    `useractcod` varchar(128) DEFAULT NULL,
    `userpswdchg` varchar(128) DEFAULT NULL,
    `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
    PRIMARY KEY (`usercod`),
    UNIQUE KEY `useremail_UNIQUE` (`useremail`),
    KEY `usertipo` (
        `usertipo`,
        `useremail`,
        `usercod`,
        `userest`
    )
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE `roles` (
    `rolescod` varchar(128) NOT NULL,
    `rolesdsc` varchar(45) DEFAULT NULL,
    `rolesest` char(3) DEFAULT NULL,
    PRIMARY KEY (`rolescod`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `roles_usuarios` (
    `usercod` bigint(10) NOT NULL,
    `rolescod` varchar(128) NOT NULL,
    `roleuserest` char(3) DEFAULT NULL,
    `roleuserfch` datetime DEFAULT NULL,
    `roleuserexp` datetime DEFAULT NULL,
    PRIMARY KEY (`usercod`, `rolescod`),
    KEY `rol_usuario_key_idx` (`rolescod`),
    CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `funciones` (
    `fncod` varchar(255) NOT NULL,
    `fndsc` varchar(255) DEFAULT NULL,
    `fnest` char(3) DEFAULT NULL,
    `fntyp` char(3) DEFAULT NULL,
    PRIMARY KEY (`fncod`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `funciones_roles` (
    `rolescod` varchar(128) NOT NULL,
    `fncod` varchar(255) NOT NULL,
    `fnrolest` char(3) DEFAULT NULL,
    `fnexp` datetime DEFAULT NULL,
    PRIMARY KEY (`rolescod`, `fncod`),
    KEY `rol_funcion_key_idx` (`fncod`),
    CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--DATOS 
INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES

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
('Controllers\\Admin\\Orders\\Pedidos', 'Manejo de Pedidos', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Pedido', 'Manejo de Pedidos', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Envios', 'Manejo de Envios', 'ACT', 'CTR'),
('Controllers\\Admin\\Orders\\Envio', 'Manejo de Envios', 'ACT', 'CTR'),
('Menu_Admin_Pedidos', 'Menu_Pedidos', 'ACT', 'MNU'),
('Menu_Admin_Envios', 'Menu_Envios', 'ACT', 'MNU'),
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
('Menu_Admin_Funciones', 'Entrada del menú para administrar funciones', 'ACT', 'MNU'),
('Menu_Admin_FuncionesRoles', 'Entrada del menú para administrar funciones y roles', 'ACT', 'MNU'),
('Menu_Admin_Marcas', 'Entrada del menú para administrar marcas', 'ACT', 'MNU'),
('Menu_Admin_Products', 'Entrada del menú para administrar productos', 'ACT', 'MNU'),
('Menu_Admin_Roles', 'Entrada del menú para administrar roles', 'ACT', 'MNU'),
('Menu_Admin_RolesUsuario', 'Entrada del menú para roles por usuario', 'ACT', 'MNU'),
('Menu_Admin_Usuarios', 'Entrada del menú para administrar usuarios', 'ACT', 'MNU'),
('Menu_OrdersHist', 'Entrada del menú para historial de pedidos', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Entrada del menú para checkout de pagos', 'ACT', 'MNU'),
('Menu_TransHist', 'Entrada del menú para historial de transacciones', 'ACT', 'MNU'),
('Menu_Admin_Transactions', 'Entrada del menú para historial de transacciones', 'ACT', 'MNU'),
('Controllers\\Admin\\Transactions\\Transaction', 'Acceso al controlador de Transacción', 'ACT', 'CTR'),
('Controllers\\Admin\\Transactions\\Transactions', 'Permiso para ver listado de Transacciones', 'ACT', 'CTR');

INSERT INTO
    `roles` (
        `rolescod`,
        `rolesdsc`,
        `rolesest`
    )
VALUES (
        'ADMIN',
        'Administrador',
        'ACT'
    ),
    ('PBL', 'Cliente', 'ACT');


INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES

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
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\RolesUsuarios\\RolesUsuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Rol', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Roles\\Roles\\view', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuario', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\delete', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\new', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Usuarios\\Usuarios\\update', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Categorias', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Funciones', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_FuncionesRoles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Marcas', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Products', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Roles', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_RolesUsuario', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Usuarios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Envios', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_Admin_Pedidos', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Menu_TransHist', 'ACT', '2025-10-10 00:00:00'),
('PBL', 'Controllers\\Checkout\\Checkout', 'ACT', '2026-07-27 03:14:24'),
('PBL', 'Controllers\\Checkout\\History', 'ACT', '2026-07-27 03:14:24'),
('PBL', 'Controllers\\Checkout\\HistoryDetail', 'ACT', '2026-07-27 03:14:24'),
('ADMIN', 'Controllers\\Admin\\Transactions\\Transaction', 'ACT', '2025-10-10 00:00:00'),
('ADMIN', 'Controllers\\Admin\\Transactions\\Transactions', 'ACT', '2025-10-10 00:00:00');

INSERT into usuario
(usercod, useremail, username, userpswd, userfching, userpswdest, userpswdexp, userest, useractcod, userpswdchg, usertipo)
VALUES
(1, 'cuenta_admin123@gmail.com', 'Administrador', '$2y$10$ClmPPOlQ9PNu6up2Z6F49uAUdBfDrdlcOhraKKB7RhkKyoSYcYohG', '2025-07-31 14:16:43', 'ACT', '2025-10-29 00:00:00', 'ACT', '1574982ad95691c9318622069d6fc453e8f40b4a171833b2d4f11e80c8a9cede', '2025-07-31 14:16:43', 'PBL');
/*Contraseña es: Contra#123  */
INSERT into roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp)
VALUES (1, 'ADMIN', 'ACT', '2025-07-31 14:16:43', '2026-07-31 14:16:43');
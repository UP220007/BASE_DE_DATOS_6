USE `Verduleros`;

--
-- Table structure for table 'Grupos'
--

DROP TABLE IF EXISTS `Grupos`;

CREATE TABLE `Grupos` (
  `IdGrupo` INT NOT NULL AUTO_INCREMENT, 
  `Nombre` VARCHAR(50), 
  INDEX (`Nombre`), 
  PRIMARY KEY (`IdGrupo`)
);


--
-- Table structure for table 'Productos'
--

DROP TABLE IF EXISTS `Productos`;

CREATE TABLE `Productos` (
  `IdProducto` INT NOT NULL AUTO_INCREMENT, 
  `Nombre` VARCHAR(50), 
  `IdGrupo` INT NOT NULL,
  `Precio` DECIMAL(19,4) DEFAULT 0,
  PRIMARY KEY (`IdProducto`),
  INDEX (`IdProducto`), 
  INDEX (`IdGrupo`), 
  FOREIGN KEY (`IdGrupo`) REFERENCES `Grupos`(`IdGrupo`)
);


--
-- Table structure for table 'Vendedores'
--

DROP TABLE IF EXISTS `Vendedores`;

CREATE TABLE `Vendedores` (
  `IdVendedor` INT NOT NULL AUTO_INCREMENT, 
  `Nombre` VARCHAR(50) NOT NULL, 
  `Fecha_Alta` DATETIME, 
  `NIF` VARCHAR(9),
  CONSTRAINT `CHECK_NIF_LENGTH` CHECK (LENGTH(NIF) = 9), 
  `Fecha_Nacimiento` DATETIME, 
  `Población` VARCHAR(50) DEFAULT 'Barcelona', 
  `Estado_Civil` VARCHAR(15), 
  `Guapo` TINYINT(1),
  CONSTRAINT `CHECK_GUAPO` CHECK (`Guapo` IN (0, 1)),
  INDEX (`IdVendedor`),
  PRIMARY KEY (`IdVendedor`)
);


--
-- Table structure for table 'Ventas_Globales'
--

DROP TABLE IF EXISTS `Ventas_Globales`;

CREATE TABLE `Ventas_Globales` (
  `IdVendedor` INT NOT NULL, 
  `IdProducto` INT NOT NULL, 
  `Fecha` DATETIME, 
  `Kilos` DOUBLE,
  FOREIGN KEY (`IdVendedor`) REFERENCES `Vendedores`(`IdVendedor`),
  FOREIGN KEY (`IdProducto`) REFERENCES `Productos`(`IdProducto`)
);

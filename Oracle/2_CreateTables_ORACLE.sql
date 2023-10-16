--
-- Create sequences for generating primary key values
--

CREATE SEQUENCE Grupos_Sequencia START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Productos_Sequencia START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Vendedores_Sequencia START WITH 1 INCREMENT BY 1;

--
-- Table structure for table 'Grupos'
--

DROP TABLE Grupos;

CREATE TABLE Grupos (
  IdGrupo NUMBER(10) DEFAULT Grupos_Sequencia.NEXTVAL NOT NULL,
  Nombre VARCHAR2(50),
  CONSTRAINT PK_Grupos PRIMARY KEY (IdGrupo)
);


--
-- Table structure for table 'Productos'
--

DROP TABLE Productos;

CREATE TABLE Productos (
  IdProducto NUMBER(10) DEFAULT Productos_Sequencia.NEXTVAL NOT NULL,
  Nombre VARCHAR2(50),
  IdGrupo NUMBER(10) NOT NULL,
  Precio NUMBER(19, 4) DEFAULT 0,
  CONSTRAINT PK_Productos PRIMARY KEY (IdProducto),
  CONSTRAINT FK_Productos_Grupos FOREIGN KEY (IdGrupo) REFERENCES Grupos(IdGrupo)
);


--
-- Table structure for table 'Vendedores'
--

DROP TABLE Vendedores;

CREATE TABLE Vendedores (
  IdVendedor NUMBER(10) DEFAULT Vendedores_Sequencia.NEXTVAL NOT NULL,
  Nombre VARCHAR2(50) NOT NULL,
  Fecha_Alta DATE,
  NIF VARCHAR2(9),
  CONSTRAINT CHECK_NIF_LENGTH CHECK (LENGTH(NIF) = 9),
  Fecha_Nacimiento DATE,
  Poblacion VARCHAR2(50) DEFAULT 'Barcelona',
  Estado_Civil VARCHAR2(15),
  CONSTRAINT CHECK_ESTADO_CIVIL CHECK (Estado_Civil IN ('Arrejuntado', 'Casado', 'Divorciado', 'Separado', 'Soltero', 'Viudo')),
  Guapo NUMBER(1),
  CONSTRAINT CHECK_GUAPO CHECK (Guapo IN (0, 1)),
  CONSTRAINT PK_Vendedores PRIMARY KEY (IdVendedor)
);


--
-- Table structure for table 'Ventas_Globales'
--

DROP TABLE Ventas_Globales;

CREATE TABLE Ventas_Globales (
  IdVendedor NUMBER(10) NOT NULL,
  IdProducto NUMBER(10) NOT NULL,
  Fecha DATE,
  Kilos NUMBER,
  CONSTRAINT FK_Ventas_Globales_Vendedores FOREIGN KEY (IdVendedor) REFERENCES Vendedores(IdVendedor),
  CONSTRAINT FK_Ventas_Globales_Productos FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

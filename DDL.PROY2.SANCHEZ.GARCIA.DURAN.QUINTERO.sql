-- Drop existing tables if they exist
DROP TABLE IF EXISTS Tarjeta;
DROP TABLE IF EXISTS tipotarjetas;
DROP TABLE IF EXISTS Contrato;
DROP TABLE IF EXISTS Propiedad;
DROP TABLE IF EXISTS Agencia;
DROP TABLE IF EXISTS propietario;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS persona;
DROP TABLE IF EXISTS Interesados;
DROP TABLE IF EXISTS Servicio;

-- Create persona table
CREATE TABLE persona (
    Cedula VARCHAR(30) NOT NULL,
    Usuario VARCHAR2(30) NOT NULL, 
    Contrasena VARCHAR2(30) NOT NULL,
    Nombre VARCHAR2(30) NOT NULL, 
    Apellido VARCHAR2(30) NOT NULL,
    TpCuenta VARCHAR2(30),
    Correo VARCHAR2(30) NOT NULL, 
    PRIMARY KEY (Cedula)
);

-- Create cliente table
CREATE TABLE cliente (
    id VARCHAR(30) REFERENCES persona(Cedula),
    presupuesto NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES persona(Cedula)
);

-- Create propietario table
CREATE TABLE propietario (
    id VARCHAR(30) REFERENCES persona(Cedula),
    FOREIGN KEY (id) REFERENCES persona(Cedula)
);

-- Create Agencia table
CREATE TABLE Agencia (
    NombreAgencia VARCHAR2(30), 
    Agente VARCHAR2(30) REFERENCES persona(Usuario),
    CONSTRAINT Agencia PRIMARY KEY (NombreAgencia)
);

-- Create Propiedad table
CREATE TABLE Propiedad (
    ID NUMBER(20) NOT NULL, 
    Creacion DATE DEFAULT SYSTIMESTAMP,
    Estado VARCHAR2(10),
    Direccion VARCHAR2(30), 
    TipoPropiedad VARCHAR2(30),
    Cuartos NUMBER(2),
    Descripcion VARCHAR2(30), 
    valor NUMBER(30),
    UsuarioPropietario VARCHAR2(30) REFERENCES persona(Usuario),
    Administrador VARCHAR2(30) REFERENCES Agencia(NombreAgencia),
    CONSTRAINT Propiedad PRIMARY KEY (ID)
);              

-- Create Contrato table
CREATE TABLE Contrato (
    NContrato NUMBER(20) NOT NULL, 
    Arrendatario VARCHAR2(30) REFERENCES persona(Usuario),        
    Inmueble NUMBER(20) REFERENCES Propiedad(ID),
    NInquilinos NUMBER(5),
    CorreoFactura CHAR(30), 
    ValorTotalRenta NUMBER(5) DEFAULT 0, -- Más valor de propiedad más comisiones
    CONSTRAINT Contrato PRIMARY KEY (NContrato)
);

-- Create tipotarjetas table
CREATE TABLE tipotarjetas (
    Tipo VARCHAR2(20),
    CONSTRAINT tipotarjetas PRIMARY KEY (Tipo)
);

-- Create Tarjeta table
CREATE TABLE Tarjeta (
    contrato NUMBER(20) REFERENCES Contrato(NContrato),
    TipoTarjeta VARCHAR2(20) REFERENCES tipotarjetas(Tipo), 
    NumeroTarjeta NUMBER(16) NOT NULL,
    NombrePoseedor VARCHAR2(30), 
    Mes NUMBER(2), 
    Año NUMBER(4)
);

-- Create Interesados table
CREATE TABLE Interesados (
    ID NUMBER(20) NOT NULL, 
    Nombre VARCHAR2(20),
    ciudad VARCHAR2(20),
    Agencia VARCHAR2(30) REFERENCES Agencia(NombreAgencia), 
    rentaMaxima NUMBER(10),
    CONSTRAINT Interesados PRIMARY KEY (ID)
);

-- Create Servicio table
CREATE TABLE Servicio (
    ID NUMBER(20) NOT NULL, 
    Nombre VARCHAR2(20),
    CONSTRAINT Servicio PRIMARY KEY (ID)
);

-- Insert sample data into persona table
INSERT INTO persona (Cedula, Usuario, Contrasena, Nombre, Apellido, TpCuenta, Correo) 
VALUES 
('123456789', 'usuario1', 'pass123', 'Ana', 'Gómez', 'Ahorros', 'ana.gomez@mail.com'),
('987654321', 'usuario2', 'pass456', 'Luis', 'Martínez', 'Corriente', 'luis.martinez@mail.com'),
('456123789', 'usuario3', 'pass789', 'Carlos', 'Pérez', 'Ahorros', 'carlos.perez@mail.com');

-- Insert sample data into cliente table
INSERT INTO cliente (id, presupuesto) 
VALUES 
('123456789', 1000000),
('987654321', 2000000);

-- Insert sample data into propietario table
INSERT INTO propietario (id) 
VALUES 
('456123789');

-- Insert sample data into Agencia table
INSERT INTO Agencia (NombreAgencia, Agente) 
VALUES 
('Inmobiliaria XYZ', 'usuario1'),
('Agencia ABC', 'usuario2');

-- Insert sample data into Propiedad table
INSERT INTO Propiedad (ID, Creacion, Estado, Direccion, TipoPropiedad, Cuartos, Descripcion, valor, UsuarioPropietario, Administrador) 
VALUES 
(1, SYSDATE, 'Disponible', 'Calle 1 # 2-3', 'Apartamento', 3, 'Apartamento con vista al mar', 300000000, '456123789', 'Inmobiliaria XYZ'),
(2, SYSDATE, 'Disponible', 'Calle 4 # 5-6', 'Casa', 4, 'Casa con jardín', 500000000, '456123789', 'Agencia ABC');

-- Insert sample data into Contrato table
INSERT INTO Contrato (NContrato, Arrendatario, Inmueble, NInquilinos, CorreoFactura, ValorTotalRenta) 
VALUES 
(1, 'usuario1', 1, 2, 'factura1@mail.com', 3000000),
(2, 'usuario2', 2, 4, 'factura2@mail.com', 5000000);

-- Insert sample data into tipotarjetas table
INSERT INTO tipotarjetas (Tipo) 
VALUES 
('Debito'),
('Credito');

-- Insert sample data into Tarjeta table
INSERT INTO Tarjeta (contrato, TipoTarjeta, NumeroTarjeta, NombrePoseedor, Mes, Año) 
VALUES 
(1, 'Debito', 1234567812345678, 'Ana Gómez', 12, 2025),
(2, 'Credito', 9876543212345678, 'Luis Martínez', 11, 2024);

-- Insert sample data into Interesados table
INSERT INTO Interesados (ID, Nombre, ciudad, Agencia, rentaMaxima) 
VALUES 
(1, 'María López', 'Bogotá', 'Inmobiliaria XYZ', 2000000),
(2, 'Pedro Ruiz', 'Medellín', 'Agencia ABC', 3000000);

-- Insert sample data into Servicio table
INSERT INTO Servicio (ID, Nombre) 
VALUES 
(1, 'Mantenimiento'),
(2, 'Limpieza');

drop table persona;
drop table Agencia;
drop table Propiedad;
DROP table contrato;

Create table persona (
    Cedula varchar(30) not null,
    Usuario VARCHAR2(30) not null, 
    Contrasena VARCHAR2(30)  not null,
    Nombre VARCHAR2(30)  not null, 
    Apellido VARCHAR2(30)  not null,
    TpCuenta VARCHAR2(30)  ,
    Correo VARCHAR2(30)  not null , 
    PRIMARY KEY (Cedula)
);

create table cliente{
    id varchar(30) REFERENCES persona(Cedula),
    presupuesto number(20) not null,
    FOREIGN key (id)
};

create table propietario{
    id varchar(30) REFERENCES persona(Cedula),
    foreign key (id) 
};

Create Table Agencia(
    NombreAgencia VARCHAR2(30), 
    Agente VARCHAR2(30) REFERENCES  persona(Usuario),
    CONSTRAINT Agencia PRIMARY KEY (NombreAgencia)
);

     
Create table Propiedad (
    ID  number(20) not null, 
    Creacion DATE default systimestamp ,
    Estado VARCHAR2(10),
    Direccion VARCHAR2(30), 
    TipoPropiedad VARCHAR2(30),
    Cuartos number(2),
    Descripcion VARCHAR2(30), 
    valor number(30),
    UsuarioPropietario VARCHAR2(30) REFERENCES persona(Usuario),
    Administrador VARCHAR2(30) REFERENCES Agencia(NombreAgencia),
    CONSTRAINT Propiedad PRIMARY KEY (ID)
);              


Create Table Contrato (
    NContrato number(20) Not null, 
    Arrendatario VARCHAR2(30) REFERENCES persona(Usuario),        
    Inmueble number(20) REFERENCES Propiedad(ID),
    NInquilinos number (5),
    CorreoFactura char(30), 
    ValorTotalRenta number (5) default 0, -- Mas cvalor de propiedad mas comisiones, creo que una consulta que actualice y cree el valor
    CONSTRAINT Contrato PRIMARY KEY (NContrato),
    FOREIGN KEY (Inmueble Arrendatario)
);

create table tipotarjetas(
    Tipo VARCHAR2(20),
    CONSTRAINT tipotarjetas PRIMARY KEY (Tipo)

);

Create table Tarjeta (
    contrato number(20) REFERENCES Contrato(NContrato),
    TipoTarjeta VARCHAR2(20) REFERENCES tipotarjetas(Tipo), 
    NumeroTarjeta number(16) not null ,
    NombrePoseedor VARCHAR2 (30), 
    Mes number(2), 
    Año number(4)
);

Create table Interesados (
    ID number(20) not null , 
    Nombre  VARCHAR2(20),
    ciudad VARCHAR2(20),
    Agencia VARCHAR2(30) REFERENCES Agencia(NombreAgencia), 
    rentaMaxima number (10),
    CONSTRAINT Interesados PRIMARY KEY (ID)
);
Create table Servicio (
    ID number(20) not null , 
    Nombre  VARCHAR2(20),
    CONSTRAINT Interesados PRIMARY KEY (ID)
);
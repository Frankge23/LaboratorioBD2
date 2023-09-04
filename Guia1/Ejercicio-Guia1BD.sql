
--Guia 1 Terminada 

-- Crear la base de datos
CREATE DATABASE HotelBD2;
USE HotelBD2;

-- Creacion de las Tablas
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);


CREATE TABLE Habitaciones (
    HabitacionID INT PRIMARY KEY,
    NumeroHabitacion VARCHAR(10),
    TipoHabitacion VARCHAR(50),
    Capacidad INT,
    PrecioPorNoche DECIMAL(10, 2)
);


CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaContratacion DATE
);


CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY,
    ClienteID INT,
    HabitacionID INT,
    EmpleadoID INT, 
    FechaEntrada DATE,
    FechaSalida DATE,
    PrecioTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)  
);


CREATE TABLE Servicios (
    ServicioID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(50),
    Costo DECIMAL(10, 2)
);


CREATE TABLE ReservasServicios (
    ReservaID INT,
    ServicioID INT,
    PRIMARY KEY (ReservaID, ServicioID),
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);


CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY,
    ReservaID INT,
    Total DECIMAL(10, 2),
    FechaEmision DATE,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID)
);

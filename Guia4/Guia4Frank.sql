
CREATE DATABASE HotelFrank;
USE HotelFrank;

-- Creacion de las Tablas
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(50),
	Apellidos VARCHAR(50),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);

CREATE TABLE Habitaciones (
    HabitacionID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroHabitacion VARCHAR(10),
    TipoHabitacion VARCHAR(50),
    Capacidad INT,
    PrecioPorNoche DECIMAL(10, 2)
);

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(100),
	Apellidos VARCHAR(50),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaContratacion DATE
);

CREATE TABLE Reservas (
    ReservaID INT IDENTITY(1,1) PRIMARY KEY,
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
    ServicioID INT IDENTITY(1,1) PRIMARY KEY,
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
    FacturaID INT IDENTITY(1,1) PRIMARY KEY,
    ReservaID INT,
    Total DECIMAL(10, 2),
    FechaEmision DATE,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID)
);


-- Guia 4

declare @ClienteID int, @Nombres varchar(50), @Apellidos varchar(50), @Direccion varchar(200), @Telefono varchar(15);

declare ClienteCursor cursor for
    select ClienteID, Nombres, Apellidos, Direccion, Telefono
    from Clientes;

open ClienteCursor;

fetch next from ClienteCursor into @ClienteID, @Nombres, @Apellidos, @Direccion, @Telefono;

while @@FETCH_STATUS = 0
begin
    
    print 'ClienteID: ' + cast(@ClienteID as varchar(10)) + ', Nombres: ' + @Nombres + ', Apellidos: ' + @Apellidos + ', Direccion: ' + @Direccion + ', Telefono: ' + @Telefono;

    
    fetch next from ClienteCursor into @ClienteID, @Nombres, @Apellidos, @Direccion, @Telefono;
end

close ClienteCursor;
deallocate ClienteCursor;

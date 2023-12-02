
-- Guia 3

-- crear las tablas
create table Roles (
    RolID int identity(1,1) primary key,
    NombreRol varchar(50) unique
);

create table Usuarios (
    UsuarioID int identity(1,1) primary key,
    NombreUsuario varchar(50) unique,
    Contraseña varchar(50), 
    Activo bit,
    RolID int,
    foreign key (RolID) references Roles(RolID)
);

create table Opciones (
    OpcionID int identity(1,1) primary key,
    NombreOpcion varchar(50) unique
);

-- Creacion de logins, usuarios y roles
create login frank1 with password = 'F1234'; 
create user frank for login frank1;
alter role HotelFrank add member frank; 

grant select on dbo.Clientes to frank;

grant select on schema::dbo to frank;

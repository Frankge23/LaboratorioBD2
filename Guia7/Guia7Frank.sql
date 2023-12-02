
--Guia 7
create procedure insertar_cliente_con_reserva
    @nombres varchar(50),
    @apellidos varchar(50),
    @direccion varchar(200),
    @telefono varchar(15),
    @habitacionID int,
    @empleadoID int,
    @fechaEntrada date,
    @fechaSalida date
as
begin
    
    insert into Clientes (Nombres, Apellidos, Direccion, Telefono)
    values (@nombres, @apellidos, @direccion, @telefono);

    declare @clienteID int;
    set @clienteID = scope_identity();

    insert into Reservas (ClienteID, HabitacionID, EmpleadoID, FechaEntrada, FechaSalida, PrecioTotal)
    values (@clienteID, @habitacionID, @empleadoID, @fechaEntrada, @fechaSalida, 0); 

    print 'Operacion completada. Cliente y Reserva insertados.';
end;

create trigger trigger_insertar_cliente
on Clientes
after insert
as
begin
    declare @nombres varchar(50), @apellidos varchar(50), @direccion varchar(200), @telefono varchar(15);
    declare @habitacionID int, @empleadoID int, @fechaEntrada date, @fechaSalida date;

    select @nombres = Nombres, @apellidos = Apellidos, @direccion = Direccion, @telefono = Telefono
    from inserted;

    set @habitacionID = 1; 
    set @empleadoID = 1; 
    set @fechaEntrada = getdate();
    set @fechaSalida = dateadd(day, 7, @fechaEntrada); 

    exec insertar_cliente_con_reserva @nombres, @apellidos, @direccion, @telefono, @habitacionID, @empleadoID, @fechaEntrada, @fechaSalida;
end;


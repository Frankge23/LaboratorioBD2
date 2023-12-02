
--Guia 6
create procedure InsertarNuevoCliente (
    @Nombres varchar(50),
    @Apellidos varchar(50),
    @Direccion varchar(200),
    @Telefono varchar(15)
)
as
begin
    insert into Clientes (Nombres, Apellidos, Direccion, Telefono)
    values (@Nombres, @Apellidos, @Direccion, @Telefono);
end;

create procedure ConsultarClientesYReservas
as
begin
    select
        C.ClienteID,
        C.Nombres as ClienteNombres,
        C.Apellidos as ClienteApellidos,
        C.Direccion as ClienteDireccion,
        C.Telefono as ClienteTelefono,
        R.ReservaID,
        R.FechaEntrada,
        R.FechaSalida,
        R.PrecioTotal
    from
        Clientes C
    inner join
        Reservas R on C.ClienteID = R.ClienteID;
end;

exec InsertarNuevoCliente 'Juan', 'Perez', 'Calle 123', '7634-1234';

exec ConsultarClientesYReservas;

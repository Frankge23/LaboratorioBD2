
--Guia 9
create view Vista_Clientes_Facturas as
select
    C.ClienteID,
    C.Nombres as ClienteNombres,
    C.Apellidos as ClienteApellidos,
    C.Direccion as ClienteDireccion,
    C.Telefono as ClienteTelefono,
    F.FacturaID,
    F.Total,
    F.FechaEmision
from
    Clientes C
inner join
    Reservas R on C.ClienteID = R.ClienteID
inner join
    Facturas F on R.ReservaID = F.ReservaID;



-- Guia5
create function longitud_total(@ClienteID int)
returns int
as
begin
    declare @LongitudTotal int;

    select @LongitudTotal = len(Nombres) + len(Apellidos)
    from Clientes
    where ClienteID = @ClienteID;

    return @LongitudTotal;
end;

create function clientes_nombres_largos(@LongitudMinima int)
returns table
as
return (
    select ClienteID, Nombres, Apellidos
    from Clientes
    where len(Nombres) > @LongitudMinima
);
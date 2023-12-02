
--Guia 8
create sequence secuencia_facturas
    start with 1
    increment by 1
    minvalue 1
    maxvalue 1000000
    cycle;

alter table Facturas
drop column FacturaID;

alter table Facturas
add FacturaID int default (next value for secuencia_facturas) primary key;

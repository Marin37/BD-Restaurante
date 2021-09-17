DROP DATABASE IF EXISTS Restaurante;
create database Restaurante;
use Restaurante;

create table Proveedores (
CodProv int AUTO_INCREMENT,
Nombre varchar(20),
Tel varchar(25) not null unique,
Mail varchar (20) null,
Zona varchar (30) null,
constraint pk_Proveedores primary key(CodProv)
) AUTO_INCREMENT = 100;

insert into proveedores values (null,'jasdlfjdslf','afasf','asdsdaslkjfas@xd.com','aslaskfjsaf');

create table Comidas(
CodComida int AUTO_INCREMENT,
Nombre varchar(30),
Precio double,
Plato varchar (25) null, -- Plato Principal, Entrada, Postres
Tipo varchar(20) null, -- Carne, Pastas, Delicatessen 
Vegan boolean null, 
constraint pk_Comidas primary key(CodComida)
) AUTO_INCREMENT=300;

Create table Ingredientes(
CodIngre int AUTO_INCREMENT,
CodProv int unique,
Nombre varchar(25),
Categoria varchar(20),
constraint pk_Ingredientes primary key(CodIngre),
constraint fk_Ingredientes_CodProv foreign key(CodProv) references Proveedores(CodProv)
)AUTO_INCREMENT=100;

create table IngComida(
CodIngre int,
CodComida int,
constraint pk_IngComida primary key(CodIngre,CodComida),
constraint fk_IngComida_CodIngre foreign key (CodIngre) references Ingredientes (CodIngre),
constraint fk_IngComida_CodComida foreign key (CodComida) references Comidas (CodComida)
);

create table Bebidas (
CodBebida int AUTO_INCREMENT,
Nombre varchar (25),
Marca varchar(25) null,
Precio double,
Alchohol boolean null,
Gas boolean null,
constraint pk_Bebidas primary key(CodBebida)
)AUTO_INCREMENT=500;


create table Mesas (
NroMesa int AUTO_INCREMENT,
Maxclientes int null,
Ubicacion varchar(30),
Disponible boolean,
constraint pk_Mesas primary key(NroMesa)
)AUTO_INCREMENT=1;


create table MediosDePago (
CodMP int AUTO_INCREMENT,
Descripcion varchar(30),
RecargoDescuento float,
constraint pk_MediosDePago primary key(CodMP)
) AUTO_INCREMENT=1;


create table Cuentas (
NroCuenta int AUTO_INCREMENT,
MontoTotal double,
CodMP int,
Estado varchar(25),
NroMesa int unique,
constraint pk_Cuentas primary key(NroCuenta),
constraint fk_Cuentas_CodMP foreign key(CodMP) references MediosDePago(CodMP),
constraint fk_Cuentas_NroMesa foreign key(NroMesa) references Mesas(NroMesa)
)AUTO_INCREMENT=300;


create table DetBebidaPagos (
NroCuenta int unique,
CodBebida int unique,
Cantidad int,
constraint pk_DetBebidaPagos primary key(NroCuenta,CodBebida),
constraint fk_DetBebidaPagos_NroCuenta foreign key(NroCuenta) references Cuentas(NroCuenta),
constraint fk_DetBebidaPagos_CodBebida foreign key(CodBebida) references Bebidas(CodBebida)
);


create table DetComidaPagos(
NroCuenta int unique,
CodComida int unique,
Cantidad int,
constraint pk_DetComidaPagos primary key(NroCuenta,CodComida),
constraint fk_DetComidaPagos_NroCuenta foreign key (NroCuenta) references Cuentas(NroCuenta),
constraint fk_DetComidaPagos_CodComida foreign key(CodComida) references Comidas(CodComida)
);


create table Reservas(
CodReserva int AUTO_INCREMENT,
NroMesa int,
Nombre varchar(20),
Apellido varchar(20) null,
Fechahora timestamp,
Tel varchar(30),
constraint pk_Reservas primary key(CodReserva),
constraint fk_Reservas_NroMesa foreign key(NroMesa) references Mesas(NroMesa)
)AUTO_INCREMENT=1000;


create table Pedidos(
CodPedido int AUTO_INCREMENT,
NroCuenta int unique,
Monto double,
Direccion varchar(25) unique,
FechaHoraPed timestamp,
FechaHoraAprox timestamp,
FechaHoraEntreg timestamp,
Estado varchar(20),
constraint pk_Pedidos primary key(CodPedido),
constraint fk_Pedidos_NroCuenta foreign key(NroCuenta) references Cuentas(NroCuenta)
)AUTO_INCREMENT=400;

create table Empleados (
CodEmp int AUTO_INCREMENT,
Nombre varchar(25), 
Apellido varchar (25),
TipoDoc varchar(4),
Documento varchar(12),
Tel varchar(25) unique,
Email varchar(25) unique,
Direccion varchar(30) unique,
Puesto varchar(20),
constraint pk_Empleados primary key (CodEmp)
);

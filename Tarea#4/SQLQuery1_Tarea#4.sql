

CREATE DATABASE Almacen;

USE Almacen;


/*Proveedor*/
CREATE TABLE Proveedor(
id_proveedor int primary key not null,
nombre varchar(100),
categoria varchar(100),
ciudad varchar(100)
);

INSERT INTO Proveedor values(01010, 'Carlos Mejia','Limpieza','Tegucigalpa');
INSERT INTO Proveedor values(01011, 'Franisco Tejada','Bebidas','San Pedro Sula');
INSERT INTO Proveedor values(01012, 'Alejandra Albeño','Hogar','Tegucigalpa');
INSERT INTO Proveedor values(01013, 'Diego Santos','Helados','Comayagua');
INSERT INTO Proveedor values(01014, 'Alenadro Matute','Snacks','Tegucigalpa');
INSERT INTO Proveedor values(01015, 'Oscar Mejia','Verduras','Juticalpa');

SELECT * FROM Proveedor;


/*Producto*/
CREATE TABLE Producto(
id_producto int primary key not null,
descripcion varchar(250),
ciudad varchar(100),
precio float 
);

INSERT INTO Producto VALUES(1234,'Jabon Liquido','Tegucigalpa', 58.00);
INSERT INTO Producto VALUES(1235,'Refresco en lata','San Predro Sula', 18.50);
INSERT INTO Producto VALUES(1236,'Recogedor de Basura','Tegucigalpa', 59.00);
INSERT INTO Producto VALUES(1237,'Ice Cream Fresa','Comayagua', 67.25);
INSERT INTO Producto VALUES(1238,'Doritos con Chile','Tegucigalpa', 25.00);
INSERT INTO Producto VALUES(1239,'Cebollas','Juticalpa', 16.00);

SELECT * FROM Producto;


/*Cliente*/
CREATE TABLE Cliente(
id_cliente int primary key not null identity (1,1),
nombre varchar(100),
ciudad varchar(100)
);

INSERT INTO Cliente VALUES('Jose Perez','Tegucigalpa');
INSERT INTO Cliente VALUES('Celeste Tejada','Tegucigalpa');
INSERT INTO Cliente VALUES('Michelle Herrera','Tegucigalpa');
INSERT INTO Cliente VALUES('Julia Romero','San Pedro Sula');
INSERT INTO Cliente VALUES('Karla Tejada','Tegucigalpa');
INSERT INTO Cliente VALUES('Pablo Neruda','San Pedro Sula');
I


SELECT * FROM Cliente;

/*Pedido*/
CREATE TABLE Pedido(
id_pedidos int primary key not null identity(1,1),
id_producto int foreign key references Producto(id_producto),
id_proveedor int foreign key references Proveedor(id_proveedor),
fecha_pedido varchar(100),
cantidad int,
precio_total int);

INSERT INTO Pedido VALUES(1234,01010,'10/10/2020',50,2900);
INSERT INTO Pedido VALUES(1235,01011,'12/10/2020',20,370);
INSERT INTO Pedido VALUES(1236,01012,'13/10/2020',10,590);
INSERT INTO Pedido VALUES(1237,01013,'14/10/2021',48,3228);
INSERT INTO Pedido VALUES(1238,01014,'15/10/2021',50,1250);
INSERT INTO Pedido VALUES(1239,01015,'16/10/2021',50,800);


SELECT * FROM Pedido;

/*Inventario*/
CREATE TABLE Invetario(
id_inventario int primary key not null,
id_producto int foreign key references Producto(id_producto),
fecha varchar(100),
cantidad int
);


INSERT INTO Invetario VALUES(1519, 1234, '10/10/2020',1000);
INSERT INTO Invetario VALUES(1520, 1235, '10/10/2020',1000);
INSERT INTO Invetario VALUES(1521, 1236, '10/10/2020',1000);
INSERT INTO Invetario VALUES(1522, 1237, '10/10/2020',1000);
INSERT INTO Invetario VALUES(1523, 1238, '10/10/2020',1000);
INSERT INTO Invetario VALUES(1524, 1239, '10/10/2020',1000);


SELECT * FROM Invetario;
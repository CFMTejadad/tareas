
USE Almacen;
GO
​/*​Ejercicio 1 
​Encontrar el id y nombre del proveedor que proveen el producto con 
​id=1 
​*/ 
​SELECT distinct​ id_proveedor, nombre,id_producto ​FROM​ Producto ​as​ p  
​inner join​ Proveedor ​as​ pv ​on​ ​p​.​id_producto​ ​=​ ​pv​.​id_proveedor​  
​where​ ​p​.​id_producto​=​1 
​​order by ProductID​
  


​/*​Ejercicio 2 
​Encontrar los clientes (nombre cliente) que realizaron pedidos de los 
​productos proveídos por el proveedor con id=1 
​*/ 
​SELECT​ ​C​.​nombre​ ​/​ id_cliente, pv.id_proveedor, pd.id_producto​/​ ​FROM​ Pedido p 
​inner join​ Cliente ​as​ C ​on​ ​p​.​id_cliente​ ​=​ ​C​.​id_cliente 
​inner join​ Proveedor ​as​ pv ​on​ ​p​.​id_proveedor​ ​=​ ​pv​.​id_proveedor 
​/​inner join Producto as pd on p.id_producto = pd.id_producto/ 
​where​ ​pv​.​id_proveedor​ ​=​ ​2​; 
  
​SELECT​ ​C​.​nombre​, ​C​.​ciudad​ ​FROM​ Pedido p  
​inner join​ Cliente ​as​ C ​on​ ​p​.​id_cliente​=​C​.​id_cliente​  
​inner join​ Proveedor ​as​ pv ​on​ ​p​.​id_proveedor​=​pv​.​id_proveedor 
​where​ ​p​.​id_proveedor​=​4​; 
  
  
  
  
  
  
  
​/*​Ejercicio 3 
​Encontrar los proveedores que suministran todos los productos cuyo 
​precio es mayor al precio promedio de los productos. 
​*/ 
​SELECT​ ​AVG​(precio),nombre ​From​ Producto ​inner join​ Proveedor 
​on​ id_producto ​=​ id_proveedor 
​group by​ nombre 
​having​ ​AVG​(precio) ​>​ ​120 
  
​/*​Ejercicio 4 
​Listar los proveedores a los cuales no se les haya solicitado ningún 
​producto 
​*/ 
  
​SELECT​  ​pv​.​id_proveedor​, ​pv​.​nombre​, ​pv​.​categoria​,​pv​.​ciudad​, ​pd​.​id_producto​ ​FROM​ Pedido p 
​inner join​ Proveedor ​as​ pv ​on​ ​p​.​id_proveedor​ ​=​ ​pv​.​id_proveedor 
​inner join​ Producto ​as​ pd ​on​ ​p​.​id_producto ​=​ ​pd​.​id_producto 
​where​ ​p​.​cantidad​ ​=​ ​0​; 
  
​/*​Ejercicio 5 
​Listar los nombres de los clientes que hayan pedido más de un 
​producto y que el precio sea mayor a 100 
​*/ 
​SELECT​  ​id_cliente​ , ​C​.​nombre​, ​pd​.​id_producto​, ​pd​.​precio​ ​FROM​ Pedido p 
​inner join​ Cliente ​as​ C ​on​ ​p​.​id_cliente​ ​=​ ​C​.​id_cliente 
​inner join​ Producto ​as​ pd ​on​ ​p​.​id_producto​ ​=​ ​pd​.​id_producto
​where​ ​p​.​cantidad​ ​>​ ​1​ ​and​ ​pd​.​precio​ ​>​ ​100​; 
  
  
  
​/*​Ejercicio 6 
​Listar la cantidad y el precio de cada producto que hayan sido pedido 
​por los clientes entre las fechas 01-01-2022 y 20-03-2022, se requiere 
​visualizar el nombre del cliente, el nombre del producto, nombre del 
​proveedor , cantidad y precio del producto 
​*/ 
  
​SELECT​  ​p​.​cantidad​ , ​pd​.​precio​ ,​C​.​nombre​, ​pd​.​descripcion​,​pd​.​precio​, ​pv​.​nombre​ ​FROM​ Pedido p 
​inner join​ Cliente ​as​ C ​on​ ​p​.​id_cliente​ ​=​ ​C​.​id_cliente 
​inner join​ Producto ​as​ pd ​on​ ​p​.​id_producto​=​ ​pd​.​id_producto
​inner join​ Proveedor ​as​ pv ​on​ ​p​.​id_proveedor​=​ ​pv​.​id_proveedor 
​/​where p.fecha_pedido like '%3-2022%'​/ 
​where​ ​p​.​fecha_pedido​ Between ​'​2022-01'and '2022-03'


​/*​Ejercicio 7 
​Listar los nombres de los clientes que hayan solicitado más de un 
​producto. 
​*/ 
​SELECT​  ​C​.​nombre​ ​​id_producto​ ​FROM​ Pedido p 
​inner join​ Cliente ​as​ C ​on​ ​p​.​id_cliente​ ​=​ ​C​.​id_cliente 
​/​inner join Producto as pd on p.id_producto = pd.id_pro​ducto/ 
​where​ ​p​.​cantidad​ ​>​ ​1 
​group by​ ​C​.​nombre
/*Ejercicio 4
Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS public.pedidos(
	id SERIAL PRIMARY KEY,
	id_usuario INT,
	id_producto INT,
	FOREIGN KEY (id_usuario) REFERENCES public.usuarios,
	FOREIGN KEY (id_producto) REFERENCES public.productos
);
/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/
INSERT INTO public.pedidos(id_usuario, id_producto)
VALUES (1,1), (1,3), (3,2), (3,7), (2,5);
/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT u.nombre, COALESCE(p.nombre,'sin pedido') FROM public.usuarios u
LEFT JOIN public.productos p
ON u.id = p.id;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/
SELECT u.nombre FROM public.usuarios u
LEFT JOIN public.productos p
ON u.id = p.id;
/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE public.pedidos
ADD cantidad INT;
UPDATE public.pedidos
SET cantidad = 0
WHERE cantidad IS NULL;
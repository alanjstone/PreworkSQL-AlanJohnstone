/*Ejercicio 3
Nivel de dificultad: Difícil
1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS public.productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
);
/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos(nombre, precio)
VALUES ('camiseta', 15),('vaquero',25),('mallas', 35),('chaqueta',57) ,('chandal',18),('cazadora', 63),('short',7);
/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio = 19
WHERE precio < 10;
/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM public.productos WHERE id = 4;
/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/
SELECT n.nombre, p.nombre FROM public.usuarios n
INNER JOIN public.productos p
ON n.id = p.id;
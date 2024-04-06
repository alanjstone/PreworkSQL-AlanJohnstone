/*Ejercicio 2
Nivel de dificultad: Fácil
1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE IF NOT EXISTS MiBaseDeDatos;
/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS public.usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
);
/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios(nombre, edad)
VALUES('Juan', 45), ('Maria',28);
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad = 29
WHERE nombre = 'Maria';
/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios WHERE id = 1;
/*Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS public.ciudades(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
);
/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO public.ciudades (nombre, pais)
VALUES('Paris', 'Francia'), ('Madrid', 'España'), ('Roma', 'Italia');
/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/
ALTER TABLE public.usuarios
ADD CONSTRAINT origen FOREIGN KEY (id)
REFERENCES public.ciudades(id);
/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT u.nombre, c.nombre, c.pais FROM public.usuarios u
LEFT JOIN public.ciudades c
ON u.id = c.id;
/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
SELECT u.nombre, c.nombre, c.pais FROM public.usuarios u
INNER JOIN public.ciudades c
ON u.id = c.id
WHERE c.nombre IS NOT NULL;
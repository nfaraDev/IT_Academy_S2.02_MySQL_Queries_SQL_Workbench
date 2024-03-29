SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo = 2;
SELECT p.nombre AS 'nombre producto', p.precio, f.nombre AS 'nombre fabricante'FROM producto p JOIN fabricante f ON p. codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.codigo_fabricante, f.nombre AS nombre_fabrica FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo, f.nombre;
SELECT f.nombre AS nomre_fabricant, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre AS nombre_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre AS nombre_producto FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1;
SELECT nombre AS nombre_producto FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio ASC LIMIT 1;
SELECT a.nombre AS NombreAsignatura, ce.anyo_inicio AS AnyoInicio, ce.anyo_fin AS AnyoFin FROM persona P JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar ce ON m.id_curso_escolar = ce.id JOIN asignatura a ON m.id_asignatura = a.id WHERE p.nif = '48375418D';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Trabajo Social' AND d.id IN (SELECT DISTINCT id_departamento FROM profesor);
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar ce ON m.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2004 AND ce.anyo_fin = 2008;
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY nombre_departamento, p.apellido1, p.apellido2, p.nombre;
SELECT * FROM profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.id IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
SELECT * FROM profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT * FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos_1983 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1983;
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_profesores FROM departamento d INNER JOIN profesor pr ON d.id = pr.id_departamento INNER JOIN persona p ON pr.id_profesor = p.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona p ON pr.id_profesor = p.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;
SELECT g.nombre AS grado, COUNT(a.id) AS cantidad_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY cantidad_asignaturas DESC;
SELECT g.nombre AS grado, COUNT(a.id) AS cantidad_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING cantidad_asignaturas > 40 ORDER BY cantidad_asignaturas DESC;
SELECT g.nombre AS grado, a.tipo, SUM(a.creditos) AS suma_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(ama.id_alumno) AS cantidad_alumnos FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS cantidad_asignaturas FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY cantidad_asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento ASC LIMIT 1;
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;


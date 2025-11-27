SELECT * FROM clientes;

SELECT * FROM entrenadores WHERE especialidad = 'Yoga';

SELECT nombreClase, capacidadMax FROM clases WHERE capacidadMax > 20;

SELECT diaSemana, id_sede FROM horarios WHERE id_entrenador = 3;

SELECT * FROM clientes ORDER BY id_cliente DESC;

SELECT clientes.nombre, reservas.fechaReserva
FROM reservas
INNER JOIN clientes ON reservas.id_cliente = clientes.id_cliente
WHERE reservas.estado = 'confirmada';

SELECT entrenadores.nombreEntrenador, clases.nombreClase
FROM horarios
INNER JOIN entrenadores ON horarios.id_entrenador = entrenadores.id_entrenador
INNER JOIN clases ON horarios.id_clase = clases.id_clase


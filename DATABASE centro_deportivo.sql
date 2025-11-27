CREATE DATABASE centro_deportivo;

USE centro_deportivo;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(30) UNIQUE,
    fechaInscripcion DATE NOT NULL
);

CREATE TABLE sedes (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombreSede VARCHAR(20) NOT NULL,
    direccion VARCHAR(15) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE entrenadores (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombreEntrenador VARCHAR(50) NOT NULL,
    especialidad VARCHAR(20) NOT NULL,
    tarifaHora DECIMAL(6,2) NOT NULL
);

CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombreClase VARCHAR(20) NOT NULL,
    capacidadMax INT NOT NULL
);

CREATE TABLE horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    diaSemana VARCHAR(10) NOT NULL,
    id_clase INT,
    id_sede INT,
    id_entrenador INT,
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede),
    FOREIGN KEY (id_entrenador) REFERENCES entrenadores(id_entrenador)
);

CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    fechaReserva DATE NOT NULL,
    estado VARCHAR(10) NOT NULL,
    id_cliente INT,
    id_horario INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario)
);

CREATE TABLE membresias (
    id_membresia INT AUTO_INCREMENT PRIMARY KEY,
    tipoMembresia VARCHAR(20) NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    DuracionDias INT NOT NULL
);

CREATE TABLE contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    id_cliente INT,
    id_membresia INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_membresia) REFERENCES membresias(id_membresia)
);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(7,2) NOT NULL,
    fechaPago DATE NOT NULL,
    id_contrato INT,
    FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato)
);



INSERT INTO clientes (nombre, email, fechaInscripcion) VALUES
('Juan Perez', 'juan@email.com', '2024-01-15'),
('Maria Gomez', 'maria@email.com', '2024-02-20'),
('Luis Rodriguez', 'luis@email.com', '2024-03-10'),
('Ana Martinez', 'ana@email.com', '2024-04-05'),
('Carlos Sanchez', 'carlos@email.com', '2024-05-12');

INSERT INTO sedes (nombreSede, direccion, id_cliente) VALUES
('Sede Central', 'Calle 123', 1),
('Sede Norte', 'Avenida 456', 2),
('Sede Sur', 'Boulevard 789', 3);

INSERT INTO entrenadores (nombreEntrenador, especialidad, tarifaHora) VALUES
('Pedro Lopez', 'Yoga', 30.00),
('Sofia Ramirez', 'Pilates', 35.00),
('Miguel Torres', 'Crossfit', 40.00),
('Laura Fernandez', 'Zumba', 25.00),
('Jorge Diaz', 'Spinning', 28.00);

INSERT INTO clases (nombreClase, capacidadMax) VALUES
('Yoga', 20),
('Pilates', 15),
('Crossfit', 25),
('Zumba', 30),
('Spinning', 18);

INSERT INTO horarios (diaSemana, id_clase, id_sede, id_entrenador) VALUES
('Lunes', 1, 1, 1),
('Martes', 2, 2, 2),
('Miercoles', 3, 3, 3),
('Jueves', 4, 1, 4),
('Viernes', 5, 2, 5);

INSERT INTO reservas (fechaReserva, estado, id_cliente, id_horario) VALUES
('2024-06-01', 'Confirmada', 1, 1),
('2024-06-02', 'Pendiente', 2, 2),
('2024-06-03', 'Cancelada', 3, 3),
('2024-06-04', 'Confirmada', 4, 4),
('2024-06-05', 'Pendiente', 5, 5);

INSERT INTO membresias (tipoMembresia, precio, DuracionDias) VALUES
('Mensual', 50.00, 30),
('Trimestral', 135.00, 90),
('Anual', 480.00, 365);

INSERT INTO contratos (fechaInicio, fechaFin, id_cliente, id_membresia) VALUES
('2024-01-15', '2024-02-14', 1, 1),
('2024-02-20', '2024-05-19', 2, 2),
('2024-03-10', '2025-03-09', 3, 3),
('2024-04-05', '2024-05-04', 4, 1),
('2024-05-12', '2024-08-10', 5, 2);

INSERT INTO pagos (monto, fechaPago, id_contrato) VALUES
(50.00, '2024-01-15', 1),
(135.00, '2024-02-20', 2),
(480.00, '2024-03-10', 3),
(50.00, '2024-04-05', 4),
(135.00, '2024-05-12', 5);
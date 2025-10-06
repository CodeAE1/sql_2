-- -----------------------------------------------------
-- Creación del esquema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS biblioteca;
USE biblioteca;

-- -----------------------------------------------------
-- Tabla para los autores
-- -----------------------------------------------------
CREATE TABLE Autores (
  id_autor INT NOT NULL AUTO_INCREMENT,
  nombre_autor VARCHAR(100) NOT NULL,
  apellido_autor VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_autor)
);

-- -----------------------------------------------------
-- Tabla para los usuarios (lectores)
-- -----------------------------------------------------
CREATE TABLE Usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_usuario)
);

-- -----------------------------------------------------
-- Tabla para las editoriales
-- -----------------------------------------------------
CREATE TABLE Editoriales (
  id_editorial INT NOT NULL AUTO_INCREMENT,
  nombre_editorial VARCHAR(100) NOT NULL,
  ciudad_editorial VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_editorial)
);

-- -----------------------------------------------------
-- Tabla para los libros
-- -----------------------------------------------------
CREATE TABLE Libros (
  id_libro INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  genero VARCHAR(50) NOT NULL,
  disponibilidad BOOLEAN NOT NULL,
  id_editorial INT NOT NULL,
  PRIMARY KEY (id_libro),
  FOREIGN KEY (id_editorial) REFERENCES Editoriales (id_editorial)
);

-- -----------------------------------------------------
-- Tabla de unión para la relación muchos a muchos entre autores y libros
-- -----------------------------------------------------
CREATE TABLE Autores_Libros (
  id_autor_libro INT NOT NULL AUTO_INCREMENT,
  id_autor INT NOT NULL,
  id_libro INT NOT NULL,
  PRIMARY KEY (id_autor_libro),
  FOREIGN KEY (id_autor) REFERENCES Autores (id_autor),
  FOREIGN KEY (id_libro) REFERENCES Libros (id_libro)
);

-- -----------------------------------------------------
-- Tabla para los préstamos de libros
-- -----------------------------------------------------
CREATE TABLE Prestamos (
  id_prestamo INT NOT NULL AUTO_INCREMENT,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion_estimada DATE NOT NULL,
  fecha_devolucion_real DATE,
  estado_prestamo VARCHAR(20) NOT NULL,
  id_usuario INT NOT NULL,
  id_libro INT NOT NULL,
  PRIMARY KEY (id_prestamo),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario),
  FOREIGN KEY (id_libro) REFERENCES Libros (id_libro)
);

-- -----------------------------------------------------
-- Inserción de datos en Autores (20 registros)
-- -----------------------------------------------------
INSERT INTO Autores (nombre_autor, apellido_autor, nacionalidad) VALUES
('Miguel', 'de Cervantes', 'Española'),
('Gabriel', 'García Márquez', 'Colombiana'),
('Isabel', 'Allende', 'Chilena'),
('Jorge Luis', 'Borges', 'Argentina'),
('Mario', 'Vargas Llosa', 'Peruana'),
('Pablo', 'Neruda', 'Chilena'),
('Octavio', 'Paz', 'Mexicana'),
('Clarice', 'Lispector', 'Brasileña'),
('Julio', 'Cortázar', 'Argentina'),
('Laura', 'Esquivel', 'Mexicana'),
('Juan Rulfo', 'González', 'Mexicana'),
('Carlos Fuentes', 'Macías', 'Mexicana'),
('Mario Benedetti', 'Moraes', 'Uruguaya'),
('Antonio', 'Skármeta', 'Chilena'),
('Roberto', 'Bolaño', 'Chilena'),
('Paulo', 'Coelho', 'Brasileña'),
('Luisa', 'Valenzuela', 'Argentina'),
('Eduardo', 'Galeano', 'Uruguaya'),
('Fernando', 'Pessoa', 'Portuguesa'),
('José Saramago', 'de Carvalho', 'Portuguesa');

-- -----------------------------------------------------
-- Inserción de datos en Editoriales (20 registros)
-- -----------------------------------------------------
INSERT INTO Editoriales (nombre_editorial, ciudad_editorial) VALUES
('Planeta', 'Madrid'),
('Santillana', 'Buenos Aires'),
('Penguin Random House', 'México'),
('Alfaguara', 'Madrid'),
('Anaya', 'Madrid'),
('McGraw-Hill', 'Bogotá'),
('Norma', 'Bogotá'),
('Sudamericana', 'Buenos Aires'),
('Fondo de Cultura Económica', 'México'),
('Tusquets', 'Barcelona'),
('Ediciones B', 'Barcelona'),
('Galaxia Gutenberg', 'Barcelona'),
('Siruela', 'Madrid'),
('Kairós', 'Barcelona'),
('Pre-Textos', 'Valencia'),
('Acantilado', 'Barcelona'),
('Visor', 'Madrid'),
('Renacimiento', 'Sevilla'),
('Iberoamericana Vervuert', 'Madrid'),
('Editorial Universidad de Guadalajara', 'Guadalajara');

-- -----------------------------------------------------
-- Inserción de datos en Libros (20 registros)
-- -----------------------------------------------------
INSERT INTO Libros (titulo, fecha_publicacion, genero, disponibilidad, id_editorial) VALUES
('Don Quijote de la Mancha', '1605-01-16', 'Novela', true, 1),
('Cien años de soledad', '1967-05-30', 'Realismo Mágico', true, 2),
('La casa de los espíritus', '1982-09-17', 'Realismo Mágico', false, 3),
('Ficciones', '1944-01-01', 'Ficción', true, 4),
('La ciudad y los perros', '1963-01-01', 'Novela', true, 5),
('Veinte poemas de amor y una canción desesperada', '1924-01-01', 'Poesía', true, 6),
('El laberinto de la soledad', '1950-01-01', 'Ensayo', true, 7),
('La pasión según G.H.', '1964-01-01', 'Novela', false, 8),
('Rayuela', '1963-06-28', 'Novela', true, 9),
('Como agua para chocolate', '1989-01-01', 'Novela', true, 10),
('Pedro Páramo', '1955-01-01', 'Novela', true, 11),
('La muerte de Artemio Cruz', '1962-01-01', 'Novela', true, 12),
('La tregua', '1960-01-01', 'Novela', true, 13),
('La historia oficial', '1985-01-01', 'Cuento', true, 14),
('2666', '2004-01-01', 'Novela', true, 15),
('El alquimista', '1988-01-01', 'Ficción', true, 16),
('La casa de Adela', '1993-01-01', 'Novela', true, 17),
('El libro de los abrazos', '1989-01-01', 'Ensayo', true, 18),
('El nombre de la rosa', '1980-01-01', 'Novela', true, 19),
('Memorial del engaño', '1992-01-01', 'Novela', true, 20);

-- -----------------------------------------------------
-- Inserción de datos en Autores_Libros (20 registros)
-- -----------------------------------------------------
INSERT INTO Autores_Libros (id_autor, id_libro) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- -----------------------------------------------------
-- Inserción de datos en Usuarios (20 registros)
-- -----------------------------------------------------
INSERT INTO Usuarios (nombre, apellido, direccion, telefono, correo_electronico) VALUES
('Ana', 'Gómez', 'Calle 123', '123456789', 'ana@example.com'),
('Luis', 'Pérez', 'Avenida Siempre Viva 742', '987654321', 'luis@example.com'),
('María', 'Rodríguez', 'Carrera 45 #12-34', '456789123', 'maria@example.com'),
('Carlos', 'López', 'Calle 8 #10-20', '321654987', 'carlos@example.com'),
('Sofía', 'Martínez', 'Calle 9 #11-15', '654987321', 'sofia@example.com'),
('Andrés', 'Hernández', 'Diagonal 50 #20-10', '789123456', 'andres@example.com'),
('Valentina', 'Díaz', 'Transversal 30 #40-50', '147258369', 'valentina@example.com'),
('Sebastián', 'Ruiz', 'Calle 25 #35-45', '258369147', 'sebastian@example.com'),
('Camila', 'Jiménez', 'Avenida 68 #78-89', '369147258', 'camila@example.com'),
('Daniel', 'Torres', 'Carrera 15 #25-35', '159357486', 'daniel@example.com'),
('Fernanda', 'Silva', 'Calle 100 #200-300', '123987456', 'fernanda@example.com'),
('Pedro', 'García', 'Avenida Central 500', '456123789', 'pedro@example.com'),
('Lucía', 'Mendoza', 'Calle Luna 45', '789456123', 'lucia@example.com'),
('Diego', 'Castro', 'Carrera 30 #40-50', '321789456', 'diego@example.com'),
('Paula', 'Rojas', 'Calle Sol 12', '654321987', 'paula@example.com'),
('Javier', 'Flores', 'Diagonal 100 #200', '987654321', 'javier@example.com'),
('Sara', 'Romero', 'Calle 50 #60-70', '147258369', 'sara@example.com'),
('Tomás', 'Vega', 'Avenida 9 de Julio 1000', '258369147', 'tomas@example.com'),
('Clara', 'Paredes', 'Calle 200 #300-400', '369147258', 'clara@example.com'),
('Miguel', 'Santos', 'Carrera 50 #60-70', '159357486', 'miguel@example.com');

-- -----------------------------------------------------
-- Inserción de datos en Prestamos (20 registros)
-- -----------------------------------------------------
INSERT INTO Prestamos (fecha_prestamo, fecha_devolucion_estimada, fecha_devolucion_real, estado_prestamo, id_usuario, id_libro) VALUES
('2024-01-10', '2024-01-24', '2024-01-23', 'Devuelto', 1, 2),
('2024-02-01', '2024-02-15', NULL, 'Pendiente', 2, 3),
('2024-02-10', '2024-02-24', '2024-02-25', 'Devuelto', 3, 4),
('2024-03-01', '2024-03-15', NULL, 'Pendiente', 4, 5),
('2024-03-10', '2024-03-24', NULL, 'Pendiente', 5, 6),
('2024-04-01', '2024-04-15', '2024-04-14', 'Devuelto', 6, 7),
('2024-04-10', '2024-04-24', NULL, 'Pendiente', 7, 8),
('2024-05-01', '2024-05-15', NULL, 'Pendiente', 8, 9),
('2024-05-10', '2024-05-24', NULL, 'Pendiente', 9, 10),
('2024-06-01', '2024-06-15', NULL, 'Pendiente', 10, 1),
('2024-06-05', '2024-06-19', '2024-06-18', 'Devuelto', 11, 11),
('2024-06-10', '2024-06-24', NULL, 'Pendiente', 12, 12),
('2024-06-15', '2024-06-29', NULL, 'Pendiente', 13, 13),
('2024-07-01', '2024-07-15', '2024-07-14', 'Devuelto', 14, 14),
('2024-07-05', '2024-07-19', NULL, 'Pendiente', 15, 15),
('2024-07-10', '2024-07-24', NULL, 'Pendiente', 16, 16),
('2024-07-15', '2024-07-29', '2024-07-28', 'Devuelto', 17, 17),
('2024-08-01', '2024-08-15', NULL, 'Pendiente', 18, 18),
('2024-08-05', '2024-08-19', NULL, 'Pendiente', 19, 19),
('2024-08-10', '2024-08-24', NULL, 'Pendiente', 20, 20);

-- -----------------------------------------------------
-- Creación de vistas
-- -----------------------------------------------------

-- Vista 1: Libros disponibles
CREATE VIEW v_libros_disponibles AS
SELECT l.titulo, e.nombre_editorial, l.genero, l.disponibilidad
FROM Libros l
JOIN Editoriales e ON l.id_editorial = e.id_editorial
WHERE l.disponibilidad = true;

-- Vista 2: Préstamos activos
CREATE VIEW v_prestamos_activos AS
SELECT u.nombre, u.apellido, l.titulo, p.fecha_prestamo, p.fecha_devolucion_estimada
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Libros l ON p.id_libro = l.id_libro
WHERE p.fecha_devolucion_real IS NULL;

-- Vista 3: Historial de préstamos por usuario
CREATE VIEW v_historial_prestamos_usuario AS
SELECT u.nombre, u.apellido, l.titulo, p.fecha_prestamo, p.fecha_devolucion_real, p.estado_prestamo
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Libros l ON p.id_libro = l.id_libro;

-- Vista 4: Autores con libros publicados
CREATE VIEW v_autores_libros AS
SELECT a.nombre_autor, a.apellido_autor, l.titulo
FROM Autores_Libros al
JOIN Autores a ON al.id_autor = a.id_autor
JOIN Libros l ON al.id_libro = l.id_libro;

-- -----------------------------------------------------
-- Creación de funciones
-- -----------------------------------------------------

DELIMITER $$
CREATE FUNCTION fn_calcular_dias_retraso(fecha_real DATE, fecha_estimada DATE)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE dias INT DEFAULT 0;
    IF fecha_real IS NOT NULL AND fecha_real > fecha_estimada THEN
        SET dias = DATEDIFF(fecha_real, fecha_estimada);
    END IF;
    RETURN dias;
END$$

CREATE FUNCTION fn_total_prestamos_usuario(id_usuario INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    SELECT COUNT(*) INTO total FROM Prestamos WHERE id_usuario = id_usuario;
    RETURN total;
END$$

CREATE FUNCTION fn_libros_por_genero(genero VARCHAR(50))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    SELECT COUNT(*) INTO total FROM Libros WHERE genero = genero;
    RETURN total;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- Creación de stored procedures
-- -----------------------------------------------------

DELIMITER $$
CREATE PROCEDURE sp_registrar_prestamo(
    IN p_id_usuario INT,
    IN p_id_libro INT,
    IN p_fecha_prestamo DATE,
    IN p_fecha_devolucion_estimada DATE
)
BEGIN
    UPDATE Libros SET disponibilidad = false WHERE id_libro = p_id_libro;
    INSERT INTO Prestamos (fecha_prestamo, fecha_devolucion_estimada, estado_prestamo, id_usuario, id_libro)
    VALUES (p_fecha_prestamo, p_fecha_devolucion_estimada, 'Pendiente', p_id_usuario, p_id_libro);
    SELECT 'Préstamo registrado exitosamente' AS mensaje;
END$$

CREATE PROCEDURE sp_devolver_libro(
    IN p_id_prestamo INT,
    IN p_fecha_devolucion DATE
)
BEGIN
    UPDATE Prestamos SET fecha_devolucion_real = p_fecha_devolucion, estado_prestamo = 'Devuelto' WHERE id_prestamo = p_id_prestamo;
    UPDATE Libros SET disponibilidad = true WHERE id_libro = (SELECT id_libro FROM Prestamos WHERE id_prestamo = p_id_prestamo);
    SELECT 'Libro devuelto exitosamente' AS mensaje;
END$$

CREATE PROCEDURE sp_buscar_libros_por_genero(
    IN p_genero VARCHAR(50)
)
BEGIN
    SELECT * FROM Libros WHERE genero = p_genero;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- Creación de triggers
-- -----------------------------------------------------

DELIMITER $$
CREATE TRIGGER tr_actualizar_disponibilidad_libro
AFTER INSERT ON Prestamos
FOR EACH ROW
BEGIN
    UPDATE Libros SET disponibilidad = false WHERE id_libro = NEW.id_libro;
END$$

CREATE TRIGGER tr_actualizar_disponibilidad_devolucion
AFTER UPDATE ON Prestamos
FOR EACH ROW
BEGIN
    IF NEW.fecha_devolucion_real IS NOT NULL AND OLD.fecha_devolucion_real IS NULL THEN
        UPDATE Libros SET disponibilidad = true WHERE id_libro = NEW.id_libro;
    END IF;
END$$

CREATE TRIGGER tr_eliminar_libro_prestamo
BEFORE DELETE ON Libros
FOR EACH ROW
BEGIN
    DELETE FROM Prestamos WHERE id_libro = OLD.id_libro;
END$$

CREATE TRIGGER tr_actualizar_disponibilidad_libro_update
BEFORE UPDATE ON Libros
FOR EACH ROW
BEGIN
    IF OLD.disponibilidad = false AND NEW.disponibilidad = true THEN
        UPDATE Prestamos SET estado_prestamo = 'Devuelto' WHERE id_libro = NEW.id_libro AND estado_prestamo = 'Pendiente';
    END IF;
END$$
DELIMITER ;
-- Active: 1674045076073@@127.0.0.1@3306


-- Prática 2 - 1:M
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users(id, name, email, password)
VALUES
    ('u001', 'Fulano', 'fulano@email.com', 'fulano123'),
    ('u002', 'Ciclano', 'ciclano@email.com', 'ciclano123');

INSERT INTO phones(id, phone_number, user_id)
VALUES
    ('p001', '5521985968563', 'u001'),
    ('p002', '5511974253684', 'u002'),
    ('p003', '5524925896314', 'u002');

INSERT INTO phones(id, phone_number, user_id)
VALUES
    ('p004', '5551985968563', 'u003'); -- era pra dar erro

DELETE FROM phones
WHERE user_id = 'u003';

SELECT * FROM users;

SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-- Prática 3 - 1:1

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO licenses(id, register_number, category)
VALUES
    ('l001', '123456789', 'A'),
    ('l002', '987654321', 'B');

INSERT INTO drivers(id, name, email, password, license_id)
VALUES
    ('d001', 'Beltrano', 'beltrano@email.com', '123456', 'l001'),
    ('d002', 'Aline', 'aline@email.com', '321654', 'l002');

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

-- Fixação

-- 1:M Carros e marcas

CREATE TABLE car_brands(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE cars(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    brands_id TEXT NOT NULL,
    Foreign Key (brands_id) REFERENCES car_brands(id)
);

SELECT * FROM car_brands;

SELECT * FROM cars;

DROP TABLE cars;

INSERT INTO car_brands(id, name)
VALUES
    ('b001', 'Volkswagen'),
    ('b002', 'Renault'),
    ('b003', 'Toyota'),
    ('b004', 'Fiat'),
    ('b005', 'GM'),
    ('b006', 'Nissan');

INSERT INTO cars(id, name, category, brands_id)
VALUES
    ('c001', 'Gol', 'Hatch', 'b001'),
    ('c002', 'Frontier', 'Pick-up', 'b006'),
    ('c003', 'Logan', 'Sedan', 'b002'),
    ('c004', 'Cronos', 'Sedan', 'b004'),
    ('c005', 'Tracker', 'SUV', 'b005');

SELECT * FROM cars
INNER JOIN car_brands
ON cars.brands_id = car_brands.id;



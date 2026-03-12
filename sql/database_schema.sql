CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre TEXT,
    ciudad TEXT,
    segmento TEXT
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    producto TEXT,
    categoria TEXT,
    precio NUMERIC(10,2)
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    fecha DATE,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_producto INT REFERENCES productos(id_producto),
    vendedor TEXT,
    cantidad INT,
    canal TEXT
);

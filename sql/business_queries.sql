-- 1. total sales revenue
SELECT 
    SUM(v.cantidad * p.precio) AS ingresos_totales
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;

-- 2. revenue by category
SELECT 
    p.categoria,
    SUM(v.cantidad * p.precio) AS ingresos
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY p.categoria
ORDER BY ingresos DESC;

-- 3. top 5 customers by revenue
SELECT 
    c.nombre,
    SUM(v.cantidad * p.precio) AS ingresos
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY c.nombre
ORDER BY ingresos DESC
LIMIT 5;

-- 4. sales by seller
SELECT 
    v.vendedor,
    SUM(v.cantidad * p.precio) AS ingresos
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY v.vendedor
ORDER BY ingresos DESC;

-- 5. average ticket by customer
SELECT 
    c.nombre,
    ROUND(AVG(v.cantidad * p.precio), 2) AS ticket_promedio
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY c.nombre
ORDER BY ticket_promedio DESC;

-- 6. monthly sales trend
SELECT 
    DATE_TRUNC('month', v.fecha) AS mes,
    SUM(v.cantidad * p.precio) AS ingresos
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY mes
ORDER BY mes;

-- 7. product ranking by revenue
SELECT 
    p.producto,
    SUM(v.cantidad * p.precio) AS ingresos,
    RANK() OVER (ORDER BY SUM(v.cantidad * p.precio) DESC) AS ranking
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY p.producto;

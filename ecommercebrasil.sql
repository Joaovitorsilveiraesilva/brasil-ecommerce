Select *
From ecommercebrasil..olist_avaliacoes_pedido

---ticket médio por compra----

SELECT 
    AVG(payment_value) AS ticket_medio_por_compra
FROM (
    SELECT 
        order_id,
        SUM(payment_value) AS payment_value
    FROM 
        olist_pagamentos_pedido
    GROUP BY 
        order_id
) AS order_payments;

---ticket médio por categoria de produtos---

SELECT 
    p.product_category_name,
    AVG(o.payment_value / o.num_items) AS ticket_medio_por_categoria
FROM 
    olist_itens_pedido i
JOIN 
    olist_produtos p ON i.product_id = p.product_id
JOIN 
    (
        SELECT 
            oi.product_id,
            SUM(op.payment_value) AS payment_value,
            COUNT(oi.order_id) AS num_items
        FROM 
            olist_itens_pedido oi
        JOIN 
            olist_pagamentos_pedido op ON oi.order_id = op.order_id
        GROUP BY 
            oi.product_id
    ) AS o ON i.product_id = o.product_id
GROUP BY 
    p.product_category_name;


--- Onde está localizado os vendedores por proporção em porcentagem ---

SELECT 
    seller_state,
    COUNT(*) AS total_vendedores,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_vendedores), 2) AS proporcao_percentual
FROM 
    olist_vendedores
GROUP BY 
    seller_state
ORDER BY 
    proporcao_percentual DESC;

--- Onde está localizado os compradores por proporção ---

SELECT 
    customer_state,
    COUNT(*) AS total_compradores,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_clientes), 2) AS proporcao_percentual
FROM 
    olist_clientes
GROUP BY 
    customer_state
ORDER BY 
    proporcao_percentual DESC;

--- Qual a proporção de notas 5 , 4 , 3 ,2 , 1 em porcentagem ---

SELECT 
    review_score,
    COUNT(*) AS total_avaliacoes,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_avaliacoes_pedido), 2) AS proporcao_percentual
FROM 
    olist_avaliacoes_pedido
GROUP BY 
    review_score
ORDER BY 
    review_score;

--- Qual a proporção de número de itens comprados? ---

SELECT 
    num_itens_comprados,
    COUNT(*) AS total_pedidos,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_itens_pedido), 2) AS proporcao_percentual
FROM (
    SELECT 
        order_id,
        COUNT(*) AS num_itens_comprados
    FROM 
        olist_itens_pedido
    GROUP BY 
        order_id
) AS itens_por_pedido
GROUP BY 
    num_itens_comprados
ORDER BY 
    num_itens_comprados;

--- Qual a proporção dos metodos de compras utilizados? ---

SELECT 
    payment_type,
    COUNT(*) AS total_transacoes,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_pagamentos_pedido), 2) AS proporcao_percentual
FROM 
    olist_pagamentos_pedido
GROUP BY 
    payment_type
ORDER BY 
    total_transacoes DESC;

--- proporção de em quantas parcelas geralmente é feita as compras ---

SELECT 
    payment_installments AS numero_parcelas,
    COUNT(*) AS total_transacoes,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM olist_pagamentos_pedido), 2) AS proporcao_percentual
FROM 
    olist_pagamentos_pedido
GROUP BY 
    payment_installments
ORDER BY 
    numero_parcelas;

-- média de notas quando o pedido chega na data ou antes da data estipulada--

SELECT 
    AVG(ap.review_score) AS media_notas
FROM 
    olist_avaliacoes_pedido ap
JOIN 
    olist_pedidos op ON ap.order_id = op.order_id
WHERE 
    op.order_delivered_customer_date <= op.order_estimated_delivery_date;

-- média de notas quando o pedido chega depois da data estipulada --

SELECT 
    AVG(ap.review_score) AS media_notas_atrasadas
FROM 
    olist_avaliacoes_pedido ap
JOIN 
    olist_pedidos op ON ap.order_id = op.order_id
WHERE 
    op.order_delivered_customer_date > op.order_estimated_delivery_date;

-- categoria de item mais vendida na cidade de são paulo --

SELECT
    p.product_category_name AS categoria,
    COUNT(*) AS total_itens_vendidos
FROM
    olist_itens_pedido i
JOIN
    olist_pedidos o ON i.order_id = o.order_id
JOIN
    olist_produtos p ON i.product_id = p.product_id
JOIN
    olist_clientes c ON o.customer_id = c.customer_id
JOIN
    olist_geolocalizacao g ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
WHERE
    g.geolocation_city = 'sao paulo'
GROUP BY
    p.product_category_name;

--Quantos dias, em média, de tempo que leva pra chegar um item para clientes na cidade de sao paulo--

SELECT 
    AVG(DATEDIFF(day, o.order_delivered_carrier_date, o.order_delivered_customer_date)) AS tempo_medio_entrega
FROM 
    olist_pedidos o
JOIN 
    olist_clientes c ON o.customer_id = c.customer_id
WHERE 
    UPPER(c.customer_city) = 'sao paulo' 
    AND o.order_status = 'delivered';

-- total de gasto por dia--

SELECT 
    CONVERT(date, o.order_purchase_timestamp) AS data_compra,
    SUM(p.payment_value) AS total_comprado
FROM 
    olist_pedidos o
JOIN 
    olist_pagamentos_pedido p ON o.order_id = p.order_id
GROUP BY 
    CONVERT(date, o.order_purchase_timestamp)
ORDER BY 
    CONVERT(date, o.order_purchase_timestamp);

-- total gasto por mes --

SELECT 
    YEAR(order_purchase_timestamp) AS ano,
    MONTH(order_purchase_timestamp) AS mes,
    SUM(p.payment_value) AS total_gasto
FROM 
    olist_pedidos o
JOIN 
    olist_pagamentos_pedido p ON o.order_id = p.order_id
GROUP BY 
    YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY 
    ano, mes;

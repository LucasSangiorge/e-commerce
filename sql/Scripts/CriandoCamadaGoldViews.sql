-- Vendas 
CREATE OR REPLACE VIEW vw_fato_vendas_gold AS
SELECT
    i.item_id,
    i.pedido_id,
    p.cliente_id,
    p.data_pedido,
    i.produto_id,
    i.quantidade,
    i.preco_unitario,
    (i.quantidade * i.preco_unitario) AS valor_item
FROM itens_pedido_silver i
JOIN pedidos_silver p ON i.pedido_id = p.pedido_id;


-- Faturamento mensal 
CREATE OR REPLACE VIEW vw_faturamento_mensal_gold AS
SELECT
    DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
    SUM(valor_item) AS faturamento
FROM vw_fato_vendas_gold
GROUP BY mes;

-- ticket médio

CREATE OR REPLACE VIEW vw_ticket_medio_gold AS
SELECT
    COUNT(DISTINCT pedido_id) AS total_pedidos,
    SUM(valor_item) AS faturamento_total,
    ROUND(SUM(valor_item) / COUNT(DISTINCT pedido_id), 2) AS ticket_medio
FROM vw_fato_vendas_gold;

-- Top produtos

CREATE OR REPLACE VIEW vw_top_produtos_gold AS
SELECT
    pr.nome_produto,
    SUM(f.quantidade) AS quantidade_vendida,
    SUM(f.valor_item) AS faturamento
FROM vw_fato_vendas_gold f
JOIN produtos_silver pr ON f.produto_id = pr.produto_id
GROUP BY pr.nome_produto
ORDER BY faturamento DESC;

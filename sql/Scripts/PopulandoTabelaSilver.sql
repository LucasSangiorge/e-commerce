INSERT INTO itens_pedido_silver (
    item_id,
    pedido_id,
    produto_id,
    quantidade,
    preco_unitario
   
   
)
SELECT DISTINCT 
	item_id,
    pedido_id,
    produto_id,
    quantidade,
    preco_unitario
   
FROM itens_pedido_bronze
WHERE item_id IS NOT NULL;

SELECT * FROM produtos_bronze

INSERT INTO produtos_silver (
    produto_id,
    nome_produto,
    categoria,
    preco
)
SELECT DISTINCT 
	produto_id,
    nome_produto,
    categoria,
    preco
   
FROM produtos_bronze
WHERE produto_id IS NOT NULL;


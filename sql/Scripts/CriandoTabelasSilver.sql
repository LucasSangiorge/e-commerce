CREATE TABLE clientes_silver (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_cadastro DATE,
    idade INT,
    cidade VARCHAR(100),
    canal_aquisicao VARCHAR(50)
);

CREATE TABLE produtos_silver (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(150),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE TABLE pedidos_silver (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    status VARCHAR(50),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes_silver(cliente_id)
);

CREATE TABLE itens_pedido_silver (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos_silver(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos_silver(produto_id)
);
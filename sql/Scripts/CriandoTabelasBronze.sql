CREATE TABLE clientes_bronze (
    cliente_id INT PRIMARY KEY,
    data_cadastro DATE,
    idade INT,
    sexo VARCHAR(10),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

CREATE TABLE produtos_bronze (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(150),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);
 select * from produtos_bronze

CREATE TABLE pedidos_bronze (
    pedido_id INT,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2)
);

CREATE TABLE itens_pedido_bronze (
    item_id INT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2)
);

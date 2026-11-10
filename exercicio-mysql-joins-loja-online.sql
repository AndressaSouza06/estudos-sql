create database exerc21;
create table clientes (
id_cliente int primary key auto_increment,
nome varchar (100) not null,
cidade varchar (100) not null
);
select * from clientes;
insert into clientes values (default, 'Ana Souza','São Paulo'),
(default,'Bruno Lima','Rio de Janeiro'), (default,'Carla Menezes','Curitiba');

create table pedidos(
id_pedido int primary key auto_increment,
id_cliente int,
data_pedido date not null,
valor_total decimal (10,2),
foreign key (id_cliente) references clientes (id_cliente)
);

insert into pedidos values (101,'1','2025-10-01','450.00'), 
(102,'1','2025-10-15','300.00'),
(103,'2','2025-10-17','150.00'),
(104,'3','2025-10-20','200.00');
select * from pedidos;

create table itens_pedido (
id_item int primary key auto_increment,
id_pedido int,
produto varchar (100) not null,
quantidade int not null,
preco_unitario decimal (10,2),
foreign key (id_pedido) references pedidos (id_pedido)
);
select * from itens_pedido;
insert into itens_pedido values 
(default,'101','Teclado','1','150.00'),
(default,'101','Mouse','2','150.00'),
(default,'102','Headset','1','300.00'),
(default,'103','Cadeira Gamer','1','150.00'),
(default,'104','Webcam','1','200.00');

-- correção:BANCO DE DADOS: Loja Online
-- Exercício prático com JOINs em MySQL
-- ============================================
drop database loja_online;
-- 1. Criação do banco de dados
CREATE DATABASE if not exists loja_online;
USE loja_online;
 
-- 2️. Criação das tabelas
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(50)
);
 
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
 
CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    produto VARCHAR(100),
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);
 
-- 3️. Inserção de dados
 
INSERT INTO clientes (nome, cidade) VALUES
('Ana Souza', 'São Paulo'),
('Bruno Lima', 'Rio de Janeiro'),
('Carla Menezes', 'Curitiba');
 
insert into clientes (nome, cidade) values
('Outro cliente', 'São Paulo');
select * from clientes;
INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(101, 1, '2025-10-01', 450.00),
(102, 1, '2025-10-15', 300.00),
(103, 2, '2025-10-17', 150.00),
(104, 3, '2025-10-20', 200.00);
 
select * from pedidos;
 
INSERT INTO itens_pedido (id_pedido, produto, quantidade, preco_unitario) VALUES
(101, 'Teclado', 1, 150.00),
(101, 'Mouse', 2, 150.00),
(102, 'Headset', 1, 300.00),
(103, 'Cadeira Gamer', 1, 150.00),
(104, 'Webcam', 1, 200.00);
 
select * from itens_pedido;
-- ============================================
-- Consultas com JOINs
-- ============================================
 
-- 1️. Nome do cliente, número do pedido e valor total
SELECT c.nome AS Cliente, p.id_pedido AS Pedido, p.valor_total AS 'Valor Total'
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
 
-- 2️. Nome do cliente, produto e data do pedido
SELECT c.nome AS Nome, i.produto AS Produto, p.data_pedido AS 'Data Pedido'
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido i ON p.id_pedido = i.id_pedido;
 
-- 3️. Total gasto por cliente
SELECT c.nome AS 'Nome Cliente', SUM(p.valor_total) AS 'Total gasto'
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;
 
-- 4️. Todos os clientes (mesmo sem pedidos)
SELECT c.nome, p.id_pedido, p.valor_total
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
 
-- ============================================
-- 5️(DESAFIO EXTRA)
-- Criar tabela de produtos e praticar RIGHT JOIN
-- ============================================
-- id_produto, nome_produto, preco.
 
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);
 
INSERT INTO produtos (nome_produto, preco) VALUES
('Teclado', 150.00),
('Mouse', 75.00),
('Headset', 300.00),
('Cadeira Gamer', 150.00),
('Webcam', 200.00),
('Monitor', 700.00); -- ainda não vendido
 
select * from produtos;
select * from pedidos;
-- Consulta com RIGHT JOIN (produtos ainda não vendidos aparecem também)
SELECT i.produto AS Produto, c.nome AS Cliente
FROM itens_pedido i
RIGHT JOIN pedidos p ON i.id_pedido = p.id_pedido
RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente
RIGHT JOIN produtos pr ON i.produto = pr.nome_produto
ORDER BY pr.nome_produto;
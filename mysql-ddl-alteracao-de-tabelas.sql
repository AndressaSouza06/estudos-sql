-- exercício padaria
create database padaria;
create table Produtos(
id int auto_increment primary key,
nome varchar (100) not null,
preco decimal (10,2),
estoque int not null
);
describe Produtos;

-- add coluna validade
alter table Produtos
add column validade date not null;
alter table Produtos
change column validade validade_produtos date not null;

-- aumentar o tamanho do nome do produto
alter table Produtos
modify column nome varchar(150) not null;

-- remover a coluna de validade
alter table Produtos
drop column validade;

-- add uma colunas para categoria
alter table Produtos
add column Paes varchar (50) not null;
-- 
alter table Produtos
add column Bolos varchar (50) not null;

alter table Produtos
add column Salgados varchar (50) not null;
drop table Produtos;

alter table Produtos
modify column preco decimal (12,2) not null;

drop table Produtos;
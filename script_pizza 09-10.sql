create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
id INt not null AUTO_INCREMENT primary key,
telefone VARCHAR(14),
nome VARCHAR(30),
logradouro VARCHAR(30),
numero DECIMAL(5,0),
complemento VARCHAR(30),
bairro VARCHAR(30),
referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
id INTEGER not null AUTO_INCREMENT primary key,
nome VARCHAR(30),
descricao VARCHAR(30),
valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
id INTEGER AUTO_INCREMENT primary key,
cliente_id INTEGER,
data DATETIME,
valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
pedido_id INTEGER,
pizza_id INTEGER,
quantidade int,
valor DECIMAL(15 , 2 ),
FOREIGN KEY (pizza_id)
REFERENCES Pizzas (id),
FOREIGN KEY (pedido_id)
REFERENCES Pedidos (id)
 );
 


insert INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from pizzas;

alter table pizzas add column custo decimal(15,2);

update pizzas set custo = valor * 0.60;

-- valor maior que 17
select * from pizzas where valor > 17;

-- valor mair ou igual a 17
select * from pizzas where valor >= 17;
-- valor menor que 17
select * from pizzas where valor < 17;

-- valor menor ou igual a 17
select * from pizzas where valor <= 17;

-- valor igual a 17
select * from pizzas where valor = 17;

-- deferente de 17
select * from pizzas where valor != 17;

-- deferente maior deferente menor
select * from pizzas where valor <> 17;

-- volor null
select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

-- valor entre 15 e 20 
select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;

-- valor maior ou menor que 17
select * from pizzas where valor < 17 or valor > 17;

-- valor nao menores ou maiores do que 17
select * from pizzas where not (valor < 17 or valor > 17);

-- valores na faixa de 17 e 20
select * from pizzas where valor >= 17 and valor <= 20;
select * from pizzas where valor between 17 and 20;

-- valores fora da faixa de 17 e 20
select * from pizzas where valor < 17 and valor > 20;
select * from pizzas where  valor not between 17 and 20;
select * from pizzas where not (valor >= 17 and valor <= 20);

-- valor igual a 15 e 20
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- valor diferente de 15 e 20
select * from pizzas where valor != 15 and valor !=20;
select * from pizzas where valor not in(15,20);

-- valor nao nulo
select * from pizzas where valor is not null;

-- selecionar pizzas que começa com a letra E like:parte do texto
select * from pizzas where nome like 'e%';

-- elecionar pizzas que começa com a letra A like:parte do texto
select * from pizzas where nome like '%a';

-- elecionar pizzas que começa com a letra L like:parte do texto
select * from pizzas where nome like '%l%';

-- Cláusula ORDER BY
-- order by <coluna1> [asc/desc], <coluna n> [asc/desc];
-- listar todas as colunas da tabela PIZZAS em ordem alfabetica
select * from pizzas order by nome;

-- listar todas as colunas da tabela de ordem decrescente de valor
select * from pizzas order by nome desc;

-- listar o nome ou valor das pizzas em ordem decerscente 
select * from pizzas order by valor desc, nome asc;

-- todos os registros de linhas 
select * from pizzas order by valor desc limit 2;
select * from pizzas limit 2;

-- exiber o valor uma vez só
select distinct valor from pizzas order by valor;

/*funçoes de agregaçãoes
* conhecidas como funçoes esteticas, as funçoes de agregação obtem
* informaçoes sobre conjuntos de linha especificando
* AVG(coluna)media dos valores da coluna
*COUNT numero de linhas 
* MAX(coluna) maior valor da coluna
*MIN(coluna) menor valor da coluna
*SUN(coluna) soma dos valores da coluna 
*/
-- contar quantas pizzas estao cadastradas
select count(*) from pizzas;
select count(nome) from pizzas;
select count(valor) from pizzas;

-- qual a media de preços das pizzas
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- qual é o valor da pizza mais cara do cardapio da pizzaria
select max(valor) from pizzas;

-- qual é o valor da pizza mais barata do cardapio da pizzaria
select min(valor) from pizzas;

-- qual o valor total do pedido numero 7
select sum(valor) from itens_pedido where pedido_id = 7;

-- somar o valor de cada pedido e retornar o valor total de cada uma
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'quantidade de pizzas'from itens_pedido group by pedido_id;

-- media ponderada
select pedido_id as pedido, sum(valor) as 'valor pedido', avg(valor) as media, sum(valor) / sum(quantidade) as 'valor media' from itens_pedido group by pedido_id;

-- INNER JOIN: retornar registros quando ha pelo menos uma correspondencia em ambas as tabelas

-- juntar as duas tabelas 
select * from clientes as c inner join pedidos as p on p.cliente_id = c.id;

-- LEFT JOIN ou LEFT OUTER JOIN: retornar todos os registros da tabela da esquerda
-- (primeira tabela mencionada) e os registros correspondentes da tabela da direita
-- (segunda tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor
from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

-- RIGHT JOIN ou RIGHT OUTER JION: retorna todos os registros da tabela da direita
-- (segundo tabela mencionada) e os registros correspondentes da tabela da esquerda
-- (primeira tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedidos, valor from clientes
right join pedidos on pedidos.cliente_id = clientes.id;

insert into pedidos(id, data, valor) values (9,'2024-10-02', 0);

-- quantidade de pedidos realizados por cliente, exibir nome do cliente e quantidade de pedidos
-- quantidade de pedidos realizados
select nome, telefone, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;

select * from pedidos;

-- quantos pedidos foram feitos no total
select count(*) from itens_pedido;

-- quantos pedidos foram feitos pelo cliente com o nome "Alexander Santos"
select nome, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by 'Alexander Santos';

-- qual o valor total de todos os pedidos feitos ate agora
select sum(valor) from itens_pedido;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Liste todos os pedidos com o nome do cliente correspondente.
select * from pizzas;
select clientes.nome,  pedidos.id from pedidos inner join clientes on pedidos.cliente_id = clientes.id;
select * from pedidos;
select * from clientes;
select clientes.nome,  pedidos.id from pedidos left join clientes on pedidos.cliente_id = clientes.id; -- aparece todo os pedidos null
-- 2. Quantos pedidos foram feitos no total?
select count(*) from itens_pedido;

-- 3. Liste os pedidos feitos após '2016-12-15' com o nome do cliente

select * from pedidos;
select pedidos_id as pedido, pedidos.data, clientes.nome from pedidos inner join clientes on pedidos.cliente_id where pedidos.data > '2016-12-15';
select * from pedidos where data > '2016-12.15';
select pedidos_id as pedido, pedidos.data, clientes.nome from pedidos inner join clientes on pedidos.cliente_id where pedidos.data > '2016-12-15 23:59:59';


-- 4. Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santose

select nome, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id where clientes.nome = 'Alexander Santos' group by clientes.id, nome;
select * from pedidos;

-- 5. Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes que foram excluídos da tabela clientes.
select nome, count(pedidos.id) from clientes inner join pedidos on clientes.id = pedidos.cliente_id group by valor;
select *  from pedidos;

-- 6. Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) from pedidos;

-- 7. Qual o total gasto por cada cliente?
select clientes_id as id_clientes, nome, valor from clientes inner join pedidos on pedidos.clientes_id = clientes.id;

-- 8. Liste todos os clientes e seus pedidos feitos no mês de dezembro de 2016 (inclua clientes sem pedidos).
select * from pedidos;
select clientes.nome, pedidos.id as pedido, pedios.data, pedidos.valor from clientes inner join pedidos on pedidos.cliente_id = clientes.id where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';
-- 9. Qual o valor médio dos pedidos realizados?
select pedido_id as pedido, sum(valor) as 'valor pedido', avg(valor) as media, sum(valor) / sum(quantidade) as 'valor media' from itens_pedido group by pedido_id;
select avg(valor) as media from itens_pedido;

-- 10. Liste o valor total dos pedidos por cliente, incluindo pedidos feitos por clientes que foram excluídos (nome aparecerá como NULL).
select clientes.id, clientes.nome , sum(pedidos.valor) as valor_total, count(pedidos.id) as total_pedidos from pedidos left join clientes on clientes.id = pedidos.cliente_id
group by clientes.id, clientes.nome;

-- 11. Qual o valor do pedido mais caro registrado?
select max(valor) from pizzas;

-- 12. Qual o valor do pedido mais barato registrado?
select min(valor) from pizzas;

-- 13. Quantos pedidos cada cliente fez (mesmo que não tenham feito nenhum)?
select nome, count(pedidos.id) from clientes inner join pedidos on clientes.id = pedidos.cliente_id group by nome;
-- 14. Qual o pedido mais caro, exibir o nome do cliente e o valor do pedido.
select nome, pedidos.id as pedido, pedidos.valor from clientes inner join pedidos on pedidos.cliente_id = cliente_id order by valor desc;

-- 15. Qual a média de pizzas por pedido e quantos pedidos foram feitos?
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido; -- distinct ele pega todos menos os null
select * from itens_pedido;
select * from pedidos;
select * from clientes;

-- 16. Qual o total de pizzas vendidas e o número de pedidos do cliente "Bruna Dantas"?

select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido 
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
where clientes.nome = 'Bruna Dantas';

-- 17. Qual o pedido mais caro e o mais barato do cliente "Laura Madureira"?
select * from pedidos;
select * from clientes;
select pedidos.id as clientes, nome, pedidos.id as pedidos, max(valor), min(valor) from clientes left join pedidos on pedidos.cliente_id = clientes.id where clientes.nome = 'Laura Madureira';

-- 18. Quantas pizzas cada cliente comprou no total?
select * from itens_pedido;
select * from pedidos;
select nome, sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedidos from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
group by clientes.nome;

-- 19. Qual o pedido mais barato, exibir o nome do cliente e o valor do pedido.
select nome, pedidos.id as pedido, pedidos.valor from clientes inner join pedidos on pedidos.cliente_id = clientes.id order by valor desc;
-- 20. Liste todos os clientes, mesmo que não tenham feito pedidos, com seus respectivos pedidos (se houver).

-- 21. Liste todos os clientes com o valor total de seus pedidos (mesmo que não tenham feito edidos).

-- 22. Liste os 3 clientes que mais gastou, exibir nome do cliente e o valor gasto.
select nome, pedidos.id as pedido, pedidos.valor from clientes inner join pedidos on pedidos.cliente_id = clientes.id order by valor desc limit 3;

select * from itens_pedido;





















































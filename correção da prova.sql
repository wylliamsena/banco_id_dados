-- Criação do banco de dados
DROP DATABASE IF EXISTS revendedora;
-- Criação do banco de dados
DROP DATABASE IF EXISTS revendedora;
CREATE DATABASE revendedora;
USE revendedora;

-- Tabela de Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(180) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela de Funcionários
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_admissao DATE NOT NULL
);

-- Tabela de Fabricantes
CREATE TABLE fabricantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais_origem VARCHAR(100) NOT NULL 
);

-- Tabela de Carros
CREATE TABLE carros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(30),
    preco_compra DECIMAL(10, 2) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    status VARCHAR(100) NOT NULL DEFAULT 'Disponível',
    fabricante_id INT,
    FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id)
);

-- Tabela de Vendas
CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carro_id INT NOT NULL,
    cliente_id INT NOT NULL,
    funcionario_id INT NULL,
    data_venda DATE NOT NULL,
    preco_venda DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (carro_id) REFERENCES carros(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

-- Inserindo Clientes (16 clientes)
INSERT INTO clientes (nome, cpf, telefone, email) VALUES 
('João Silva', '12345678901', '11987654321', 'joao@gmail.com'),
('Maria Oliveira', '23456789012', '21987654321', 'maria@gmail.com'),
('Carlos Santos', '34567890123', '31987654321', 'carlos@gmail.com'),
('Ana Pereira', '45678901234', '41987654321', 'ana@gmail.com'),
('Lucas Almeida', '56789012345', '51987654321', 'lucas@gmail.com'),
('Fernanda Costa', '67890123456', '61987654321', 'fernanda@gmail.com'),
('Roberto Lima', '78901234567', '71987654321', 'roberto@gmail.com'),
('Juliana Gomes', '89012345678', '81987654321', 'juliana@gmail.com'),
('Marcos Silva', '90123456789', '91987654321', 'marcos@gmail.com'),
('Tatiane Rocha', '01234567890', '02987654321', 'tatiane@gmail.com'),
('Ricardo Mendes', '12345678900', '13987654321', 'ricardo@gmail.com'),
('Patrícia Lima', '23456789001', '23987654321', 'patricia@gmail.com'),
('Fábio Pereira', '34567890102', '33987654321', 'fabio@gmail.com'),
('Sofia Costa', '45678901203', '43987654321', 'sofia@gmail.com'),
('André Santos', '56789012304', '53987654321', 'andre@gmail.com'),
('Clara Gomes', '67890123405', '63987654321', ''),
('Xpto Silveira', '67990123405', '03957654321', NULL);

-- Inserindo Funcionários
INSERT INTO funcionarios (nome, cargo, salario, data_admissao) VALUES 
('Pedro Souza', 'Vendedor', 3000.00, '2022-01-15'),
('Laura Martins', 'Vendedora', 3200.00, '2022-02-10'),
('Rafael Mendes', 'Vendedor', 3100.00, '2022-03-05'),
('Manuel Silva', 'Vendedor Aprendiz', 1000.00, '2022-03-05');

-- Inserindo Fabricantes
INSERT INTO fabricantes (nome, pais_origem) VALUES 
('Volkswagen', 'Alemanha'),
('Toyota', 'Japão'),
('Nissan', 'Japão'),
('Ford', 'EUA'),
('Chevrolet', 'EUA'),
('Jeep', 'EUA'),
('Honda', 'Japão'),
('Hyundai', 'Coreia do Sul'),
('Renault', 'França'),
('Fiat', 'Itália');

-- Inserindo Carros (36 vendidos)
INSERT INTO carros (modelo, marca, ano, cor, preco_compra, preco_venda, status, fabricante_id) VALUES 
('Gol', 'Volkswagen', 2020, 'Prata', 30000.00, 35000.00, 'Vendido', 1),
('Civic', 'Honda', 2021, 'Preto', 90000.00, 100000.00, 'Vendido', 5),
('Fiesta', 'Ford', 2019, 'Vermelho', 45000.00, 50000.00, 'Vendido', 3),
('Onix', 'Chevrolet', 2022, 'Branco', 60000.00, 65000.00, 'Vendido', 4),
('Corolla', 'Toyota', 2020, 'Azul', 80000.00, 90000.00, 'Vendido', 2),
('HB20', 'Hyundai', 2021, 'Cinza', 70000.00, 75000.00, 'Vendido', 6),
('Kwid', 'Renault', 2022, 'Amarelo', 35000.00, 40000.00, 'Vendido', 7),
('Argo', 'Fiat', 2021, 'Verde', 55000.00, 60000.00, 'Vendido', 8),
('Tracker', 'Chevrolet', 2023, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('T-Cross', 'Volkswagen', 2023, 'Preto', 110000.00, 120000.00, 'Vendido', 1),
('Sandero', 'Renault', 2022, 'Prata', 45000.00, 48000.00, 'Vendido', 7),
('Polo', 'Volkswagen', 2022, 'Azul', 75000.00, 80000.00, 'Vendido', 1),
('Cruze', 'Chevrolet', 2021, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('Civic', 'Honda', 2022, 'Preto', 110000.00, 115000.00, 'Vendido', 5),
('Corolla', 'Toyota', 2021, 'Cinza', 85000.00, 90000.00, 'Vendido', 2),
('HB20', 'Hyundai', 2022, 'Vermelho', 60000.00, 65000.00, 'Vendido', 6),
('Kwid', 'Renault', 2023, 'Amarelo', 35000.00, 40000.00, 'Vendido', 7),
('Argo', 'Fiat', 2022, 'Verde', 55000.00, 60000.00, 'Vendido', 8),
('Tracker', 'Chevrolet', 2023, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('T-Cross', 'Volkswagen', 2023, 'Preto', 110000.00, 120000.00, 'Vendido', 1),
('Sandero', 'Renault', 2022, 'Prata', 45000.00, 48000.00, 'Vendido', 7),
('Polo', 'Volkswagen', 2022, 'Azul', 75000.00, 80000.00, 'Vendido', 1),
('Cruze', 'Chevrolet', 2021, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('Civic', 'Honda', 2022, 'Preto', 110000.00, 115000.00, 'Vendido', 5),
('Corolla', 'Toyota', 2021, 'Cinza', 85000.00, 90000.00, 'Vendido', 2),
('HB20', 'Hyundai', 2022, 'Vermelho', 60000.00, 65000.00, 'Vendido', 6),
('Kwid', 'Renault', 2023, 'Amarelo', 35000.00, 40000.00, 'Vendido', 7),
('Argo', 'Fiat', 2022, 'Verde', 55000.00, 60000.00, 'Vendido', 8),
('Tracker', 'Chevrolet', 2023, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('T-Cross', 'Volkswagen', 2023, 'Preto', 110000.00, 120000.00, 'Vendido', 1),
('Sandero', 'Renault', 2022, 'Prata', 45000.00, 48000.00, 'Vendido', 7),
('Polo', 'Volkswagen', 2022, 'Azul', 75000.00, 80000.00, 'Vendido', 1),
('Cruze', 'Chevrolet', 2021, 'Branco', 90000.00, 95000.00, 'Vendido', 4),
('Civic', 'Honda', 2022, 'Preto', 110000.00, 115000.00, 'Vendido', 5),
('Corolla', 'Toyota', 2021, 'Cinza', 85000.00, 90000.00, 'Vendido', 2),
('HB20', 'Hyundai', 2022, 'Vermelho', 60000.00, 65000.00, 'Vendido', 6);

-- Inserindo Carros (10 disponíveis)
INSERT INTO carros (modelo, marca, ano, cor, preco_compra, preco_venda, status, fabricante_id) VALUES 
('Nissan Kicks', 'Nissan', 2023, 'Branco', 100000.00, 110000.00, 'Disponível', 9),
('Honda Fit', 'Honda', 2022, 'Prata', 85000.00, 90000.00, 'Disponível', 5),
('Jeep Compass', 'Jeep', 2023, 'Preto', 150000.00, 160000.00, 'Disponível', 10),
('Fiat Toro', 'Fiat', 2023, 'Vermelho', 110000.00, 120000.00, 'Disponível', 8),
('Ford EcoSport', 'Ford', 2022, 'Azul', 95000.00, 100000.00, 'Disponível', 3),
('Toyota Hilux', 'Toyota', 2023, 'Cinza', 200000.00, 210000.00, 'Disponível', 2),
('Chevrolet Tracker', 'Chevrolet', 2023, 'Verde', 115000.00, 125000.00, 'Disponível', 4),
('Hyundai Creta', 'Hyundai', 2023, 'Branco', 130000.00, 140000.00, 'Disponível', 6),
('Renault Duster', 'Renault', 2022, 'Amarelo', 90000.00, 95000.00, 'Disponível', 7),
('Volkswagen T-Cross', 'Volkswagen', 2023, 'Preto', 130000.00, 140000.00, 'Disponível', 1);

-- Inserindo Vendas (para 36 carros vendidos)
INSERT INTO vendas (carro_id, cliente_id, funcionario_id, data_venda, preco_venda) VALUES 
(1, 1, 1, '2023-01-01', 35000.00),
(2, 2, 1, '2023-01-02', 100000.00),
(3, 3, 2, '2023-02-03', 50000.00),
(4, 4, 2, '2023-02-04', 65000.00),
(5, 5, 1, '2023-03-05', 90000.00),
(6, 6, 2, '2023-03-06', 75000.00),
(7, 7, 3, '2023-03-07', 40000.00),
(8, 8, 3, '2023-04-08', 60000.00),
(9, 9, 1, '2023-04-09', 95000.00),
(10, 10, 1, '2023-05-10', 120000.00),
(11, 11, 2, '2023-05-11', 48000.00),
(12, 12, 2, '2023-06-12', 80000.00),
(13, 13, 3, '2023-06-13', 90000.00),
(14, 14, 3, '2023-07-14', 115000.00),
(15, 15, 1, '2023-07-15', 90000.00),
(16, 16, 1, '2023-08-16', 60000.00),
(17, 1, 2, '2023-08-17', 35000.00),
(18, 2, 2, '2023-09-18', 100000.00),
(19, 3, 1, '2023-09-19', 50000.00),
(20, 4, 3, '2023-09-20', 65000.00),
(21, 10, 1, '2023-10-21', 90000.00),
(22, 6, 2, '2023-10-22', 75000.00),
(23, 7, 3, '2023-11-23', 40000.00),
(24, 8, 3, '2023-11-24', 60000.00),
(25, 9, 1, '2023-11-25', 95000.00),
(26, 10, 1, '2023-11-26', 120000.00),
(27, 11, 2, '2023-12-27', 48000.00),
(28, 12, 2, '2023-12-28', 80000.00),
(29, 13, 3, '2023-12-29', 90000.00),
(30, 14, 3, '2023-12-30', 115000.00),
(31, 15, 1, '2023-03-31', 90000.00),
(32, 11, 1, '2023-02-01', 60000.00),
(33, 1, 2, '2023-02-02', 35000.00),
(34, 10, 2, '2023-02-03', 100000.00),
(35, 3, 1, '2023-05-04', 50000.00),
(36, 16, 3, '2023-06-05', 65000.00),
(37, 5, 1, '2023-12-06', 90000.00),
(38, 10, 2, '2024-01-07', 75000.00);
select * from carros;
select * from clientes;
select * from fabricantes;
select * from funcionarios;
select * from vendas;

-- 1. (3 pontos) Quais são os campos da tabela `clientes`? Faça uma consulta que retorne todos os dados dos clientes (não utilizar o *).

select id, nome, cpf, telefone, email from clientes;


-- 2. (3 pontos) Faça uma consulta que retorne os nomes e salários dos funcionários, ordenados por salário em ordem decrescente.

select nome, salario from funcionarios order by salario desc;


-- 3. (4 pontos) Crie uma consulta que mostre todos os carros disponíveis, incluindo modelo, ano, marca, pais de origem e preço de venda ordenado pelo modelo.

select modelo, ano, marca, pais_origem, preco_venda from fabricantes inner join carros on carros.fabricante_id = fabricantes.id where status = 'Disponível' order by modelo;
															/*quando coloca o ponto é a tabela ponto e o campo utilizado, e o = é fazer a comparação das duas tabelas*/

-- 4. (3 pontos) Quantos carros foram vendidos?

select count(*) as total_carros_vendidos from carros where status = 'vendido';

select count(*) from vendas;

-- 5. (3 pontos) Qual é o preço médio de venda dos carros vendidos?

select avg(preco_venda) as preco_medio_vendas from vendas;

-- 6. (4 pontos) Liste os nomes dos clientes e os modelos dos carros que compraram, utilizando INNER JOIN.

select nome as clientes, modelo from clientes inner join vendas on vendas.cliente_id = clientes.id inner join carros on carros.id = vendas.carro_id;

/*  7. (7 pontos) Faça uma consulta que retorne o total de vendas realizadas por cada funcionário, mostrando o nome do funcionário e o total vendido (exibir os 
funcionários que não realizou nenhuma venda).*/

select nome, sum(preco_venda) as total_vendido from funcionarios left join vendas on funcionarios.id = vendas.funcionario_id group by nome;
select nome, sum(ifnull(preco_venda, 0)) as total_vendido from funcionarios left join vendas on funcionarios.id = vendas.funcionario_id group by nome; 
/* sum(ifnull(preco_venda, 0)) -> quando for null aparcere o valor 0)*/
select * from funcionarios;

-- 8. (4 pontos) Quais são os fabricantes que possuem carros disponíveis? Liste o nome do fabricante e o modelo do carro ordenado pelo fabricante e modelo.

select nome, modelo from fabricantes inner join carros on fabricantes.id = carros.fabricante_id where status = 'Disponivel' order by nome, modelo;

-- 9. (6 pontos) Crie uma consulta que retorne a lista de carros vendidos, mostrando o modelo, nome do cliente e data da venda utilizando LEFT JOIN.

select modelo, nome as cliente, data_venda from vendas left join carros on vendas.carro_id = carros.id left join clientes on vendas.cliente_id = clientes.id where status = 'Vendido';



-- 10. (4 pontos) Liste todos os carros da marca "Volkswagen", independentemente de estarem vendidos ou disponíveis.

select * from carros where marca = 'Volkswagen';

-- 11. (5 pontos) Qual o valor o total de vendas realizadas para cada fabricante.

select nome as fabricante, sum(vendas.preco_venda) as total_vendas from fabricantes inner join carros on fabricantes.id = carros.fabricante_id inner join vendas on vendas.carro_id = carros.id group by nome;

/* 12. (6 pontos) Faça uma consulta que retorne todos os clientes e o total de carros que ele comprou, incluindo o nome do cliente e a contagem de carros comprados 
ordenado pelo total de carros em ordem decrescente.*/

select nome, count(carro_id) as total_carros from clientes inner join vendas on clientes.id = vendas.cliente_id group by nome order by total_carros desc;

/*13. (8 pontos) Liste todos os funcionários, o valor total vendido por cada funcionário e calcula o valor de comissão paga a cada funcionário. Comissão 3% 
sobre o valor total vendido.*/

select nome, sum(preco_venda)  as total_vendido, sum(preco_venda) * 0.03 as comissao, (sum(preco_venda)*3)/100 from funcionarios inner join vendas on vendas.funcionario_id = funcionarios.id group by nome;


-- 14. (5 pontos) Quais são os carros que foram vendidos por um preço superior ao preço de compra? Liste o modelo e a diferença entre preço de venda e preço de compra.

select modelo, (preco_venda - preco_compra) as diferenca from carros where preco_compra < preco_venda and status = 'Vendido';

-- 15. (6 pontos) Mostre o total de vendas por mês (data_venda) no ano de 2023. Exiba o mês e o total vendido.


select year(data_venda) as mes, sum(preco_venda) from vendas where year (data_venda) = 2023  group by mes;


-- 16. (3 pontos) Utilize uma função de agregação para calcular o salário total dos funcionários.

select sum(salario) as soma_do_salario from funcionarios;


-- 17. (3 pontos) Quais são os modelos de carros que foram vendidos no ano de 2024? 
select modelo from carros inner join vendas on vendas.carro_id = carros.id where year(data_venda) = 2024 ;



-- 18. (4 pontos) Liste o nome dos clientes e o preço de venda dos carros que adquiriram, ordenando por preço de venda.


select nome as cliente, preco_venda from clientes inner join vendas on clientes.id = vendas.cliente_id order by preco_venda;

-- 19. (3 pontos) Faça uma consulta que retorne todos os carros com status "Disponível" e que custem mais de 100.000,00.

select * from carros where status = 'Disponível' and  preco_venda > 100000; 

-- 20. (4 pontos) Mostre todos os carros de um fabricante específico (por exemplo, "Toyota"), incluindo todos os detalhes.

select * from carros inner join fabricantes on carros.fabricante_id = fabricantes.id where nome = 'Toyota';
select * from carros where fabricante_id = (select id from fabricantes where nome = 'Toyota');

-- 21. (4 pontos) Liste o nome dos fabricantes e a quantidade de carros vendidos de cada um.

select nome as fabricantes, count(vendas.carro_id) as total_veiculos_vendidos from fabricantes inner join carros on carros.fabricante_id = fabricantes.id 
inner join vendas on vendas.carro_id = carros.id group by fabricantes;


-- 22. (4 pontos) Realize uma consulta que mostre a lista de vendas, incluindo o nome do cliente, modelo do carro e nome do funcionário.

select clientes.nome as cliente, modelo as carro, funcionarios.nome as funcionario from clientes inner join vendas on vendas.cliente_id = clientes.id inner join 
carros on vendas.carro_id = carros.id inner join
funcionarios on vendas.funcionario_id = funcionarios.id;


-- 23. (3 pontos) Liste todos os carros vendidos e o respectivo fabricante.

select modelo, nome as fabricante from carros  inner join fabricantes on carros.fabricante_id = fabricantes.id where status = 'Vendido';


-- 24. (5 pontos) Crie uma consulta que retorna os clientes que não têm e-mails cadastrados, se houver]

select * from clientes where email is null or email = '';

/*Crie uma consulta que compare as vendas de carros por fabricante, em diferentes anos, mas apenas para carros da cor "Preto" ou "Branco". Para cada fabricante, exiba o nome do fabricante, o total de
carros vendidos e o valor total das vendas em cada ano. Organize os resultados por ano e, dentro de cada ano,pelo total de vendas de forma decrescente.*/
select * from carros;

select fabricanetes 













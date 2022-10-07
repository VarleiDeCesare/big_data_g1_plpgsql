SET SEARCH_PATH to trabalho_g1;

INSERT INTO tipo_espetaculo(descricao)
VALUES ('Filme');
INSERT INTO tipo_espetaculo(descricao)
VALUES ('Teatro');
INSERT INTO tipo_espetaculo(descricao)
VALUES ('Show');

INSERT INTO periodicidade(descricao)
VALUES ('Semanal');
INSERT INTO periodicidade(descricao)
VALUES ('Mensal');
INSERT INTO periodicidade(descricao)
VALUES ('Trimestral');

INSERT INTO cidade(nome, uf)
VALUES ('Água Santa', 'RS');
INSERT INTO cidade(nome, uf)
VALUES ('Florianópolis', 'SC');
INSERT INTO cidade(nome, uf)
VALUES ('São Paulo', 'SP');

INSERT INTO estabelecimento(nome, endereco, tem_estacionamento, cod_tipo_espetaculo, cod_cidade)
VALUES ('Cineplex', 'Av. Presidente Vargas', true, 1, 1);
INSERT INTO estabelecimento(nome, endereco, tem_estacionamento, cod_tipo_espetaculo, cod_cidade)
VALUES ('Cinemark', 'Virgilio Várzea', true, 3, 2);
INSERT INTO estabelecimento(nome, endereco, tem_estacionamento, cod_tipo_espetaculo, cod_cidade)
VALUES ('Cinemark Iguatemi', 'Av Paulista', true, 2, 3);

INSERT INTO espetaculo(nome, descricao, cod_estabelecimento)
VALUES ('Homem Aranha sem volta pra casa', 'Ficção da Marvel', 3);
INSERT INTO espetaculo(nome, descricao, cod_estabelecimento)
VALUES ('Sonic 2 - O filme', 'Desenho animado', 2);
INSERT INTO espetaculo(nome, descricao, cod_estabelecimento)
VALUES ('O telefone preto', 'Terror', 1);

INSERT INTO sessao(cod_espetaculo, data_hora_inicio, duracao, total_ingressos, ingressos_disponiveis, preco, cod_periodicidade)
VALUES (3, now(), 200,  150, 0, 12.00, 3);
INSERT INTO sessao(cod_espetaculo, data_hora_inicio, duracao, total_ingressos, ingressos_disponiveis, preco, cod_periodicidade)
VALUES (1, now(), 120,  98, 7, 11.50, 1);
INSERT INTO sessao(cod_espetaculo, data_hora_inicio, duracao, total_ingressos, ingressos_disponiveis, preco, cod_periodicidade)
VALUES (2, now(), 90,  80, 3, 12.30, 2);


INSERT INTO cliente(nome, sobrenome, cpf, endereco_entrega, cod_cidade)
VALUES ('Demetrio', 'Webber', '370.004.555-78', 'Casa verde', 3);
INSERT INTO cliente(nome, sobrenome, cpf, endereco_entrega, cod_cidade)
VALUES ('Guilherme', 'Dalazen', '800.610.305-41', 'Ap nº 23 ', 1);
INSERT INTO cliente(nome, sobrenome, cpf, endereco_entrega, cod_cidade)
VALUES ('Dionatha', 'D"Marchi', '123.456.789-10', 'Casa rosa', 2);

INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (1, now());
INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (1, now());
INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (2, now());
INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (2, now());
INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (3, now());
INSERT INTO pedido(cod_cliente, data_pedido)
VALUES (3, now());

INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (1, 2, 1,'Cadeira 2');
INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (1, 1, 6,'Cadeira 43');
INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (2, 1, 2,'Cadeira 55');
INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (3, 2, 3,'Cadeira 80');
INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (2, 3, 4,'Cadeira 95');
INSERT INTO reserva(cod_espetaculo, cod_sessao, cod_pedido, cadeira)
VALUES (3, 3, 5,'Cadeira 22');

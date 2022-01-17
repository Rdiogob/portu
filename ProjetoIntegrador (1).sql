CREATE DATABASE db_E_commerce;

USE db_E_commerce;

CREATE TABLE tb_vendedores (
id_vendedores INT AUTO_INCREMENT,
nome_vendedor VARCHAR (30),
tel_contato VARCHAR (20),
email_contato VARCHAR (40),
cupons_utilizados BIGINT,
PRIMARY KEY (id_vendedores)
);

INSERT INTO tb_vendedores (nome_vendedor, tel_contato, email_contato, cupons_utilizados) VALUES
('Miguel Passeios', '(11)95841-2569', 'passeiodomiguel@gmail.com','0'),
('Wesley Souza', '(18)97815-9632', 'wesleyviagemparana@gmail.com','0'),
('Carlos Equino', '(18)95547-8759', 'passeioequinos@gmail.com', '0'),
('Urbans CO', '(11)93527-7651', 'passeios@UrbansCO.com','0');

CREATE TABLE tb_produto (
id_produto INT AUTO_INCREMENT,
nome VARCHAR (30),
valor DECIMAL (10,2),
descricao VARCHAR (250),
url_imagem VARCHAR (200),
fk_id_vend INT,
PRIMARY KEY (id_produto),
FOREIGN KEY (fk_id_vend) REFERENCES tb_vendedores (id_vendedores)
);

INSERT INTO tb_produto (nome, valor, descricao, url_imagem, fk_id_vend) VALUES
('Passeio de Caiaque', '39.99', 'Passeio de Caiaque com segurança pela praia de Maresias', 'URL', '1'),
('Rapel', '109.99', 'Rapel nos melhores pontos da cidade de Londrina', 'URL', '2'),
('Passeio a cavalo', '29.99', 'Passeio a cavalo pela Chacara Santo Antonio', 'URL', '3'),
('Visita aos principais museus', '49.99', 'Visita ao MASP, Pinacoteca, Museu da Imigração Japonesa, Memorial da América Latina', 'URL', '4');

CREATE TABLE tb_categoria (
id_categoria INT AUTO_INCREMENT,
regiao ENUM ('Sul', 'Sudeste', 'Norte', 'Nordeste', 'Centro-Oeste'),
tipo ENUM ('Rural', 'Litoral', 'Urbano', 'Camping', 'Aldeias'),
prioridade ENUM ('Alta', 'Média', 'Baixa'),
fk_produto INT NOT NULL,
PRIMARY KEY (id_categoria),
FOREIGN KEY (fk_produto) REFERENCES tb_produto (id_produto)
);

INSERT INTO tb_categoria (regiao, tipo, prioridade, fk_produto) VALUES
('Sudeste', 'Litoral', 'Alta', '1'),
('Sul', 'Camping', 'Alta', '2'),
('Sul', 'Rural', 'Alta', '3'),
('Sudeste', 'Urbano', 'Média', '4');

CREATE TABLE tb_usuario (
id_usuario INT AUTO_INCREMENT,
 nome VARCHAR (80),
 email VARCHAR (40),
 senha VARCHAR (20),
 PRIMARY KEY (id_usuario)
 ); 
 
INSERT INTO tb_usuario (nome, email, senha) VALUES
('David Castro', 'davidcastro@gmail.com', '12345678'),
('Tiago Teixeira', 'tiagoteixeira@gmail.com', '147258369'),
('Gabriela Lima', 'gabrielalima@gmail.com', '369258147'),
('Diogo Rodrigues', 'diogorodrigues@gmail.com', '321654987'),
('Fernanda Soares', 'fernandasoares@gmail.com', '157359145');
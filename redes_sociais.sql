drop database redes_sociais;
create database redes_sociais;
use redes_sociais;

create table usuarios (
id int not null auto_increment primary key,
nome varchar(100) not null,
email varchar(100) not null unique,
data_criacao date not null
);

create table postagens (
id int not null auto_increment primary key,
texto varchar(255) not null,
data_publicacao varchar(100),
imagens varchar(255),
usuarios_id int not null,
foreign key (usuarios_id) references  usuarios (id)
);

create table comentarios (
id int not null auto_increment primary key,
texto varchar(100) not null,
data_criacao date not null,
postagens_id int not null,
usuarios_id int not null,
foreign key (postagens_id) references postagens (id),
foreign key (usuarios_id) references usuarios (id)
);

create table curtidas (
usuarios_id int not null,
postagens_id  int not null,
primary key  (usuarios_id , postagens_id),
foreign key (postagens_id) references postagens (id),
foreign key (usuarios_id) references usuarios (id)
);

insert into usuarios (nome,email,data_criacao) values ('Gabriel' , 'gabriel@sensi.com' , 04/09/2024);
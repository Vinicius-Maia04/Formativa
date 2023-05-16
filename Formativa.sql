create database Formativa_Maia;
use Formativa_Maia;

create table cargos(
ID bigint not null auto_increment primary key,
Cargo varchar(250) not null,
Permissoes varchar(500) not null
);

create table ocupacoes(
ID bigint not null auto_increment primary key,
Ocupacao varchar(250)
);

create table usuarios(
ID bigint not null auto_increment primary key,
Nome varchar(250) not null,
Email varchar(500) not null,
Data_de_Nascimento date not null,
Data_de_Cadastro date not null,
Senha varchar(100) not null,
OcupacaoFK bigint not null,
CargoFK bigint not null,
foreign key (OcupacaoFK) references ocupacoes(ID),
foreign key (CargoFK) references cargos(ID)
);

create table usuarios_apagados(
ID bigint not null auto_increment primary key,
UsuarioFK bigint not null,
foreign key (UsuarioFK) references usuarios(ID)
);

create table blocos(
ID bigint not null auto_increment primary key,
Bloco varchar(250) not null
);

create table ambientes(
ID bigint not null auto_increment primary key,
Nome varchar(500),
Ocupacao int not null,
BlocoFK bigint not null,
foreign key (BlocoFK) references blocos(ID)
);

create table equipamentos(
ID bigint not null auto_increment primary key,
Nome varchar(250) not null
);

create table CheckList(
ID bigint not null auto_increment primary key,
AmbienteFK bigint not null,
EquipamentoFK bigint not null,
foreign key (AmbienteFK) references ambientes(ID),
foreign key (EquipamentoFK) references equipamentos(ID)
);

create table eventos(
ID bigint not null auto_increment primary key,
Data_de_Criacao date not null default(now()),
Data_do_Evento datetime not null,
Quantidade_de_Vagas int not null,
Tempo_de_CheckIn datetime not null,
OrganizadorFK bigint not null,
foreign key (OrganizadorFK) references usuarios(ID)
);

create table CheckIn(
ID bigint not null auto_increment primary key,
UsuarioFK bigint not null,
EventoFK bigint not null,
foreign key (UsuarioFK) references usuarios(ID),
foreign key (EventoFK) references eventos(ID)
);
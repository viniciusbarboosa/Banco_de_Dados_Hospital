create database hospital;
use hospital;

create table clinico_geral(
id_clinico int auto_increment not null,
cg_nome varchar (30),
cg_crm varchar (20),
primary key (id_clinico)
);

create table cirurgiao(
id_cirurgiao int auto_increment not null,
cir_nome varchar (30),
cir_crm varchar (20),
primary key (id_cirurgiao)
);

create table medico(
id_medico int auto_increment not null,
med_nome varchar(30),
med_crm varchar (20),
primary key (id_medico)
);

create table funcionarios(
id_funcionarios int auto_increment not null,
tipo_funcionario varchar(30),
id_medico int,
id_cirurgiao int,
id_clinico   int,
primary key (id_funcionarios),
foreign key (id_medico) references medico(id_medico),
foreign key (id_cirurgiao) references cirurgiao(id_cirurgiao),
foreign key (id_clinico) references clinico_geral(id_clinico)
);

create table sala_cirurgia(
id_cirugia int auto_increment not null,
numero_sala int,
primary key(id_cirugia)
);

create table clinica_geral(
id_clinica int auto_increment,
numero_sala int,
primary key(id_clinica)
);

create table setor (
id_setor int auto_increment not null,
setor_sala varchar(30),
id_clinica int,
id_cirugia int, 
primary key(id_setor),
foreign key(id_clinica) references clinica_geral(id_clinica),
foreign key ( id_cirugia) references sala_cirurgia(id_cirugia)
);

create table paciente(
id_paciente int auto_increment not null,
pac_nome varchar(30) not null,
pac_cpf varchar(20) not null,
pac_tel varchar (20) not null,
primary key (id_paciente)
);

create table consulta(
id_consulta int auto_increment not null,
id_paciente int ,
consult_data varchar(10) not null,
id_setor int,
id_funcionarios int,
consult_detalhes varchar(80),
primary key (id_consulta),
foreign key (id_paciente) references paciente(id_paciente),
foreign key (id_setor) references setor(id_setor),
foreign key (id_funcionarios) references funcionarios(id_funcionarios)
);

create table bd_hospital(
id_hospital int auto_increment not null,
nome_hospital varchar(30) not null,
id_consulta int ,
primary key(id_hospital),
foreign key  (id_consulta) references consulta(id_consulta)
);


insert into paciente
(pac_nome,pac_cpf,pac_tel)
values
("Ronaldo","719 432 543 88","(81) 98424 7273"),
("Geraldo","753 543 897 12","(81) 98234 7543"),
("Valdo","753 783 324 99","(81) 98222 8843"),
("Claudio","753 789 432 90","(81) 98002 9843"),
("Reinaldo","722 679 432 80","(81) 98934 0022");

insert into clinico_geral
(cg_nome,cg_crm)
values
("Joel","432 764"),
("Manuel","456 909"),
("Daniel","567 876"),
("Ismael","450 991"),
("Misael","543 812");

insert into medico
(med_nome,med_crm)
values
("Samuel","457 992"),
("Afiganistao","402 892"),
("Italia","511 109"),
("Claudia","453 333"),
("Miranda","522 345");

insert into cirurgiao
(cir_nome,cir_crm)
values
("Gabriel","710 992"),
("Jessica","445 777"),
("Christina Rocha","990 190"),
("Silvio","345 789"),
("Marinalva","446 632");

insert into funcionarios
(tipo_funcionario,id_clinico)
values
("Clinico Geral",1),
("Clinico Geral",2),
("Clinico Geral",3),
("Clinico Geral",4),
("Clinico Geral",5);


insert into funcionarios
(tipo_funcionario,id_medico)
values
("Medico",1),
("Medico",2),
("Medico",3),
("Medico",4),
("Medico",5);

insert into funcionarios
(tipo_funcionario,id_cirurgiao)
values
("Cirurgiao",1),
("Cirurgiao",2),
("Cirurgiao",3),
("Cirurgiao",4),
("Cirurgiao",5);

insert into clinica_geral
(numero_sala)
values
(1),
(2),
(3),
(4),
(5);

insert into sala_cirurgia
(numero_sala)
values
(6),
(7),
(8),
(9),
(10);

insert into setor
(setor_sala,id_clinica)
values
("clinica geral",1),
("clinica geral",2),
("clinica geral",3),
("clinica geral",4),
("clinica geral",5);

insert into setor
(setor_sala,id_cirugia)
values
("Sala cirurgia",1),
("Sala cirurgia",2),
("Sala cirurgia",3),
("Sala cirurgia",4),
("Sala cirurgia",5);

insert into consulta
(id_paciente,consult_data,id_setor,id_funcionarios,consult_detalhes)
values
(1,"31-10-2022",1,2,"Sem volta"),
(2,"12-6-2022",2,3,"Sem volta"),
(3,"23-6-2022",3,7,"Marca a volta"),
(4,"24-6-2022",8,8,"Cirurgia de risco"),
(5,"25-6-2022",9,2,"Sem volta");

select * from consulta;



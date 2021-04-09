
drop database trabalho;

create database Trabalho;

use trabalho;

CREATE TABLE Idade_Minima (
Idade INTEGER not null,
ID_Idade INT(2)auto_increment not null PRIMARY KEY
);

CREATE TABLE Escolaridade_Minima (
ID_Escolaridade_Min INT(3)auto_increment not null PRIMARY KEY,
EScolaridade VARCHAR(150) not null
);


CREATE TABLE Curso (
Codigo_Curso INT (2) auto_increment not null PRIMARY KEY,
Nome VARCHAR(50) not null,
Quantidade_de_ciclos VARCHAR(2) not null,
ID_Idade INT(2),
ID_Escolaridade_Min INT(2),
FOREIGN KEY(ID_Idade) REFERENCES Idade_Minima (ID_Idade),
FOREIGN KEY(ID_Escolaridade_Min) REFERENCES Escolaridade_Minima (ID_Escolaridade_Min)
);

CREATE TABLE Bibliografia (
ID_Bibliografia INT(3)auto_increment not null PRIMARY KEY,
Livro VARCHAR(500) not null
);


CREATE TABLE Ementa (
Codigo_Ementa INT(2)auto_increment not null PRIMARY KEY,
Conteudo_programatico VARCHAR(500),
ID_Bibliografia INT(2),
FOREIGN KEY(ID_Bibliografia) REFERENCES Bibliografia (ID_Bibliografia)
);

CREATE TABLE Dias_da_aula (
ID_Dias INT (2) auto_increment not null PRIMARY KEY,
Segunda boolean,
Tersa boolean,
Quarta boolean,
Quinta boolean,
Sexta boolean,
Sabado boolean,
Domingo boolean
);

CREATE TABLE Disciplina (
Codigo_Disciplina INT(2)auto_increment not null PRIMARY KEY,
Nome VARCHAR(50) not null,
ciclo INT(2) not null,
Carga_Horaria INT(5) not null,
Codigo_Ementa INT,
ID_Dias INT (2),
FOREIGN KEY(ID_Dias) REFERENCES Dias_da_aula (ID_Dias),
FOREIGN KEY(Codigo_Ementa) REFERENCES Ementa (Codigo_Ementa)
);

CREATE TABLE Relacao_Disciplina_Curso (
Codigo_Disciplina INT(2),
Codigo_Curso INT(2),
FOREIGN KEY(Codigo_Curso) REFERENCES Curso (Codigo_Curso)
);

CREATE TABLE Sexo (
ID_Sexo INT(2)auto_increment not null PRIMARY KEY,
Genero VARCHAR(10)
);

CREATE TABLE Escolaridade (
ID_Escolaridade INT(2)auto_increment not null PRIMARY KEY,
Escolaridade VARCHAR(100)
);

CREATE TABLE Aluno (
RG VARCHAR(9)not null PRIMARY KEY,
Nome VARCHAR(50)not null,
Data_de_nacimento varchar(10) not null,
Telefone VARCHAR(15),
E_Mail VARCHAR(100),
ID_Escolaridade INT(2),
ID_Sexo INT(2),
FOREIGN KEY(ID_Sexo) REFERENCES Sexo (ID_Sexo),
FOREIGN KEY(ID_Escolaridade) REFERENCES Escolaridade (ID_Escolaridade)
);

CREATE TABLE Professor (
Chapa INT(3)auto_increment PRIMARY KEY,
Nome VARCHAR(50)not null,
Data_de_nacimento varchar(10) not null,
Formacao VARCHAR(200),
E_Mail_institucional VARCHAR(100),
Telefone VARCHAR(15),
E_Mail_pessoal VARCHAR(100),
ID_Sexo INT(2),
FOREIGN KEY(ID_Sexo) REFERENCES Sexo (ID_Sexo)
);



CREATE TABLE Status_C (
ID_Status INT(2)auto_increment not null PRIMARY KEY,
Status_C varchar (10) not null
);

CREATE TABLE Turno (
ID_Turno INT(2)auto_increment not null PRIMARY KEY,
Turno VARCHAR(10) not null
);

CREATE TABLE Turma (
Codigo_Turma INT(2) auto_increment not null PRIMARY KEY,
Termino varchar(10) not null,
ID_Turno INT(2),
ID_Status INT(2),
ID_Dias INT(2),
FOREIGN KEY(ID_Turno) REFERENCES Turno (ID_Turno),
FOREIGN KEY(ID_Status) REFERENCES Status_C (ID_Status),
FOREIGN KEY(ID_Dias) REFERENCES Dias_da_aula (ID_Dias)
);

CREATE TABLE Relacao_Turma_Disciplina (
Codigo_Turma INT(2),
Codigo_Disciplina INT(2),
FOREIGN KEY(Codigo_Turma) REFERENCES Turma (Codigo_Turma),
FOREIGN KEY(Codigo_Disciplina) REFERENCES Disciplina (Codigo_Disciplina)
);

CREATE TABLE Relacao_Aluno_Curso (
RG VARCHAR(11),
Codigo_Curso INT(2),
FOREIGN KEY(RG) REFERENCES Aluno (RG),
FOREIGN KEY(Codigo_Curso) REFERENCES Curso (Codigo_Curso)
);

CREATE TABLE Relacao_Professor_Turma (
Chapa INT(2),
Codigo_Turma INT(2),
FOREIGN KEY(Chapa) REFERENCES Professor (Chapa),
FOREIGN KEY(Codigo_Turma) REFERENCES Turma (Codigo_Turma)
);

CREATE TABLE Relacao_Aluno_Turma (
RG VARCHAR(11),
Codigo_Turma INT(2),
FOREIGN KEY(RG) REFERENCES Aluno (RG),
FOREIGN KEY(Codigo_Turma) REFERENCES Turma (Codigo_Turma)
);

insert into idade_minima(Idade)values
(18),(14),(40),(7),(10),(15),
(17);



insert into escolaridade_minima(Escolaridade)values
('Cursando o ensino médio'),('Ensino médio compreto'),('Cursando o ensino superior'),
('Ensino superior completo');

insert into curso(Nome,Quantidade_de_ciclos,ID_Idade,ID_Escolaridade_Min)values
('Mecanico de manutenção',3,6,1),('Engearia civil',7,1,2),('Curso de Custura',20,null,null);

insert into bibliografia(livro)values
('Gerenciamento das Aquisições em Projetos'),('Equipamentos Mecânicos. Análise de Falhas e Solução de Problemas'),
('Automação Hidráulica. Projetos, Dimensionamento'),('Custura para leigos'),
('Alfaiataria: modelagem plana masculina');

insert into ementa(Conteudo_programatico,ID_Bibliografia)values
('Conteudo sobre Automação hidráulica basica(eletrohidráulica)',3),
('Nosoes de custura basica(corte,tipo de custura,etc..)',4),
('Análise de falhas e solução de equipamentos mecânico(Manutenção preventiva,preditiva e corretiva)',2);



insert into Dias_da_aula(Segunda,Tersa,Quarta,Quinta,Sexta,Sabado,Domingo)values
(true,true,true,true,true,false,false),(true,true,true,true,false,false,false),
(true,true,false,true,true,true,false),(true,true,false,true,true,false,false),
(false,false,false,false,true,true,false);

insert into disciplina(Nome,ciclo,Carga_Horaria,Codigo_Ementa,ID_Dias)values
('Matemaica',1,155,1,3),('Hidráulica',2,50,1,3),('Eletrohidráulica',5,100,1,3),
('Propiedade dos fluidos',4,75,1,3),('Soluções de falhas',8,20,1,3),('Ferramentas hidráulicas',10,75,1,3),
('Corte basico',1,50,2,3),('Ferramentas de custura',4,25,2,3),('Manutenção de ferramentas',2,75,2,3),
('Tesidos',2,40,2,3),('Tipos de custura',8,100,2,3),('Custura de calsados',9,150,2,3),
('Feramentade de manutenção',1,50,3,3),('Manutenção preventiva',3,40,3,3),('Manutenção preditiva',6,100,3,3),
('Manutenção corretiva',9,75,3,3),('Análise de falhas',7,150,3,3),('Propiedades dos materiais',4,100,3,3);


insert into Sexo(Genero)values
('Feminino'),('Masculino'),('Indefinido');



insert into Escolaridade(Escolaridade)values
('Sem escolaridade'),('Cursando o ensino médio'),('Ensino médio compreto'),
('Cursando o ensino superior'),('Ensino superior completo');

insert into aluno(RG,Nome,Data_de_nacimento,Telefone,E_Mail,ID_Escolaridade,ID_Sexo)values
(246594877,'Julio','20-02-1998','51945774851','julio.1998@gmail.com',2,2),
(845194872,'Julia','05-12-1997','55985454851','julia.05128@gmail.com',2,1),
(232154627,'Jader','15-05-1999','51942274951','jader.145@hotmail.com',3,2),
(265878137,'Amanda','30-03-2000','55979648512','amenda.samtos8@gmail.com',4,1),
(945194874,'Alice','25-09-1990','55945224551','alice.90@hotmail.com',3,1),
(248197788,'Mario','20-02-1992','51941234851','mario.mario@hotmail.com',2,2),
(955194874,'Marcio','19-03-1995','51999774851','marcio.dj@gmail.com',1,1),
(245612274,'Henrique','06-04-1999','55999777485','henrique.hen@gmail.com',3,2),
(845335574,'Maria','07-02-1992','51945714851','maria.898@hotmail.com',3,1),
(249194874,'Jose','19-12-1999','55945766851','jose.je@gmail.com',2,2),
(245194444,'Armando','08-02-2001','51945744441','armando.amando8@hotmail.com',1,2),
(544194123,'Jessica','20-02-1985','51945771251','194658jj@gmail.com',1,1),
(645123841,'Carlos','04-05-1992','5594446651','carlos21@gmail.com',3,2),
(145194174,'Rozana','09-10-2000','55915764851','rozaxox@hotmail.com',3,1),
(445112874,'Katia','04-01-1992','55945787941','katia4561@hotmail.com',2,1),
(275194556,'Fernanda','20-02-2001','55999948512','Fer5666@gmail.com',3,1),
(245194874,'Fabiano','11-11-1998','51996474851','465jjf24@hotmail.com',4,2),
(845194874,'Carla','12-02-1995','55945995551','carla222@gmail.com',2,1),
(645111874,'João','01-02-1989','55945722221','jo213@gmail.com',4,2),
(445114234,'Mario','07-02-1988','55995774251','mario.ario@hotmail.com',2,2),
(555194874,'Brenda','20-04-2005','55998544851','www5554@gmail.com',4,1),
(295194874,'Juliana','06-30-1998','55996774851','juliana@hotmail.com',2,1),
(945134874,'Carlos','22-09-1995','51985974851','carloscar@gmail.com',3,2),
(845178874,'Mateus','08-02-1999','55999994851','mateus1123@hotmail.com',2,2),
(145192874,'Mariana','20-02-2006','51913244851','mariana22@hotmail.com',1,1),
(745194874,'Fabiana','25-11-2003','55945723123','fabi12@hotmail.com',2,1),
(545194874,'Cesar','23-05-1999','55995774851','2305cdr@gmail.com',2,2),
(265194874,'Rafael','30-12-1989','55945123451','rafael2221@gmail.com',4,2),
(345194874,'Amanda','20-02-1998','51912774851','amanda.anda@hotmail.com',3,1),
(123194874,'Mario','01-01-1998','55999444851','mario2141@hotmail.com',3,2)
;


insert into professor(Chapa,Nome,Data_de_Nacimento,Formacao,E_Mail_institucional,Telefone,E_Mail_Pessoal,ID_Sexo) values
(134,'João','10-02-1999','Engearia mecanica,Pedagogia','joao.qi@edu.com.br','51996451278','joao123@hotmail.com',2),
(135,'Carlos','01-10-1989','Engearia mecanica,Pedagogia,tecnico de manutenção','carlos.qi@edu.com.br','51996661278','carlor.211@hotmail.com',2),
(154,'Amanda','05-05-1992','Tecnico de custura','amanda.qi@edu.com.br','51944451278','amanda.314@hotmail.com',1),
(534,'Adre','25-06-1993','Engearia mecanica,','adre.qi@edu.com.br','51996445278','adredf@gmail.com',2),
(434,'Mario','10-12-1999','Tecnico de custura,Pedagogia','mario.qi@edu.com.br','51996123478','mariooq@hotmail.com',2),
(144,'Juana','13-05-1990','Engearia mecanica,Pedagogia,Especialização em hidraulica','juana.qi@edu.com.br','51996451273','juana@gmail.com',1),
(164,'João','10-02-1999','Engearia mecanica,Pedagogia','joao.qi@edu.com.br','51996451278','joao123@hotmail.com',2),
(634,'João','10-02-1999','Engearia mecanica,Pedagogia','joao.qi@edu.com.br','51996451278','joao123@hotmail.com',2),
(136,'João','10-02-1999','Engearia mecanica,Pedagogia','joao.qi@edu.com.br','51996451278','joao123@hotmail.com',2),
(834,'João','10-02-1999','Engearia mecanica,Pedagogia','joao.qi@edu.com.br','51996451278','joao123@hotmail.com',2)
;

insert into Status_C(Status_C)values
('Em andamento'),('Concluido');

insert into Turno(Turno)values
('Manhã'),('Tarde'),('Noite');

insert into Turma(Termino,ID_Turno,ID_Status,ID_Dias)values
('22-12-2020',1,2,3),('29-05-2019',2,1,3),('04-07-2022',3,2,4);

insert into Relacao_Turma_Disciplina(Codigo_Turma,Codigo_Disciplina)values
(1,2),(2,4),(3,1);

insert into Relacao_Aluno_Curso(RG,Codigo_Curso)values
(249194874,2),(845194872,3),(232154627,1);

insert into Relacao_Professor_Turma(Chapa,Codigo_Turma)values
(534,3),(434,2),(834,1);

insert into Relacao_Aluno_Turma(RG,Codigo_Turma)values
(246594877,1),(845194872,1),(232154627,1),(265878137,1),(945194874,1),(248197788,1),(955194874,1),(245612274,1),
(845335574,2),(249194874,2),(245194444,2),(645123841,2),(145194174,2),(445112874,2),(275194556,2),(245194874,2),
(845194874,3),(645111874,3),(445114234,3),(555194874,3),(295194874,3),(945134874,3),(545194874,3),(123194874,3);


select nome,E_Mail from aluno where E_Mail like '%gmail%';

select nome,Telefone from aluno where Telefone like '51%';

select nome,Telefone from Professor where Formacao like 'Tecnico%';

select nome,Ciclo from Disciplina where Carga_Horaria <=100 order by Ciclo;

select livro from bibliografia where livro like '%hidráulica%';

select nome,Telefone from Sexo,aluno where Genero = 'Feminino' and Sexo.ID_Sexo=aluno.ID_Sexo order by nome;

select nome,E_Mail,Telefone from aluno,Escolaridade where Escolaridade = 'Sem escolaridade' and escolaridade.ID_Escolaridade = aluno.ID_Escolaridade order by nome;

select nome,Telefone from Sexo,Professor where Genero = 'Masculino' and Sexo.ID_Sexo = Professor.ID_Sexo order by nome;

select nome,E_Mail from aluno,turma,Relacao_Aluno_Turma where Relacao_Aluno_Turma.Codigo_Turma = 1 and Relacao_Aluno_Turma.Codigo_Turma = Turma.Codigo_Turma and Relacao_Aluno_Turma.RG = aluno.RG order by nome;

select* from Turma,Turno where Turno = 'Manhã' and Turno.ID_Turno = Turma.ID_Turno; 





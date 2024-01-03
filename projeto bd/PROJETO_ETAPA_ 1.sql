--- vamos a isso---

--vamos preparar a conexao e base de dados 
-- assim, vamos podendo executando os codigos


---part 1---
----Criar TABELAS-----

---- Criar base de dados em nome GSI

create Database GSI;
use gsi;

--- criar a tabela de medico
create table medico
   (
   id_medico              int(11)   not null,
   nome                   varchar(200),
   data_nascimento        date,
   telemovel              varchar(15) unique,
   cedula_profissional    varchar(15) unique,
   observacoes            varchar(2000)
   )
   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de medico';

  
show create table medico;

insert into medico 
(id_medico,nome,data_nascimento,telemovel,cedula_profissional,observacoes)
 values 
   (1, 'Ricardo Alves', '1985-10-10', '912345678', '01723', 'Hospital de Santo Ant�nio, Centro Hospitalar do Porto 2003-2009 - Internato da Especialidade de Ortopedia, Hospital de Santo Ant�nio, Porto'),
   (2, 'Adriana Moutinho', '1989-04-25', '923478901', '59024', 'Desde 2015 Assistente Hospitalar de Psiquiatria Servi�o de Psiquiatria Hospital de Cascais Dr. Jose de Almeida'),
   (3, 'Afonso de Oliveira Pegado', '1984-09-08', '912034567', '10234', 'Desde 2019 - Unidade de Dor do Hospital Garcia de Orta Desde 2019 - Sport Lisboa e Benfica'),
   (4, 'Adriana Ondina Pestana Santos', '1982-01-03', '916230784', '61358' , 'M�dica de fam�lia USF Santa Cruz, Silveira 2019-2020 - AP Pediatria CUF Torres Vedras'),
   (5, 'Aristoteles David Rosmaninho', '1963-04-07', '927564301', '12034', 'Desde 2016 - Hospital CUF Viseu 2007-2016 - Cl�nica privada 1981-2007 - Coordenador do Servi�o de Dermatologia, Hospital de Viseu');
select * from medico;
--- mostre que foram inseridas as linhas requeridas



--- criar a tabela de gabinet
create table gabinete
   (
   id_gabinete    int(11) not null,
   descricao      varchar(200)
   )
   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de gabinete';


show create table gabinete;


insert into gabinete 
(id_gabinete, descricao)
 values
   (1, 'otorrino'),
   (2, 'oftalmologico'),
   (3, 'dermatologia'),
   (4, 'cirurgia'),
   (5, 'psicologia');
select * from gabinete;
--- mostre que foram inseridas as linhas requeridas



--- criar a tabela de utente
create table utente
(
id_utente         int(11),
nome              varchar(200),
morada            varchar(200),
codigo_postal     varchar(100),
telefone          varchar(15),
id_seguro         varchar(30) NULL UNIQUE,
id_tipo_seguro    varchar(10)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de utente';
show create table utente;

insert into utente
 (id_utente,nome,morada,codigo_postal,telefone,id_seguro, id_tipo_seguro )
  values 
   (1, 'Juan Silvas', 'Av. de Madrid Lote 45, 1B', '2675-477', '911174803', 1, 2),
   (2, 'lili Cabelo', 'Av. de Madrid Lote 45, 2A', '2675-477', '93535677', 2,2),
   (3, 'Hugo Oliveira ', 'Rua Fernando Santos numero 7, 1c', '1100-348', '927700518',3,3 ),
   (4, 'Cristina Ferreira', 'Av. de Liberdade Lote 209, 1D', '1100-116', '911375804',4,4),
   (5, 'David Martins', 'Av. de Senhor Padre Cruz numero 629, 7F', '1300-452', '910023468',5,5);

select * from utente;




--- criar a tabela de tipo_seuro
create table tipo_seguro
(
   id_tipo_seguro    varchar(10),
   descricao         varchar(1000)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de tipo_seguro';

show create table tipo_seguro;

insert into tipo_seguro (id_tipo_seguro, descricao) values
   (1, 'Multicare'),
   (2, 'Medicare'),
   (3, 'Medis'),
   (4, 'Fidelidade'),
   (5, 'Socalmed');
   
select * from tipo_seguro;


---criar a tablea de especialidade_medico
create table especialidade_medico
(
   id_especialidade    int(11),
   id_medico           int(11)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT=' Guarda dados de especialidade_medico';

show create table especialidade_medico;

---criar a tablea de horario_base

create table horario_base
  (
   id_medico             int(11),
   dia_semana            enum('SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM') check (dia_semana in ('SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM')),
   hora_inicio           int(4) check (hora_inicio >= 0000  or hora_inicio <= 2359),
   hora_fim              int(4) check (hora_fim >= 0000 or hora_fim >= 2359),
   duracao_consulta      int(3) check (duracao_consulta >=  0005 or duracao_consulta <= 0130)
   )
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT=' Guarda dados de horario_base';

show create table horario_base;

---criar a tablea de consulta

create table consulta
  (
     id_consulta             int(11),
     id_medico               int(11) UNIQUE,
     id_gabinet              int(11) UNIQUE,
     dia                     date    UNIQUE,
     hora_inicio             int(4)  UNIQUE,
     hora_fim                int(4)  check (hora_fim >= 0000 or hora_fim <= 2359),
     id_utente               int(11),
     constraint CK_hora      check ((hora_inicio < hora_fim) and (hora_fim - hora_inicio >= 0005 or hora_fim - hora_inicio <= 0130))
  )
  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de consulta';

show create table consulta;

--- create a tablea de anotacoes_consulta
create table anotacoes_consulta
  (
     id_anotacao          int(11),
     anotacao             varchar(200),
     id_consulta          int(11) 
  )
  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de anotacoes_consulta';
show create table anotacoes_consulta;

--- create a tabla de especialidade
create table especialidade
  (
      id_especialidade      int(11),
      nome                  varchar(100),
      descricao             varchar(2000)
  )
   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de especialidade';

 show create table especialidade;


insert into especialidade
 (id_especialidade, nome,descricao ) 
 values
   (1, 'patologica', null),
   (2, 'cardiologia', null),
   (3, 'dermatologia', null),
   (4, 'pediatria', null),
   (5, 'urologia', null);

select * from especialidade;


 ---create a tabela de exame_medico
 create table exame_medico
   (
      id_exame_medico        int(11),
      id_consulta             int(11),
      id_tipo_exame_medico    int(11),
      data_exame              date,
      relatorio               varchar(2000),
      imagem                  varchar(500)
   )
   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de exame_medico';
   
show create table exame_medico;

insert into exame_medico
 (id_exame_medico, id_consulta, id_tipo_exame_medico,data_exame, relatorio, imagem )
  values
   (1, 1, 1, '2022-04-11', 'Antecedentes familiares de alergias, rinite ou eczemas al�rgicos', null),
   (2, 2, 2, '2021-11-01', 'diagnostico patologias verificadas e respectiva classificacao', null),
   (3, 3, 3, '2019-09-16', null, null),
   (4, 4, 4, '2020-03-05', null, null),
   (5, 5, 5, '2021-11-12', null, null);

select * from exame_medico;

   ----criar a tabela de tipo_exame_medico
   create table tipo_exame_medico
    (
       id_tipo_exame_medico    int(11),
       descricao               varchar(200)
    )
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci COMMENT='Guarda dados de tipo_exame_medico';
 
show create table tipo_exame_medico;
---part 1---



--- Usando instru��es de consulta mostre que n�o h� valores repetidos nos seguintes campos: utente.id_seguro, medico.telemovel, medico.cedula_profissional;
select id_seguro from utente;
select  telemovel,cedula_profissional from medico; 

----executando a linha 225 mostrou um engano, faltava uns digitos no nemero de telemovel desse medico.
update medico
set telemovel = '916780234'
where id_medico = 4;
select  telemovel,cedula_profissional from medico; 

----executando a linha 231 mostrou que cedula_profissional n�o esta no formato que est� pedido:
update medico
set cedula_profissional = '48120'
where id_medico = 4;
select  telemovel,cedula_profissional from medico; 



--- Altere a morada de todos os clientes que vivem na Avenida de Madrid Lote 45 para a mesma avenida, n� 14

select id_utente, nome, morada
from utente
where morada like 'Av. de Madrid Lote 45%' ;

-- filrar a morada nos ajuda perceber a quem a altera��o tem de ser feita.

update utente
set morada = 'Av. de Madrid n� 14, 1B'
where id_utente = 1


update utente
set morada = 'Av. de Madrid n� 14, 2A'
where id_utente = 2

--- VER SE FORAM ALTERADAS
select id_utente, nome, morada
from utente


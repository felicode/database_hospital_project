--- Etapa 2


use gsi;
show tables;

--- ETAPA 2 -10
----  Add(definir) foreign keyes

---add FK a tabela  especialidade_medico
alter table especialidade_medico
add CONSTRAINT FK_id_medic_especialidade_medico
FOREIGN KEY (id_medico) References medico (id_medico);

--- Add FK a tabela horario_base
alter table horario_base
add CONSTRAINT FK_id_medico_horario_base
FOREIGN KEY (id_medico) References medico (id_medico);


--- Add FK a tabela consulta
alter table consulta 
add CONSTRAINT FK_id_medico_consulta
FOREIGN KEY (id_medico) References medico (id_medico);


--- Add FK a tabela consulta 
alter table consulta 
add CONSTRAINT FK_id_gabinete_consulta
FOREIGN KEY (id_gabinete) References gabinete (id_gabinete);

--- Add FK a tabela consulta 
alter table consulta 
add CONSTRAINT FK_id_utente_consulta
FOREIGN KEY (id_utente) References utente (id_utente);

--- Add FK a tabela especialidade_medico
alter table consulta 
add CONSTRAINT FK_id_especialidade_especialidade_medico
FOREIGN KEY (id_especialidade) References especialidade (id_especialidade);

--- Add FK a tabela especialidade_medico
alter table exame_medico 
add CONSTRAINT FK_id_consulta_exame_medico
FOREIGN KEY (id_consulta) References consulta (id_consulta);

--- Add FK a tabela anotacoes
alter table anotacoes_consulta 
add CONSTRAINT FK_id_consulta_anotacoes_consulta 
FOREIGN KEY (id_consulta) References consulta (id_consulta);

--- Add FK a tabela exame_medico
alter table exame_medico 
add CONSTRAINT FK_id_tipo_exame_medico_exame_medico
FOREIGN KEY (id_tipo_exame_medico) References tipo_exame_medico (id_tipo_exame_medico);







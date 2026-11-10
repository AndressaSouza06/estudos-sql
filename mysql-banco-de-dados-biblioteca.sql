create table assuntos (
  id int auto_increment primary key,
  nome varchar(30)
  );
  show tables;
  describe assuntos;
  create table livros (
  id int auto_increment primary key,
  titulo varchar(50) not null,
  autor varchar(50) not null,
  assunto_id int,
  datalan date,
  copias int,
  foreign key (assunto_id) references assuntos(id)
  );
  describe livros;
  create table alunos (
  id int auto_increment primary key,
  nome varchar(50) not null,
  email varchar(50) not null,
  fone varchar(20)
  );  
  create table emprestimos (
  id int auto_increment primary key,
  aluno_id int,
  livro_id int,
  dataret date,
  dataprev date,
  datadev date,
  multa float(6,2),
  foreign key (aluno_id) references alunos(id),
  foreign key (livro_id) references livros(id)
  );
  describe emprestimos;
  -- inclusão de dados:
  insert into assuntos (nome) values
  ('Esporte'),
  ('Política'),
  ('Informática'),
  ('Atualidades');
   insert into assuntos (nome) values
  ('Redes');
  select * from assuntos;
  insert into alunos (nome, email, fone) values
  ('João da Silva', 'joao@email.com', '19 3454322'),
('Sebastião de Souza', 'tiao@email.com', '11 2340322'),
('Rafael Ferreira', 'fael@email.com', '19 93454302'),
('Samuel Ferreira', 'samuca@email.com', '19 93344322');
 
select * from alunos;
insert into livros (titulo, autor, assunto_id, datalan, copias) values
('Morcegos Negros', 'Lucas Figueiredo', 2, '2000-01-10', 5),
('Fubebol Raiz', 'Zico da Silva', 1, '2013-12-12', 10),
('Banco de Dados', 'Deitel ', 3, '1999-11-23', 20);
  select * from livros;
insert into emprestimos (aluno_id, livro_id, dataret, dataprev) values
(1, 4, '2013-08-29', '2013-09-29'),
(2, 5, '2013-07-29', '2025-10-01');
  select * from emprestimos;
insert into livros (titulo, autor, assunto_id, datalan, copias) values
('Programando em Java', 'João Programador', 3, '2012-01-10', 5),
('Voleibol Raiz', 'Joana do Volei', 1, '2011-12-12', 10);
insert into livros (titulo, autor, assunto_id, datalan, copias) values
('Tecnologia em Redes de Computadores','Alberto das redes', 3, '2011-10-04', 5);
  select * from livros;
  select * from assuntos;
  update livros set assunto_id=5 where id=9;
  -- selects: 
  -- 1:
  select titulo Título, autor Autor, datalan 'Data Lançamento'
  from livros order by titulo;
  -- 2:livros lançados em 2011 ou 2012:
  select * from livros 
  where year(datalan)=2011 or year(datalan)=2012;
  -- 3: palavra "Redes" no livro:
  select * from livros 
  where titulo like '%Redes%';
  -- 4: título, nome do assunto e número de cópias do livro:
  select l.titulo Título, a.nome Assunto, l.copias 'Número de cópias'
  from livros l inner join assuntos a on (a.id=l.assunto_id);
  -- 5: título, autor dos livros que tenha Redes no assunto.
  select titulo Título, autor Autor 
  from livros join assuntos on(assuntos.id=livros.assunto_id)
  where assuntos.nome like'%Redes%';
  -- 6: nome do assunto e número de livros agrupado por assunto:
  select a.nome Assunto, sum(l.copias) 'Qtde por assunto' 
  from assuntos a inner join livros l on (a.id=l.assunto_id)
  group by a.nome;
  use qualificasp;
  -- 7: Alterar o número de cópias aumentando 2 dos números de cópias inferiores a 10
  -- No MySQL não funcionou.
  select * from livros where copias < 10;
  update livros set copias = copias+2 
  where copias<10;
  -- 8: título do livro, nome do aluno e data retirada:
  select * from emprestimos;
  select l.titulo Título, a.nome Aluno, e.dataret Retirada 
  from livros l join emprestimos e on (l.id=e.livro_id)
  join alunos a on (a.id=e.aluno_id);
  select * from emprestimos;
  update emprestimos set multa=5.50 where id=5 or id=6;
  -- 9: somar as multas dos livros retirados em 2013
  select sum(multa) 'Soma das multas'
  from emprestimos
  where year(dataret)=2013;
  -- 10: inserir um novo aluno:
   insert into alunos (nome, email, fone) values
  ('Novo Aluno', 'novo@email.com', '19 123456');
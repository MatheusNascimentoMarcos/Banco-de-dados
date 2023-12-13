CREATE TABLE Season 
( 
 Ano varchar(10),  
 Semestre varchar(10),  
 Patrocínio varchar (50) not Null,  
 Premiação INT NOT NULL,
 CONSTRAINT pk_Season PRIMARY key (Ano,Semestre)
);

CREATE TABLE Equipe ( 
Id integer PRIMARY KEY );


CREATE TABLE Ranking
(
  Elo varchar(25),
  Ano varchar(10),
  Semestre varchar(10),
  CONSTRAINT fk_season FOREIGN key (Ano, Semestre) references Season(ano, semestre),
  constraint pk_rank primary key (Elo, Semestre, Ano)

);

CREATE TABLE Jogador ( 
 Nick varchar(50) PRIMARY KEY,  
 Idade integer not NULL,  
 Sexo varchar(10) NOT NULL,  
 idEquipe integer,
 elo varchar(25),
  ano varchar(10),
  semestre varchar(10),
   FOREIGN KEY (idEquipe)
      REFERENCES Equipe(ID),
   FOREIGN KEY (elo, ano, semestre)
       REFERENCES Ranking(Elo, ano, semestre));
       
ALTER TABLE Jogador ADD COLUMN partidasGanhas INTEGER DEFAULT 0;

CREATE TABLE Organizacao (
 Nome char(50),
 Endereco char(125),
 CONSTRAINT pk_org PRIMARY KEY (Nome,Endereco));

CREATE TABLE Coach 
( 
 Nome varchar (50) PRIMARY KEY,
 NomeOrg varchar(50),  
 EndOrg varchar(125),
 CONSTRAINT fk_org FOREIGN KEY (NomeOrg, EndOrg) REFERENCES organizacao(nome, endereco)
);

CREATE TABLE Skins 
( 
 Preço integer not NULL,  
 Nome varchar(50) PRIMARY KEY  
); 

CREATE TABLE Campeonato 
( 
  Nome varchar(50) PRIMARY KEY,
  Ano varchar(10),
  Semestre char(10),
  CONSTRAINT fk_season FOREIGN key (Ano, Semestre) references Season(ano, semestre)
);

CREATE TABLE Partida 
( 
 Data_partida date,  
 Sala varchar(25),
 Ano char(10),
 Semestre char(10),
 IDAzul integer,
 IDVermelho integer,
 CONSTRAINT pk_Partida PRIMARY KEY(Data_partida,Sala),
 CONSTRAINT fk_eqpA FOREIGN KEY (IdAzul)REFERENCES equipe(id),
 CONSTRAINT fk_eqpV FOREIGN KEY (IdVermelho)REFERENCES equipe(id),
 CONSTRAINT fk_Season FOREIGN key (Ano,Semestre) REFERENCES season(Ano,Semestre)
);


CREATE TABLE Runas 
( 
 Nome varchar(50) PRIMARY KEY  
); 



CREATE TABLE Personagens 
( 
 Nome varchar(50) PRIMARY KEY,
 NomeSkin varchar(25),
 NomeRuna varchar(50),
 CONSTRAINT fk_skin FOREIGN key (NomeSkin) REFERENCES skins(nome),
 CONSTRAINT fk_runa FOREIGN key (NomeRuna) REFERENCES runas(nome));



CREATE TABLE Habilidades 
( 
 Nome varchar(50) PRIMARY KEY,  
 Tipo varchar(25),
 NomePersonagem varchar(50),
 CONSTRAINT fk_personagem FOREIGN key (NomePersonagem)
 REFERENCES Personagens(Nome)
);

CREATE TABLE Itens 
( 
 Nome varchar(50) PRIMARY KEY  
); 

CREATE TABLE Classe 
( 
 Nome varchar(50) PRIMARY KEY  
); 


CREATE TABLE Build (
  NomeItem varchar(25),
  NomePersonagem varchar(50),
  CONSTRAINT fk_personagem FOREIGN key (NomePersonagem) REFERENCES Personagens(Nome),
  constraint fk_itens foreign key (nomeItem) references itens(nome),
  CONSTRAINT pk_build PRIMARY KEY(NomePersonagem,NomeItem));
  

CREATE TABLE Draft (
  sala varchar(25),
  Data_partida date,
  NomePersonagem varchar(50),
  CONSTRAINT fk_personagem FOREIGN key (NomePersonagem) 
  REFERENCES Personagens(Nome),
  CONSTRAINT fk_partida FOREIGN KEY (Data_partida,Sala) 
  REFERENCES Partida(Data_partida,Sala),
  CONSTRAINT pk_draft PRIMARY KEY(NomePersonagem,sala, Data_partida)
);


CREATE TABLE Tipo (
  NomeClasse varchar(25),
  NomePersonagem varchar(50),
  CONSTRAINT pk_Tipo PRIMARY KEY(NomeClasse,NomePersonagem)
  );
 

  CREATE TABLE Contratacao (
   id int,
   NomeOrg CHAR(50),
   EndOrg CHAR(125),
   CodCoach CHAR(50),
   Periodo CHAR(10),
   Valor float,
   CONSTRAINT fk_coach FOREIGN KEY (CodCoach) REFERENCES coach(nome),
   CONSTRAINT fk_org FOREIGN KEY (NomeOrg, EndOrg) REFERENCES organizacao (nome, endereco),
   constraint fk_equipe foreign key (id) references equipe(id),
   CONSTRAINT pk_Contrato PRIMARY KEY(EndOrg,NomeOrg,id)
  );


------------Inserções--------------

-- Inserção de Organizações
INSERT INTO organizacao VALUES ('Coca-Cola', 'Bangu');
INSERT INTO organizacao VALUES ('Loud', 'São Paulo');
INSERT INTO organizacao VALUES ('Kabum', 'Porto Alegre');
INSERT INTO organizacao VALUES ('Flamengo Los Grandes', 'Rio de Janeiro');
INSERT INTO organizacao VALUES ('Pain', 'São Paulo');
INSERT INTO organizacao VALUES ('MonoChampions', 'Bahia');
INSERT INTO organizacao VALUES ('SK Telecom T1', 'Seul');
INSERT INTO organizacao VALUES ('Cloud9', 'Los Angeles');
INSERT INTO organizacao VALUES ('Fnatic', 'Londres');
INSERT INTO organizacao VALUES ('G2 Esports', 'Berlim');
INSERT INTO organizacao VALUES ('Team Liquid', 'Los Angeles');
INSERT INTO organizacao VALUES ('T1', 'Seul');
INSERT INTO organizacao VALUES ('Invictus Gaming', 'Shanghai');
INSERT INTO organizacao VALUES ('Edward Gaming', 'Xangai');
INSERT INTO organizacao VALUES ('Royal Never Give Up', 'Pequim');
INSERT INTO organizacao VALUES ('Gambit Esports', 'Moscou');
INSERT INTO organizacao VALUES ('Team SoloMid', 'Los Angeles');
INSERT INTO organizacao VALUES ('100 Thieves', 'Los Angeles');
INSERT INTO organizacao VALUES ('Evil Geniuses', 'San Francisco');



-- Inserção de Seasons
Insert Into Season Values('2022','1º','Kit-Kat', 100000);
Insert Into Season Values('2022','2º','Globo', 2000000);
Insert Into Season Values('2020','1º','Sportv', 500000);
Insert Into Season Values('2020','2º','Intel', 400000);
Insert Into Season Values('2021','1º','Prefeitura-Rio',4000000);
Insert Into Season Values('2021','2º','Chilli-Beans',1200000);

INSERT INTO Equipe VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19);



INSERT INTO Runas VALUES ('Triunfo'), ('Eletrocutar'), ('Cometa'), ('Calçados Mágicos'), ('Entrega de Biscoitos'), ('Ritmo Fatal'), ('Conquistador'), ('Golpe de Escudo'), ('Dilaceração'), ('Superando o Limite'), ('Colheita Sombria'), ('Escudo de Osso'), ('Conquistador Ardente'), ('Golpe Absoluto'), ('Mão dos Mortos'), ('Determinação Implacável'), ('Vitalidade Inabalável'), ('Precisão Letal'), ('Guardião'), ('Cometa Etéreo');



-- Inserção de Rankings para 2022
INSERT INTO Ranking VALUES ('Desafiante', '2022', '1º');
INSERT INTO Ranking VALUES ('Desafiante', '2022', '2º');
INSERT INTO Ranking VALUES ('Diamante', '2022', '1º');
INSERT INTO Ranking VALUES ('Diamante', '2022', '2º');
INSERT INTO Ranking VALUES ('Grão-Mestre', '2022', '1º');
INSERT INTO Ranking VALUES ('Grão-Mestre', '2022', '2º');
INSERT INTO Ranking VALUES ('Mestre', '2022', '1º');
INSERT INTO Ranking VALUES ('Mestre', '2022', '2º');
INSERT INTO Ranking VALUES ('Platina', '2022', '1º');
INSERT INTO Ranking VALUES ('Platina', '2022', '2º');
INSERT INTO Ranking VALUES ('Ouro', '2022', '1º');
INSERT INTO Ranking VALUES ('Ouro', '2022', '2º');
INSERT INTO Ranking VALUES ('Prata', '2022', '1º');
INSERT INTO Ranking VALUES ('Prata', '2022', '2º');
INSERT INTO Ranking VALUES ('Bronze', '2022', '1º');
INSERT INTO Ranking VALUES ('Bronze', '2022', '2º');

-- Inserção de Rankings para 2021
INSERT INTO Ranking VALUES ('Desafiante', '2021', '1º');
INSERT INTO Ranking VALUES ('Desafiante', '2021', '2º');
INSERT INTO Ranking VALUES ('Diamante', '2021', '1º');
INSERT INTO Ranking VALUES ('Diamante', '2021', '2º');
INSERT INTO Ranking VALUES ('Grão-Mestre', '2021', '1º');
INSERT INTO Ranking VALUES ('Grão-Mestre', '2021', '2º');
INSERT INTO Ranking VALUES ('Mestre', '2021', '1º');
INSERT INTO Ranking VALUES ('Mestre', '2021', '2º');
INSERT INTO Ranking VALUES ('Platina', '2021', '1º');
INSERT INTO Ranking VALUES ('Platina', '2021', '2º');
INSERT INTO Ranking VALUES ('Ouro', '2021', '1º');
INSERT INTO Ranking VALUES ('Ouro', '2021', '2º');
INSERT INTO Ranking VALUES ('Prata', '2021', '1º');
INSERT INTO Ranking VALUES ('Prata', '2021', '2º');
INSERT INTO Ranking VALUES ('Bronze', '2021', '1º');
INSERT INTO Ranking VALUES ('Bronze', '2021', '2º');


INSERT INTO Coach (Nome, NomeOrg, EndOrg)
VALUES
    ('Cariok', 'Flamengo Los Grandes', 'Rio de Janeiro'),
    ('Maestro', 'Pain', 'São Paulo'),
    ('Gorilla', 'Kabum', 'Porto Alegre'),
    ('Von', 'Loud', 'São Paulo'),
    ('Brance', 'Coca-Cola', 'Bangu'),
    ('kkOma', 'MonoChampions', 'Bahia'),
    ('Kkoma', 'SK Telecom T1', 'Seul'),
    ('Reapered', 'Cloud9', 'Los Angeles'),
    ('Rekkles', 'Fnatic', 'Londres'),
    ('GrabbZ', 'G2 Esports', 'Berlim'),
    ('Jatt', 'Team Liquid', 'Los Angeles'),
    ('Faker', 'T1', 'Seul'),
    ('TheShy', 'Invictus Gaming', 'Shanghai'),
    ('Clearlove', 'Edward Gaming', 'Xangai'),
    ('xiaohu', 'Royal Never Give Up', 'Pequim'),
    ('m0nesY', 'Gambit Esports', 'Moscou'),
    ('Bjergsen', 'Team SoloMid', 'Los Angeles'),
    ('PapaSmithy', '100 Thieves', 'Los Angeles'),
    ('ppd', 'Evil Geniuses', 'San Francisco');



-- Inserção de Campeonatos

INSERT INTO Campeonato VALUES ('CBLOL 2022/1', '2022', '1º');
INSERT INTO Campeonato VALUES ('MUNDIAL 2022/1', '2022', '1º');
INSERT INTO Campeonato VALUES ('LEC 2022/1', '2022', '1º');
INSERT INTO Campeonato VALUES ('LCK 2022/1', '2022', '1º');
INSERT INTO Campeonato VALUES ('LPL 2022/1', '2022', '1º');

INSERT INTO Campeonato VALUES ('CBLOL 2022/2', '2022', '2º');
INSERT INTO Campeonato VALUES ('MUNDIAL 2022/2', '2022', '2º');
INSERT INTO Campeonato VALUES ('LEC 2022/2', '2022', '2º');
INSERT INTO Campeonato VALUES ('LCK 2022/2', '2022', '2º');
INSERT INTO Campeonato VALUES ('LPL 2022/2', '2022', '2º');

INSERT INTO Campeonato VALUES ('CBLOL 2021/1', '2021', '1º');
INSERT INTO Campeonato VALUES ('MUNDIAL 2021/1', '2021', '1º');
INSERT INTO Campeonato VALUES ('LEC 2021/1', '2021', '1º');
INSERT INTO Campeonato VALUES ('LCK 2021/1', '2021', '1º');
INSERT INTO Campeonato VALUES ('LPL 2021/1', '2021', '1º');

INSERT INTO Campeonato VALUES ('CBLOL 2021/2', '2021', '2º');
INSERT INTO Campeonato VALUES ('MUNDIAL 2021/2', '2021', '2º');
INSERT INTO Campeonato VALUES ('LEC 2021/2', '2021', '2º');
INSERT INTO Campeonato VALUES ('LCK 2021/2', '2021', '2º');
INSERT INTO Campeonato VALUES ('LPL 2021/2', '2021', '2º');


-- Inserção de Classes 
INSERT into Classe VALUES ('Assasino'),('Mago'),('Atirador'),('Guerreiro'),('Suporte');

-- Inserção de Skins
INSERT INTO Skins VALUES (0, 'Skin Clasica');
INSERT INTO Skins VALUES (520, 'Ashe de Freljord');
INSERT INTO Skins VALUES (3250, 'Lux Elementalista');
INSERT INTO Skins VALUES (1350, 'Vex Emissaria da Luz');
INSERT INTO Skins VALUES (1820, 'Deus-Rei Garen');
INSERT INTO Skins VALUES (975, 'Lulu Perversa');
INSERT INTO Skins VALUES (1350, 'Ryze Triunfante');
INSERT INTO Skins VALUES (975, 'Ahri Estrela do Pop');
INSERT INTO Skins VALUES (1350, 'Zoe Cibernetica');
INSERT INTO Skins VALUES (520, 'Ezreal Pulsefire');
INSERT INTO Skins VALUES (975, 'Caitlyn Policial');
INSERT INTO Skins VALUES (975, 'Jinx Zombi');
INSERT INTO Skins VALUES (1350, 'Ekko Projeto');
INSERT INTO Skins VALUES (520, 'Yasuo Desbravador do Oeste');
INSERT INTO Skins VALUES (975, 'Akali KDA');
INSERT INTO Skins VALUES (1350, 'KaiSa Sentinela');
INSERT INTO Skins VALUES (520, 'Xayah Cosmica');
INSERT INTO Skins VALUES (975, 'Rakan de Batalha');
INSERT INTO Skins VALUES (1350, 'Neeko Artificiera');
INSERT INTO Skins VALUES (520, 'Leona Solar');
INSERT INTO Skins VALUES (975, 'Diana Lua Sangrenta');
INSERT INTO Skins VALUES (1350, 'Zyra Flor Mortal');
INSERT INTO Skins VALUES (520, 'Kennen Corvo');
INSERT INTO Skins VALUES (975, 'Gwen Costureira');
INSERT INTO Skins VALUES (1350, 'Sett Mundialmente Conhecido');
INSERT INTO Skins VALUES (520, 'Vladimir Vandalismo');
INSERT INTO Skins VALUES (975, 'Swain Prototipo');
INSERT INTO Skins VALUES (1350, 'Pyke Sanguinario');
INSERT INTO Skins VALUES (520, 'Sona Mecha');
INSERT INTO Skins VALUES (975, 'Thresh Epico');
INSERT INTO Skins VALUES (1350, 'Lucian Supremo');
INSERT INTO Skins VALUES (520, 'Aphelios Lua Sangrenta');
INSERT INTO Skins VALUES (975, 'Samira PsyOps');
INSERT INTO Skins VALUES (1350, 'Viego Lamina de Terror');
INSERT INTO Skins VALUES (520, 'Yone Puro-espirito');
INSERT INTO Skins VALUES (975, 'Lillia Flor Espiritual');
INSERT INTO Skins VALUES (1350, 'Kayn Versao Rhaast');
INSERT INTO Skins VALUES (520, 'Rhaast Ceifador Carmesim');
INSERT INTO Skins VALUES (975, 'Katarina Dancarina das Laminas');
INSERT INTO Skins VALUES (1350, 'Akshan Coracao Partido');
INSERT INTO Skins VALUES (520, 'Viego Rei Destruido');
INSERT INTO Skins VALUES (975, 'Draven Lua Sangrenta');
INSERT INTO Skins VALUES (1350, 'Varus Ardente');
INSERT INTO Skins VALUES (520, 'Tahm Kench Safari');
INSERT INTO Skins VALUES (975, 'Annie Chapeuzinho Vermelho');
INSERT INTO Skins VALUES (1350, 'Amumu Faraó');
INSERT INTO Skins VALUES (520, 'Hecarim Cabeca de Cavalo');
INSERT INTO Skins VALUES (975, 'KhaZix Espectro');
INSERT INTO Skins VALUES (1350, 'Rengar Cacador de Cabecas');
INSERT INTO Skins VALUES (520, 'Darius Bioforge');
INSERT INTO Skins VALUES (975, 'Garen Espada Sagrada');
INSERT INTO Skins VALUES (1350, 'Vayne Coracao Valente');
INSERT INTO Skins VALUES (520, 'Aatrox Justicar');
INSERT INTO Skins VALUES (975, 'Mordekaiser Rei do Metal');
INSERT INTO Skins VALUES (1350, 'Thresh Sangue Lunar');
INSERT INTO Skins VALUES (520, 'Nasus Curva do Rio');
INSERT INTO Skins VALUES (975, 'Renekton Xerife');
INSERT INTO Skins VALUES (1350, 'Illaoi Lua Sangrenta');
INSERT INTO Skins VALUES (520, 'Elise Viuva Negra');
INSERT INTO Skins VALUES (975, 'Morgana Cavaleira Fantasma');
INSERT INTO Skins VALUES (1350, 'Nocturne Lunar');
INSERT INTO Skins VALUES (520, 'Karthus Luz Fantasma');
INSERT INTO Skins VALUES (975, 'Sion Mecanizado');
INSERT INTO Skins VALUES (1350, 'ChoGath Carnivoro');
INSERT INTO Skins VALUES (520, 'Brand Zombie');
INSERT INTO Skins VALUES (975, 'Anivia Pretogelo');
INSERT INTO Skins VALUES (1350, 'Kassadin Estrela Negra');
INSERT INTO Skins VALUES (520, 'Lux Comando');
INSERT INTO Skins VALUES (975, 'Ahri Cacadora de Estrelas');
INSERT INTO Skins VALUES (1350, 'Zoe Guardia Estelar');
INSERT INTO Skins VALUES (520, 'Ezreal Ace do Arsenal');
INSERT INTO Skins VALUES (975, 'Caitlyn Encantada');
INSERT INTO Skins VALUES (1350, 'Jinx Fliperama');
INSERT INTO Skins VALUES (520, 'Ekko Medico');
INSERT INTO Skins VALUES (975, 'Yasuo Projeto');
INSERT INTO Skins VALUES (1350, 'Akali Almas Gemeas');
INSERT INTO Skins VALUES (520, 'KaiSa Guardia Estelar');
INSERT INTO Skins VALUES (975, 'Xayah Predadora');
INSERT INTO Skins VALUES (1350, 'Rakan Esquadrao de Elite');
INSERT INTO Skins VALUES (520, 'Neeko Estrela do Prado');
INSERT INTO Skins VALUES (975, 'Leona Espada do Sol');
INSERT INTO Skins VALUES (1350, 'Diana de Lua Sangrenta');
INSERT INTO Skins VALUES (520, 'Zyra Colheita Sombria');
INSERT INTO Skins VALUES (975, 'Kennen Mestre Kung Fu');
INSERT INTO Skins VALUES (1350, 'Gwen Patchwork');
INSERT INTO Skins VALUES (975,'Vex Emissária da Luz');
INSERT INTO Skins VALUES (1350, 'Pulsefire Ezreal');
INSERT INTO Skins VALUES (975, 'K/DA Akali');
INSERT INTO Skins VALUES (975, 'Xayah Cósmica');
INSERT INTO Skins VALUES (975, 'Neeko Artifice');


-- Inserção de Personagens
INSERT INTO Personagens VALUES ('Lux', 'Lux Elementalista', 'Calçados Mágicos');
INSERT INTO Personagens VALUES ('Zed', 'Skin Clasica', 'Eletrocutar');
INSERT INTO Personagens VALUES ('Vex', 'Vex Emissária da Luz', 'Cometa');
INSERT INTO Personagens VALUES ('Garen', 'Deus-Rei Garen', 'Triunfo');
INSERT INTO Personagens VALUES ('Lulu', 'Lulu Perversa', 'Entrega de Biscoitos');
INSERT INTO Personagens VALUES ('Ashe', 'Ashe de Freljord', 'Ritmo Fatal');
INSERT INTO Personagens VALUES ('Ezreal', 'Pulsefire Ezreal', 'Calçados Mágicos');
INSERT INTO Personagens VALUES ('Caitlyn', 'Caitlyn Policial', 'Eletrocutar');
INSERT INTO Personagens VALUES ('Jinx', 'Jinx Zombi', 'Cometa');
INSERT INTO Personagens VALUES ('Ekko', 'Ekko Projeto', 'Triunfo');
INSERT INTO Personagens VALUES ('Yasuo', 'Skin Clasica', 'Entrega de Biscoitos');
INSERT INTO Personagens VALUES ('Akali', 'K/DA Akali', 'Ritmo Fatal');
INSERT INTO Personagens VALUES ('KaiSa', 'KaiSa Sentinela', 'Calçados Mágicos');
INSERT INTO Personagens VALUES ('Xayah', 'Xayah Cósmica', 'Eletrocutar');
INSERT INTO Personagens VALUES ('Rakan', 'Rakan de Batalha', 'Cometa');
INSERT INTO Personagens VALUES ('Neeko', 'Neeko Artifice', 'Triunfo');
INSERT INTO Personagens VALUES ('Leona', 'Leona Solar', 'Entrega de Biscoitos');
INSERT INTO Personagens VALUES ('Diana', 'Diana Lua Sangrenta', 'Ritmo Fatal');
INSERT INTO Personagens VALUES ('Zyra', 'Zyra Flor Mortal', 'Calçados Mágicos');
INSERT INTO Personagens VALUES ('Kennen', 'Kennen Corvo', 'Eletrocutar');
INSERT INTO Personagens VALUES ('Gwen', 'Gwen Costureira', 'Cometa');




--Inserção de itens
insert into itens (nome) values
('Braçadeira Cristalina'),
('Fulgor'),
('Estilhaço de Kircheis'),
('Ídolo Proibido'),
('Cota de Malha'),
('Faca da Fúria'),
('Couraça Lunar Alada'),
('Gema Ardente'),
('Colete Espinhoso'),
('Chamado do Carrasco'),
('Orbe do Oblívio'),
('Cintilação Etérea'),
('Cetro Vampírico'),
('Capa Negatron'),
('Broquel Glacial');;

-- Inserção de Tipo
INSERT INTO Tipo VALUES ('Lux', 'Mago'), ('Lux', 'Suporte');
INSERT INTO Tipo VALUES ('Zed', 'Assassino');
INSERT INTO Tipo VALUES ('Vex', 'Mago');
INSERT INTO Tipo VALUES ('Garen', 'Guerreiro');
INSERT INTO Tipo VALUES ('Lulu', 'Suporte');
INSERT INTO Tipo VALUES ('Ashe', 'Atirador');
INSERT INTO Tipo VALUES ('Ezreal', 'Atirador');
INSERT INTO Tipo VALUES ('Caitlyn', 'Atirador');
INSERT INTO Tipo VALUES ('Jinx', 'Atirador');
INSERT INTO Tipo VALUES ('Ekko', 'Assassino');
INSERT INTO Tipo VALUES ('Yasuo', 'Lutador');
INSERT INTO Tipo VALUES ('Akali', 'Assassino');
INSERT INTO Tipo VALUES ('KaiSa', 'Atirador');
INSERT INTO Tipo VALUES ('Xayah', 'Atirador');
INSERT INTO Tipo VALUES ('Rakan', 'Suporte');
INSERT INTO Tipo VALUES ('Neeko', 'Mago');
INSERT INTO Tipo VALUES ('Leona', 'Tank');
INSERT INTO Tipo VALUES ('Diana', 'Assassino');
INSERT INTO Tipo VALUES ('Zyra', 'Mago');
INSERT INTO Tipo VALUES ('Kennen', 'Mago');
INSERT INTO Tipo VALUES ('Gwen', 'Lutador');



--Inserção de Partidas
INSERT INTO Partida VALUES('2022-12-07','10','2022','2º',1,2);
INSERT INTO Partida VALUES('2022-01-01','101','2022','1º',3,4);
INSERT INTO Partida VALUES('2022-12-10','7','2021','2º',1,3);
INSERT INTO Partida VALUES('2022-03-22','999','2021','1º',2,5);
INSERT INTO Partida VALUES('2022-11-01','222','2021','2º',3,2);
INSERT INTO Partida VALUES('2022-02-25','65520','2020','1º',1,4);
INSERT INTO Partida VALUES('2022-04-17','1','2020','1º',2,4);
INSERT INTO Partida VALUES('2022-08-28','1572','2020','2º',5,1);

-- Inserção de Drafts
INSERT INTO Draft VALUES('10','2022-12-07', 'Zed');
INSERT INTO Draft VALUES('10','2022-12-07', 'Lulu');
INSERT INTO Draft VALUES('10','2022-12-07', 'Garen');
INSERT INTO Draft VALUES('10','2022-12-07', 'Lux');
INSERT INTO Draft VALUES('10','2022-12-07', 'Ashe');
INSERT INTO Draft VALUES('101','2022-01-01', 'Zed');
INSERT INTO Draft VALUES('101','2022-01-01', 'Lulu');
INSERT INTO Draft VALUES('101','2022-01-01', 'Garen');
INSERT INTO Draft VALUES('101','2022-01-01', 'Lux');
INSERT INTO Draft VALUES('101','2022-01-01', 'Ashe');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Zed');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Lulu');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Garen');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Lux');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Ashe');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Zed');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Lulu');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Garen');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Lux');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Ashe');


--Inserção da Habilidades
insert into habilidades(nome, tipo, nomepersonagem) VALUES
('Rajada','w','Ashe'),
('Concentração','q','Ashe'),
('Rajada Mistral','q','Vex'),
('Espaço Pessoal','w','Vex'),
('Penumbra Iminente','e','Vex'),
('Lança-Purpurina','q','Lulu'),
('Caprichos','w','Lulu'),
('Singularidade Lucente', 'e', 'Lux'),
('Ligação da Luz', 'q', 'Lux'),
('Shuriken Laminado', 'q', 'Zed'),
('Corte Sombrio', 'w', 'Zed'),
('Sombra Viva', 'e', 'Zed'),
('Golpe Decisivo', 'q', 'Garen'),
('O julgamento', 'w', 'Garen'),
('Courage', 'e', 'Garen');

--Inserção de Builds
INSERT INTO Build(NomePersonagem, NomeItem) VALUES
('Lux', 'Orbe do Oblívio'),
('Zed','Cetro Vampírico'),
('Vex','Ídolo Proibido'),
('Garen','Cota de Malha'),
('Lulu','Braçadeira Cristalina'),
('Ashe', 'Estilhaço de Kircheis');
INSERT INTO Build(NomePersonagem, NomeItem) VALUES
('Lux','Cintilação Etérea');


-- Inserção de Jogadores
INSERT INTO Jogador (nick, idade, sexo, elo, idequipe) VALUES
('Gabriel11', '11', 'm', 'Desafiante', '1'),
('João12', '12', 'm', 'Diamante', '1'),
('Gabriel13', '13', 'm', 'Mestre', '1'),
('Luiz14', '14', 'm', 'Grão-Mestre', '1'),
('Henrique15', '15', 'm', 'Desafiante', '1'),
('Arthur16', '16', 'm', 'Diamante', '2'),
('Miguel17', '17', 'm', 'Mestre', '2'),
('João18', '18', 'm', 'Grão-Mestre', '2'),
('Guilherme19', '19', 'm', 'Desafiante', '2'),
('Luiz20', '20', 'm', 'Diamante', '2'),
('Miguel21', '21', 'm', 'Mestre', '3'),
('Davi22', '22', 'm', 'Grão-Mestre', '3'),
('Lucas23', '23', 'm', 'Desafiante', '3'),
('João24', '24', 'm', 'Diamante', '3'),
('Lucas25', '25', 'm', 'Mestre', '3'),
('Pedro26', '26', 'm', 'Grão-Mestre', '4'),
('Henrique27', '27', 'm', 'Desafiante', '4'),
('DaviLucca28', '28', 'm', 'Diamante', '4'),
('Arthur29', '29', 'm', 'Mestre', '4'),
('Gabriel30', '30', 'm', 'Grão-Mestre', '4'),
('João31', '31', 'm', 'Desafiante', '5'),
('Gabriel32', '32', 'm', 'Diamante', '5'),
('Luiz33', '33', 'm', 'Mestre', '5'),
('Henrique34', '34', 'm', 'Grão-Mestre', '5'),
('Miguel35', '35', 'm', 'Desafiante', '5'),
('Miguel36', '36', 'm', 'Diamante', '6'),
('Lucas37', '37', 'm', 'Mestre', '6'),
('Pedro38', '38', 'm', 'Grão-Mestre', '6'),
('Arthur39', '39', 'm', 'Desafiante', '6'),
('João40', '40', 'm', 'Diamante', '6'),
('Gabriel41', '41', 'm', 'Mestre', '7'),
('Luiz42', '42', 'm', 'Grão-Mestre', '7'),
('Henrique43', '43', 'm', 'Desafiante', '7'),
('Miguel44', '44', 'm', 'Diamante', '7'),
('Lucas45', '45', 'm', 'Mestre', '7'),
('Pedro46', '46', 'm', 'Grão-Mestre', '8'),
('Arthur47', '47', 'm', 'Desafiante', '8'),
('João48', '48', 'm', 'Diamante', '8'),
('Gabriel49', '49', 'm', 'Mestre', '8'),
('Luiz50', '50', 'm', 'Grão-Mestre', '8'),
('Henrique51', '51', 'm', 'Desafiante', '9'),
('Miguel52', '52', 'm', 'Diamante', '9'),
('Lucas53', '53', 'm', 'Mestre', '9'),
('Pedro54', '54', 'm', 'Grão-Mestre', '9'),
('Arthur55', '55', 'm', 'Desafiante', '9'),
('João56', '56', 'm', 'Diamante', '10'),
('Gabriel57', '57', 'm', 'Mestre', '10'),
('Luiz58', '58', 'm', 'Grão-Mestre', '10'),
('Henrique59', '59', 'm', 'Desafiante', '10'),
('Miguel60', '60', 'm', 'Diamante', '10');





-- Inserção de Contratação
INSERT INTO Contratacao (CodCoach, NomeOrg, EndOrg, Periodo, Valor, id)
VALUES
    ('Cariok', 'Flamengo Los Grandes', 'Rio de Janeiro', '2 anos', 16000, 1),
    ('Maestro', 'Pain', 'São Paulo', '2 anos', 15000, 2),
    ('Gorilla', 'Kabum', 'Porto Alegre', '1 ano', 7000, 3),
    ('Von', 'Loud', 'São Paulo', '2 anos', 12000, 4),
    ('Brance', 'Coca-Cola', 'Bangu', '1 ano', 30000, 5),
    ('kkOma', 'MonoChampions', 'Bahia', '2 anos', 14000, 6),
    ('Kkoma', 'SK Telecom T1', 'Seul', '1 ano', 18000, 7),
    ('Reapered', 'Cloud9', 'Los Angeles', '2 anos', 22000, 8),
    ('Rekkles', 'Fnatic', 'Londres', '1 ano', 25000, 9),
    ('GrabbZ', 'G2 Esports', 'Berlim', '2 anos', 19000, 10),
    ('Jatt', 'Team Liquid', 'Los Angeles', '1 ano', 28000, 11),
    ('Faker', 'T1', 'Seul', '2 anos', 21000, 12),
    ('TheShy', 'Invictus Gaming', 'Shanghai', '1 ano', 17000, 13),
    ('Clearlove', 'Edward Gaming', 'Xangai', '2 anos', 23000, 14),
    ('xiaohu', 'Royal Never Give Up', 'Pequim', '1 ano', 27000, 15),
    ('m0nesY', 'Gambit Esports', 'Moscou', '1 ano', 15000, 16),
    ('Bjergsen', 'Team SoloMid', 'Los Angeles', '2 anos', 21000, 17),
    ('PapaSmithy', '100 Thieves', 'Los Angeles', '1 ano', 25000, 18),
    ('ppd', 'Evil Geniuses', 'San Francisco', '2 anos', 22000, 19);



----------------------------------------------------

-- FUNCTION 1

CREATE OR REPLACE FUNCTION fn_GetPorcentagemJogadoresPorElo(
    elo_param VARCHAR
)
RETURNS FLOAT
AS $$
DECLARE
    total_jogadores integer;
	jogadores_elo integer;
	porcentagem float;
BEGIN
    SELECT COUNT(1) INTO total_jogadores FROM Jogador;
    SELECT COUNT(1) INTO jogadores_elo FROM Jogador WHERE elo = elo_param;

    IF total_jogadores = 0 THEN
        RETURN 0;
    ELSE
        porcentagem := (jogadores_elo::FLOAT / total_jogadores::FLOAT) * 100;
        RETURN porcentagem;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- FUNCTION 2

CREATE OR REPLACE FUNCTION mudar_lado_partida(data_partida_input date, sala_input varchar, numSalaNova char(25))
RETURNS char(10) AS
$$
DECLARE
    partida_data date;
    partida_sala varchar(25);
    partida_id_azul integer;
    partida_id_vermelho integer;
    anoSessao char(10);
    semestreSessao char(10);
    atualData DATE;
    
BEGIN
    atualData := CURRENT_DATE;

    SELECT Data_partida, Sala, IDAzul, IDVermelho, ano, semestre
    INTO partida_data, partida_sala, partida_id_azul, partida_id_vermelho, anoSessao, semestreSessao
    FROM partida
    WHERE partida.data_partida = data_partida_input
    AND partida.sala = sala_input;

    INSERT INTO Partida VALUES(atualData, numSalaNova, anoSessao,semestreSessao, partida_id_vermelho, partida_id_azul);

    RETURN anoSessao;

END;
$$
LANGUAGE PLPGSQL;

-- FUNCTION 3

CREATE TABLE PontuacaoPartida (
        Data_partida DATE,
        Sala VARCHAR(25),
        PontuacaoAzul INTEGER,
        PontuacaoVermelho INTEGER
    );




CREATE OR REPLACE FUNCTION criar_nova_partida(
    data_partida_input DATE,
    sala_input VARCHAR,
    id_azul_input INTEGER,
    id_vermelho_input INTEGER,
    ano_input CHAR(10),
    semestre_input CHAR(10),
    pontuacao_azul_input INTEGER,
    pontuacao_vermelho_input INTEGER
)
RETURNS VOID AS $$
DECLARE
    atualData DATE;
BEGIN
    atualData := CURRENT_DATE;

    INSERT INTO Partida (Data_partida, Sala, IDAzul, IDVermelho, Ano, Semestre)
    VALUES (data_partida_input, sala_input, id_azul_input, id_vermelho_input, ano_input, semestre_input);

    CREATE TABLE IF NOT EXISTS PontuacaoPartida (
        Data_partida DATE,
        Sala VARCHAR(25),
        PontuacaoAzul INTEGER,
        PontuacaoVermelho INTEGER
    );

    INSERT INTO PontuacaoPartida (Data_partida, Sala, PontuacaoAzul, PontuacaoVermelho)
    VALUES (data_partida_input, sala_input, pontuacao_azul_input, pontuacao_vermelho_input);

    RETURN;
END;
$$ LANGUAGE PLPGSQL;

-- FUNCTION 4

CREATE OR REPLACE FUNCTION desconto_skin()
RETURNS void AS $$
DECLARE
    desconto numeric;
BEGIN
    IF EXTRACT(DAY FROM CURRENT_DATE)::integer % 2 = 0 THEN
        desconto = 20;
        UPDATE skins
        SET preço = preço - preço * (desconto / 100)
        WHERE preço  = 975;
        
        IF (SELECT COUNT(*) from skins where preço = 364) > 0 THEN
            UPDATE skins
            SET preço = 520
            WHERE preço = 364;
        ELSE
            UPDATE skins
            SET preço = 975
            WHERE preço  = 945;
        END IF;
    ELSE
        desconto = 30;
        UPDATE skins
        SET preço = preço - preço * (desconto / 100)
        WHERE preço = 1350  or  preço = 520;
        
        IF (SELECT COUNT(*) from skins where preço = 780) > 0 THEN
            UPDATE skins
            SET preço = 975
            WHERE preço = 780;
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- FUNCTION 5

CREATE OR REPLACE FUNCTION Fat_org_season(nome_org CHAR, endereco_org char,ano_s varchar,s_semestre varchar,porcentagem_bicho_jog_e_tec int) RETURNS NUMERIC AS $$
DECLARE
  	Contrato_porseason float;
  	premiacoes INT;
BEGIN
SELECT SUM (valor)
    	INTO contrato_porseason
    	from contratacao
    	WHERE nome_org = nomeorg AND
    	endereco_org = endorg
    	group by contratacao.nomeorg;
    	SELECT premiação
    	into premiacoes
    	from season as s
    	where ano_s = s.ano AND
    	s_semestre = s.semestre;
   	
    return (premiacoes-(((premiacoes*porcentagem_bicho_jog_e_tec)/100)*6)) - contrato_porseason;
    
END;
$$ LANGUAGE plpgsql;

-- TRIGGER 1

CREATE OR REPLACE FUNCTION atualizar_elo_jogador()
RETURNS TRIGGER AS $$
DECLARE
    season_exists INTEGER;
BEGIN

    SELECT COUNT(*) INTO season_exists
    FROM Ranking
    WHERE Ano = NEW.Ano AND Semestre = NEW.Semestre;

    UPDATE Jogador
    SET elo = CASE
        WHEN elo = 'Desafiante' THEN 'Diamante'
        WHEN elo = 'Grão-Mestre' THEN 'Diamante'
        WHEN elo = 'Mestre' THEN 'Diamante'
        WHEN elo = 'Diamante' THEN 'Platina'
        WHEN elo = 'Platina' THEN 'Ouro'
        WHEN elo = 'Ouro' THEN 'Prata'
        WHEN elo = 'Prata' THEN 'Bronze'
        WHEN elo = 'Bronze' THEN 'Ferro'
        ELSE elo
    END;

  
    IF season_exists = 0 THEN
        INSERT INTO Ranking (Elo, Ano, Semestre)
        VALUES ('Desafiante', NEW.Ano, NEW.Semestre),
               ('Diamante', NEW.Ano, NEW.Semestre),
               ('Grão-Mestre', NEW.Ano, NEW.Semestre),
               ('Mestre', NEW.Ano, NEW.Semestre),
               ('Platina', NEW.Ano, NEW.Semestre),
               ('Ouro', NEW.Ano, NEW.Semestre),
               ('Prata', NEW.Ano, NEW.Semestre),
               ('Bronze', NEW.Ano, NEW.Semestre);
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER mudanca_temporada
AFTER INSERT ON Season
FOR EACH ROW
EXECUTE FUNCTION atualizar_elo_jogador();

--Teste
INSERT INTO Season (Ano, Semestre, Patrocínio, Premiação) VALUES ('2023', '1º', 'VIVARA', 1000000);



--Trigger 2

CREATE OR REPLACE FUNCTION setGanho()
RETURNS TRIGGER AS $$
DECLARE
    id_azul INTEGER;
    id_vermelho INTEGER;
    data_partida_al DATE;
    sala_al VARCHAR(25);
    PontuacaoAzul_al INTEGER;
    PontuacaoVermelho_al INTEGER;
BEGIN
    data_partida_al :=  NEW.Data_partida;
    sala_al := NEW.Sala;
    PontuacaoAzul_al := NEW.PontuacaoAzul;
    PontuacaoVermelho_al := NEW.PontuacaoVermelho;
    
    SELECT IDAzul, IDVermelho INTO id_azul, id_vermelho
    FROM Partida
    WHERE Data_partida = data_partida_al AND Sala = sala_al;

    IF (PontuacaoAzul_al > PontuacaoVermelho_al) THEN
        UPDATE Jogador
        SET partidasGanhas = partidasGanhas + 1
        WHERE idEquipe IN (
          SELECT id
          FROM equipe
          WHERE id = id_azul
        );
    ELSIF (PontuacaoAzul_al < PontuacaoVermelho_al) THEN
        UPDATE Jogador
        SET partidasGanhas = partidasGanhas + 1
        WHERE idEquipe IN (
          SELECT id
          FROM equipe
          WHERE id = id_vermelho
        );
    ELSE
        RETURN NEW;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER ganhosPartida
AFTER INSERT OR UPDATE ON PontuacaoPartida
FOR EACH ROW
EXECUTE FUNCTION setGanho();

----------INDICES------------------------------

CREATE INDEX Ind_PK_Season_Ano
ON Season
USING hash (Ano);

CREATE INDEX Ind_PK_Season_Semestre
ON Season
USING hash (Semestre);

CREATE INDEX Ind_Bth_Premiacao
ON Season (Premiação);

CREATE INDEX Ind_PK_Equipe
ON Equipe
USING hash (Id);

CREATE INDEX Ind_PK_Jogador
ON Jogador
USING hash (Nick);

CREATE INDEX Ind_Bth_Idade
ON Jogador(Idade);

CREATE INDEX Ind_FK_Equipe
ON Jogador
USING hash (idEquipe);


CREATE INDEX Ind_FK_Season_Ano
ON Campeonato
USING hash (Ano);

CREATE INDEX Ind_FK_Season_Semestre
ON Campeonato
USING hash (Semestre);

CREATE INDEX Ind_PK_Partida
ON Partida
USING hash (Sala);

CREATE INDEX Ind_FK_Equipe_Azul
ON Partida
USING hash (IdAzul);

CREATE INDEX Ind_FK_Equipe_Vermelho
ON Partida
USING hash (IdVermelho);


CREATE INDEX Ind_PK_Draft
ON Draft
USING hash (Sala);

CREATE INDEX Ind_Bth_Valor
ON Contratacao(Valor);

CREATE INDEX Ind_Bth_Preco
ON Skins(Preço);
---------------------------------------------

-----------------VIEWS--------------------------------------------------------------------------
--Visão 1 (Tem o intuito de apresentar apenas aspectos relacionados ao jogo para os jogadores)

Create view visão_Jogador
AS
SELECT p.nome as Nome_Personagem,p.NomeRuna as Nome_Runa, s.Nome as NomeSkin, s.Preço as Preço_Skin, h.Nome as Nome_Habilidade, h.Tipo as Nome_Tipo, i.Nome as Nome_item
FROM Personagens p
JOIN Skins s ON p.NomeSkin = s.Nome
JOIN Habilidades h ON h.NomePersonagem = p.Nome
JOIN Build b ON b.NomePersonagem = p.Nome
JOIN Itens i ON b.NomeItem = i.Nome;

--Visão 2 (Tem o intuito de apresentar uma visão geral sobre todos os campeonatos que já ocorreram)
CREATE OR REPLACE VIEW relatorio_campeonato AS
SELECT c.Nome AS Campeonato,
       c.Ano,
       c.Semestre,
       s.Patrocínio,
       s.Premiação,
       COUNT(DISTINCT p.IDAzul) + COUNT(DISTINCT p.IDVermelho) AS Numero_de_Equipes,
       COUNT(DISTINCT p.Sala) AS Numero_de_Partidas
FROM Campeonato c
JOIN Season s ON c.Ano = s.Ano AND c.Semestre = s.Semestre
JOIN Partida p ON c.Ano = p.Ano AND c.Semestre = p.Semestre
GROUP BY c.Nome, c.Ano, c.Semestre, s.Patrocínio, s.Premiação;

----------------PERMISSOES--------------------------------------
CREATE USER jogadores WITH PASSWORD 'lol';
CREATE USER admin WITH PASSWORD 'admin';
CREATE USER dev WITH PASSWORD 'dev';


GRANT SELECT ON TABLE visão_Jogador TO jogadores;


GRANT SELECT, INSERT, UPDATE ON TABLE campeonato TO admin; 
GRANT SELECT, INSERT, UPDATE ON TABLE equipe TO admin; 
GRANT SELECT, INSERT, UPDATE ON TABLE organizacao TO admin; 
GRANT SELECT, INSERT, UPDATE ON TABLE contratacao TO admin; 
GRANT SELECT, INSERT, UPDATE ON TABLE season TO admin;


GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE classe TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE habilidades TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE itens TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE personagens TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE runas TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE skins TO dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE tipo TO dev;
-------------------------------------------------------------------------

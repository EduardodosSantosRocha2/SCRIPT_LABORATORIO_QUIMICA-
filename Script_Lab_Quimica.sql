/* Lógico_1: */

CREATE TABLE Usuario (
    CPF TEXT PRIMARY KEY,
    Email TEXT,
    Nome TEXT,
    Telefone TEXT
);

CREATE TABLE Professor (
    Curso_ministrados TEXT,
    Experiencia_de_ensino TEXT,
    Area_de_especializacao TEXT,
    Num_aulas INTEGER DEFAULT 0,
    fk_Usuario_CPF TEXT PRIMARY KEY
);

CREATE TABLE Tecnico (
    Certificado TEXT,
    Numero_do_CRQ REAL,
    Carga_horaria REAL,
    fk_Usuario_CPF TEXT PRIMARY KEY
);

CREATE TABLE Prateleiras (
    Numero_Prateleira INTEGER PRIMARY KEY,
    Nome TEXT,
    Capacidade_de_armazenamento REAL
);

CREATE TABLE Reserva (
    ID_RESERVA INTEGER PRIMARY KEY,
    HORARIO_RESERVA TIME,
    DATA_RESERVA DATE,
    TURNO TEXT,
    fk_Professor_fk_Usuario_CPF TEXT
);

CREATE TABLE Aula (
    Topico TEXT,
    ID_aula INTEGER PRIMARY KEY,
    Topicos_abordado TEXT,
    Nome TEXT,
    fk_Professor_fk_Usuario_CPF TEXT
);

CREATE TABLE Experimento (
    Objetivo TEXT,
    Nome TEXT,
    Numero_Experimento INTEGER PRIMARY KEY,
    Arquivo_PDF BYTEA,
    Discussao TEXT,
    Arquivo_IMG BYTEA
);

CREATE TABLE Produto (
    Nome TEXT,
    ID_Prod INTEGER PRIMARY KEY,
    Descricao TEXT,
    Fabricante TEXT,
    Preco REAL,
    Data_de_fabricacao DATE,
    fk_Prateleiras_Numero_Prateleira INTEGER
);

CREATE TABLE Quimico (
    Formula_quimica TEXT,
    Concentracao REAL,
    Classe_de_risco TEXT,
    Volume REAL,
    Data_de_validade DATE,
    fk_Produto_ID_Prod INTEGER PRIMARY KEY
);

CREATE TABLE Equipamento (
    Tipo TEXT,
    Capacidade REAL,
    Condicoes_de_operacao TEXT,
    Calibracao TEXT,
    fk_Produto_ID_Prod INTEGER PRIMARY KEY
);

CREATE TABLE Realiza_experimento (
    fk_Aula_ID_aula INTEGER,
    fk_Experimento_Numero_Experimento INTEGER,
    Vezes_Realizadas INTEGER,
    Observacao TEXT
);

CREATE TABLE Prepara_Prateleiras_Experimento_Tecnico (
    fk_Prateleiras_Numero_Prateleira INTEGER,
    fk_Experimento_Numero_Experimento INTEGER,
    fk_Tecnico_fk_Usuario_CPF TEXT,
    Quantidade REAL
);

CREATE TABLE Registra (
    fk_Prateleiras_Numero_Prateleira INTEGER,
    fk_Tecnico_fk_Usuario_CPF TEXT
);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Usuario_CPF)
    REFERENCES Usuario (CPF)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Tecnico ADD CONSTRAINT FK_Tecnico_2
    FOREIGN KEY (fk_Usuario_CPF)
    REFERENCES Usuario (CPF)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Professor_fk_Usuario_CPF)
    REFERENCES Professor (fk_Usuario_CPF)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Aula ADD CONSTRAINT FK_Aula_2
    FOREIGN KEY (fk_Professor_fk_Usuario_CPF)
    REFERENCES Professor (fk_Usuario_CPF)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_1
    FOREIGN KEY (fk_Prateleiras_Numero_Prateleira)
    REFERENCES Prateleiras (Numero_Prateleira)
    ON DELETE SET NULL ON UPDATE CASCADE;
 

ALTER TABLE Quimico ADD CONSTRAINT FK_Quimico_2
    FOREIGN KEY (fk_Produto_ID_Prod)
    REFERENCES Produto (ID_Prod)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Equipamento ADD CONSTRAINT FK_Equipamento_2
    FOREIGN KEY (fk_Produto_ID_Prod)
    REFERENCES Produto (ID_Prod)
    ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE Realiza_experimento ADD CONSTRAINT FK_Realiza_experimento_1
    FOREIGN KEY (fk_Aula_ID_aula)
    REFERENCES Aula (ID_aula)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Realiza_experimento ADD CONSTRAINT FK_Realiza_experimento_2
    FOREIGN KEY (fk_Experimento_Numero_Experimento)
    REFERENCES Experimento (Numero_Experimento)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Prepara_Prateleiras_Experimento_Tecnico ADD CONSTRAINT FK_Prepara_Prateleiras_Experimento_Tecnico_1
    FOREIGN KEY (fk_Prateleiras_Numero_Prateleira)
    REFERENCES Prateleiras (Numero_Prateleira)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Prepara_Prateleiras_Experimento_Tecnico ADD CONSTRAINT FK_Prepara_Prateleiras_Experimento_Tecnico_2
    FOREIGN KEY (fk_Experimento_Numero_Experimento)
    REFERENCES Experimento (Numero_Experimento)
     ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Prepara_Prateleiras_Experimento_Tecnico ADD CONSTRAINT FK_Prepara_Prateleiras_Experimento_Tecnico_3
    FOREIGN KEY (fk_Tecnico_fk_Usuario_CPF)
    REFERENCES Tecnico (fk_Usuario_CPF)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_1
    FOREIGN KEY (fk_Prateleiras_Numero_Prateleira)
    REFERENCES Prateleiras (Numero_Prateleira)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Registra ADD CONSTRAINT FK_Registra_2
    FOREIGN KEY (fk_Tecnico_fk_Usuario_CPF)
    REFERENCES Tecnico (fk_Usuario_CPF)
    ON DELETE SET NULL ON UPDATE CASCADE;


-- Populando a tabela Usuario
INSERT INTO Usuario (CPF, Email, Nome, Telefone)
VALUES
    ('11111111111', 'usuario1@email.com', 'Usuário 1', '111111111'),
    ('22222222222', 'usuario2@email.com', 'Usuário 2', '222222222'),
    ('33333333333', 'usuario3@email.com', 'Usuário 3', '333333333'),
    ('44444444444', 'usuario4@email.com', 'Usuário 4', '444444444'),
    ('55555555555', 'usuario5@email.com', 'Usuário 5', '555555555'),
    ('66666666666', 'usuario6@email.com', 'Usuário 6', '666666666'),
    ('77777777777', 'usuario7@email.com', 'Usuário 7', '777777777'),
    ('88888888888', 'usuario8@email.com', 'Usuário 8', '888888888'),
    ('99999999999', 'usuario9@email.com', 'Usuário 9', '999999999'),
    ('12345678910', 'usuario10@email.com', 'Usuário 10', '123456789'),
    ('23456789101', 'usuario11@email.com', 'Usuário 11', '234567890'),
    ('34567891012', 'usuario12@email.com', 'Usuário 12', '345678901'),
    ('45678910123', 'usuario13@email.com', 'Usuário 13', '456789012'),
    ('56789101234', 'usuario14@email.com', 'Usuário 14', '567890123'),
    ('67891012345', 'usuario15@email.com', 'Usuário 15', '678901234');


	-- Populando a tabela Professor
INSERT INTO Professor (Curso_ministrados, Experiencia_de_ensino, Area_de_especializacao, fk_Usuario_CPF)
VALUES
    ('Química Orgânica', '10 anos de experiência', 'Química Orgânica', '11111111111'),
    ('Química Inorgânica', '5 anos de experiência', 'Química Inorgânica','22222222222'),
    ('Físico-Química', '8 anos de experiência', 'Físico-Química', '33333333333'),
    ('Bioquímica', '3 anos de experiência', 'Bioquímica','44444444444'),
    ('Química Analítica', '6 anos de experiência', 'Química Analítica','55555555555'),
    ('Química Ambiental', '4 anos de experiência', 'Química Ambiental',  '66666666666'),
    ('Química Industrial', '7 anos de experiência', 'Química Industrial', '77777777777');


-- Populando a tabela Tecnico
INSERT INTO Tecnico (Certificado, Numero_do_CRQ, Carga_horaria, fk_Usuario_CPF)
VALUES
    ('Técnico em Química', 123456, 40, '88888888888'),
    ('Técnico em Laboratório', 654321, 36, '99999999999'),
    ('Técnico em Análises Químicas', 987654, 38, '12345678910'),
    ('Técnico em Controle de Qualidade', 246813, 42, '23456789101'),
    ('Técnico em Química Industrial', 135792, 40, '34567891012'),
    ('Técnico em Pesquisa e Desenvolvimento', 864209, 36, '45678910123'),
    ('Técnico em Laboratório Químico', 502178, 38, '56789101234'),
    ('Técnico em Química Ambiental', 618709, 42, '67891012345');


-- Populando a tabela Prateleiras
INSERT INTO Prateleiras (Numero_Prateleira, Nome, Capacidade_de_armazenamento)
VALUES
    (1, 'Prateleira A', 100),
    (2, 'Prateleira B', 80),
    (3, 'Prateleira C', 120),
    (4, 'Prateleira D', 90),
    (5, 'Prateleira E', 110);
	
	
	
-- Populando a tabela Reserva
INSERT INTO Reserva (ID_RESERVA, HORARIO_RESERVA, DATA_RESERVA, TURNO, fk_Professor_fk_Usuario_CPF)
VALUES
    (1, '10:00:00', '2023-05-20', 'Manhã', '11111111111'),
    (2, '14:30:00', '2023-05-21', 'Tarde', '22222222222'),
    (3, '09:00:00', '2023-05-22', 'Manhã', '33333333333'),
    (4, '16:00:00', '2023-05-23', 'Tarde', '44444444444'),
    (5, '11:30:00', '2023-05-24', 'Manhã', '55555555555'),
    (6, '13:00:00', '2023-05-25', 'Tarde', '66666666666'),
    (7, '15:30:00', '2023-05-26', 'Tarde', '77777777777'),
    (8, '10:30:00', '2023-05-27', 'Manhã', '11111111111'),
    (9, '12:00:00', '2023-05-28', 'Manhã', '22222222222'),
    (10, '14:00:00', '2023-05-29', 'Tarde', '33333333333');

-- Populando a tabela Aula
INSERT INTO Aula (Topico, ID_aula, Topicos_abordado, Nome, fk_Professor_fk_Usuario_CPF)
VALUES
    ('Introdução à Química', 1, 'Conceitos básicos de química', 'Aula 1', '11111111111'),
    ('Estrutura Atômica', 2, 'Modelos atômicos, número atômico e massa atômica', 'Aula 2', '22222222222'),
    ('Ligações Químicas', 3, 'Ligação iônica, covalente e metálica', 'Aula 3', '33333333333'),
    ('Reações Químicas', 4, 'Tipos de reações químicas', 'Aula 4', '44444444444'),
    ('Equilíbrio Químico', 5, 'Princípio de Le Chatelier, constante de equilíbrio', 'Aula 5', '55555555555'),
    ('Cinética Química', 6, 'Lei da velocidade, fatores que afetam a velocidade', 'Aula 6', '66666666666'),
    ('Termodinâmica', 7, 'Leis da termodinâmica, entalpia e entropia', 'Aula 7', '77777777777');


-- Populando a tabela Experimento
INSERT INTO Experimento (Objetivo, Nome, Numero_Experimento, Arquivo_PDF, Discussao, Arquivo_IMG)
VALUES
    ('Determinação da Densidade', 'Experimento 1', 1, NULL, 'Discussão do experimento 1', NULL),
    ('Análise de pH', 'Experimento 2', 2, NULL, 'Discussão do experimento 2', NULL),
    ('Síntese de uma Substância', 'Experimento 3', 3, NULL, 'Discussão do experimento 3', NULL),
    ('Determinação de Massa Molar', 'Experimento 4', 4, NULL, 'Discussão do experimento 4', NULL),
    ('Identificação de Compostos', 'Experimento 5', 5, NULL, 'Discussão do experimento 5', NULL),
    ('Titulação Ácido-Base', 'Experimento 6', 6, NULL, 'Discussão do experimento 6', NULL),
    ('Extração de Substâncias', 'Experimento 7', 7, NULL, 'Discussão do experimento 7', NULL),
    ('Cromatografia em Papel', 'Experimento 8', 8, NULL, 'Discussão do experimento 8', NULL);


-- Populando a tabela Produto com 12 linhas
INSERT INTO Produto (Nome, ID_Prod, Descricao, Fabricante, Preco, Data_de_fabricacao, fk_Prateleiras_Numero_Prateleira)
VALUES
    ('Ácido Sulfúrico', 1, 'Ácido altamente corrosivo', 'Fabricante A', 10.50, '2022-10-01', 1),
    ('Hidróxido de Sódio', 2, 'Base forte em forma sólida', 'Fabricante B', 5.25, '2022-09-15', 1),
    ('Etanol', 3, 'Álcool etílico puro', 'Fabricante C', 8.75, '2022-08-20', 2),
    ('Dicromato de Potássio', 4, 'Sal cristalino laranja', 'Fabricante D', 12.30, '2022-11-05', 2),
    ('Ácido Clorídrico', 5, 'Ácido altamente corrosivo', 'Fabricante A', 9.80, '2022-07-10', 3),
    ('Sulfato de Cobre', 6, 'Sal cristalino azul', 'Fabricante E', 6.90, '2022-06-25', 3),
    ('Carbonato de Cálcio', 7, 'Sal branco em forma de pó', 'Fabricante F', 4.50, '2022-08-01', 4),
    ('Fenolftaleína', 8, 'Indicador de pH em solução alcoólica', 'Fabricante G', 3.25, '2022-09-20', 4),
    ('Permanganato de Potássio', 9, 'Sal cristalino roxo', 'Fabricante H', 7.60, '2022-07-15', 5),
    ('Ácido Nítrico', 10, 'Ácido altamente corrosivo', 'Fabricante A', 11.80, '2022-06-30', 5),
    ('Água Destilada', 11, 'Água pura destilada', 'Fabricante I', 2.50, '2022-07-05', 5),
    ('Cloreto de Sódio', 12, 'Sal branco em forma de cristais', 'Fabricante J', 1.80, '2022-09-10', 5);



-- Populando a tabela Quimico
INSERT INTO Quimico (Formula_quimica, Concentracao, Classe_de_risco, Volume, Data_de_validade, fk_Produto_ID_Prod)
VALUES
    ('H2SO4', 0.5, 'Ácido corrosivo', 100.0, '2023-06-01', 1),
    ('NaOH', 0.8, 'Base cáustica', 200.0, '2023-06-02', 3),
    ('Cr2O7', 0.3, 'Substância oxidante', 50.0, '2023-06-03', 7),
    ('HCl', 0.7, 'Ácido corrosivo', 150.0, '2023-06-04', 9);
    
ALTER TABLE Quimico ADD COLUMN Quantidade REAL;


UPDATE Quimico SET Quantidade = 10 WHERE fk_Produto_ID_Prod = 1;
UPDATE Quimico SET Quantidade = 15 WHERE fk_Produto_ID_Prod = 7;
UPDATE Quimico SET Quantidade = 5 WHERE fk_Produto_ID_Prod = 3;
UPDATE Quimico SET Quantidade = 35 WHERE fk_Produto_ID_Prod = 9;

-- Populando a tabela Equipamento
INSERT INTO Equipamento (Tipo, Capacidade, Condicoes_de_operacao, Calibracao, fk_Produto_ID_Prod)
VALUES
    ('Espectrômetro', 1000.0, 'Temperatura controlada', 'Anual', 2),
    ('Agitador magnético', 500.0, 'Rotação ajustável', 'Mensal', 6),
    ('Destilador', 2000.0, 'Destilação a vácuo', 'Semestral', 8),
    ('Centrífuga', 3000.0, 'Velocidade ajustável', 'Trimestral', 10);


-- Populando a tabela Realiza_experimento
INSERT INTO Realiza_experimento (fk_Aula_ID_aula, fk_Experimento_Numero_Experimento, Vezes_Realizadas, Observacao)
VALUES
    (1, 1, 3, 'Experimento realizado com sucesso'),
    (2, 2, 2, 'Experimento apresentou resultados promissores'),
    (3, 1, 1, 'Experimento precisa de ajustes'),
    (4, 3, 2, 'Experimento concluído com êxito'),
    (5, 2, 1, 'Experimento em andamento');

-- Populando a tabela Prepara_Prateleiras_Experimento_Tecnico
INSERT INTO Prepara_Prateleiras_Experimento_Tecnico (fk_Prateleiras_Numero_Prateleira, fk_Experimento_Numero_Experimento, fk_Tecnico_fk_Usuario_CPF, Quantidade)
VALUES
    (1, 1, '88888888888', 2),
    (2, 2, '99999999999', 3),
    (3, 4, '23456789101', 1),
    (4, 3, '56789101234', 2),
    (5, 5, '67891012345', 1);

-- Populando a tabela Registra
INSERT INTO Registra (fk_Prateleiras_Numero_Prateleira, fk_Tecnico_fk_Usuario_CPF)
VALUES
    (1, '88888888888'),
    (2, '67891012345'),
    (3, '56789101234'),
    (4, '34567891012'),
    (5, '23456789101');

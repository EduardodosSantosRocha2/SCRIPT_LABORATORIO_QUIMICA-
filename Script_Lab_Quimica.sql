/* Lógico_1: */
create sequence if not exists res increment 1 start 1;
create sequence if not exists aul increment 1 start 1;


CREATE TABLE Usuario (
    CPF TEXT PRIMARY KEY,
    Senha TEXT,
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
    ID_RESERVA INTEGER DEFAULT nextval('res') PRIMARY KEY,
    HORARIO_RESERVA TIME,
    DATA_RESERVA DATE,
    TURNO TEXT,
    fk_Professor_fk_Usuario_CPF TEXT
);





CREATE TABLE Aula (
    Topico TEXT,
    ID_aula INTEGER DEFAULT nextval('aul') PRIMARY KEY,
    Topicos_abordado TEXT DEFAUlT 'TPO',
    Nome TEXT,
    fk_Professor_fk_Usuario_CPF TEXT
);

CREATE TABLE Experimento (
    Objetivo TEXT,
    Nome TEXT,
    Numero_Experimento INTEGER PRIMARY KEY,
    Arquivo_PDF BYTEA,
    Discussao TEXT,
    Arquivo_IMG BYTEA,
    Vezes_Realizadas INTEGER CHECK(Vezes_Realizadas > 0)
);

CREATE TABLE Produto (
    Nome TEXT,
    ID_Prod INTEGER PRIMARY KEY,
    Descricao TEXT,
    Fabricante TEXT,
    Preco REAL CHECK(Preco > 0),
    Data_de_fabricacao DATE,
    fk_Prateleiras_Numero_Prateleira INTEGER
);

CREATE SEQUENCE produto_seq;

-- Alteração da tabela para adicionar a sequência na coluna ID_Prod
ALTER TABLE Produto
ALTER COLUMN ID_Prod SET DEFAULT NEXTVAL('produto_seq');

CREATE TABLE Quimico (
    Formula_quimica TEXT,
    Concentracao REAL,
    Classe_de_risco TEXT,
    Volume REAL,
    Data_de_validade DATE,
    fk_Produto_ID_Prod INTEGER PRIMARY KEY,
    Quantidade_Quimico REAL
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
    (5, 'Prateleira P', 110),
    (6, 'Prateleira E', 110),
    (7, 'Prateleira F', 100),
    (8, 'Prateleira G', 80),
    (9, 'Prateleira H', 120),
    (10, 'Prateleira I', 90),
    (11, 'Prateleira J', 110),
    (12, 'Prateleira K', 100),
    (13, 'Prateleira L', 80),
    (14, 'Prateleira M', 120),
    (15, 'Prateleira N', 90),
    (16, 'Prateleira 0', 110);
	
	
	
-- Populando a tabela Reserva
INSERT INTO Reserva (HORARIO_RESERVA, DATA_RESERVA, TURNO, fk_Professor_fk_Usuario_CPF)
VALUES
    ('10:00:00', '2023-05-20', 'Manhã', '11111111111'),
    ('14:30:00', '2023-05-21', 'Tarde', '22222222222'),
    ('09:00:00', '2023-05-22', 'Manhã', '33333333333'),
    ('16:00:00', '2023-05-23', 'Tarde', '44444444444'),
    ('11:30:00', '2023-05-24', 'Manhã', '55555555555'),
    ('13:00:00', '2023-05-25', 'Tarde', '66666666666'),
    ('15:30:00', '2023-05-26', 'Tarde', '77777777777'),
    ('10:30:00', '2023-05-27', 'Manhã', '11111111111'),
    ('12:00:00', '2023-05-28', 'Manhã', '22222222222'),
    ('14:00:00', '2023-05-29', 'Tarde', '33333333333');

-- Populando a tabela Aula
INSERT INTO Aula (Topico,Topicos_abordado, Nome, fk_Professor_fk_Usuario_CPF)
VALUES
    ('Introdução à Química','Conceitos básicos de química', 'Aula 1', '11111111111'),
    ('Estrutura Atômica','Modelos atômicos, número atômico e massa atômica', 'Aula 2', '22222222222'),
    ('Ligações Químicas','Ligação iônica, covalente e metálica', 'Aula 3', '33333333333'),
    ('Reações Químicas','Tipos de reações químicas', 'Aula 4', '44444444444'),
    ('Equilíbrio Químico','Princípio de Le Chatelier, constante de equilíbrio', 'Aula 5', '55555555555'),
    ('Cinética Química','Lei da velocidade, fatores que afetam a velocidade', 'Aula 6', '66666666666'),
    ('Termodinâmica','Leis da termodinâmica, entalpia e entropia', 'Aula 7', '77777777777');


-- Populando a tabela Experimento
INSERT INTO Experimento (Objetivo, Nome, Numero_Experimento, Arquivo_PDF, Discussao, Arquivo_IMG, Vezes_Realizadas)
VALUES
    ('Determinação da Densidade', 'Experimento 1', 1, NULL, 'Discussão do experimento 1', NULL,3),
    ('Análise de pH', 'Experimento 2', 2, NULL, 'Discussão do experimento 2', NULL,1),
    ('Síntese de uma Substância', 'Experimento 3', 3, NULL, 'Discussão do experimento 3', NULL,5),
    ('Determinação de Massa Molar', 'Experimento 4', 4, NULL, 'Discussão do experimento 4', NULL,7),
    ('Identificação de Compostos', 'Experimento 5', 5, NULL, 'Discussão do experimento 5', NULL,8),
    ('Titulação Ácido-Base', 'Experimento 6', 6, NULL, 'Discussão do experimento 6', NULL,6),
    ('Extração de Substâncias', 'Experimento 7', 7, NULL, 'Discussão do experimento 7', NULL,9),
    ('Cromatografia em Papel', 'Experimento 8', 8, NULL, 'Discussão do experimento 8', NULL,2);


-- Populando a tabela Produto com 12 linhas
INSERT INTO Produto (Nome, ID_Prod, Descricao, Fabricante, Preco, Data_de_fabricacao, fk_Prateleiras_Numero_Prateleira)
VALUES
    ('Ácido Sulfúrico', 1, 'Ácido altamente corrosivo', 'Fabricante A', 10.50, '2022-10-01', 1),
    ('Espectrômetro', 2, 'Espectrômetro de Massa', 'Fabricante B', 5.25, '2022-09-15', 2),
    ('Etanol', 3, 'Álcool etílico puro', 'Fabricante C', 8.75, '2022-08-20', 3),
    ('Dicromato de Potássio', 4, 'Sal cristalino laranja', 'Fabricante D', 12.30, '2022-11-05', 4),
    ('Ácido Clorídrico', 5, 'Ácido altamente corrosivo', 'Fabricante A', 9.80, '2022-07-10', 5),
    ('Agitador magnético', 6, 'Agitador magnético com rotação', 'Fabricante E', 6.90, '2022-06-25', 6),
    ('Carbonato de Cálcio', 7, 'Sal branco em forma de pó', 'Fabricante F', 4.50, '2022-08-01', 7),
    ('Destilador', 8, 'Destilador de água', 'Fabricante G', 3.25, '2022-09-20', 8),
    ('Permanganato de Potássio', 9, 'Sal cristalino roxo', 'Fabricante H', 7.60, '2022-07-15', 9),
    ('Centrífuga', 10, 'Centrífuga de bancada', 'Fabricante A', 11.80, '2022-06-30', 10),
    ('Água Destilada', 11, 'Água pura destilada', 'Fabricante I', 2.50, '2022-07-05', 11),
    ('Cloreto de Sódio', 12, 'Sal branco em forma de cristais', 'Fabricante J', 1.80, '2022-09-10', 12);



-- Populando a tabela Quimico
INSERT INTO Quimico (Formula_quimica, Concentracao, Classe_de_risco, Volume, Data_de_validade, fk_Produto_ID_Prod,Quantidade_Quimico)
VALUES
    ('H2SO4', 0.5, 'Ácido corrosivo', 100.0, '2023-06-01', 1,48.8),
    ('NaOH', 0.8, 'Base cáustica', 200.0, '2023-06-02', 3,9),
    ('Cr2O7', 0.3, 'Substância oxidante', 50.0, '2023-06-03', 7,90),
    ('HCl', 0.7, 'Ácido corrosivo', 150.0, '2023-06-04', 9,100);
    

-- Populando a tabela Equipamento
INSERT INTO Equipamento (Tipo, Capacidade, Condicoes_de_operacao, Calibracao, fk_Produto_ID_Prod)
VALUES
    ('Espectrômetro', 1000.0, 'Temperatura controlada', 'Anual', 2),
    ('Agitador magnético', 500.0, 'Rotação ajustável', 'Mensal', 6),
    ('Destilador', 2000.0, 'Destilação a vácuo', 'Semestral', 8),
    ('Centrífuga', 3000.0, 'Velocidade ajustável', 'Trimestral', 10);


-- Populando a tabela Realiza_experimento
INSERT INTO Realiza_experimento (fk_Aula_ID_aula, fk_Experimento_Numero_Experimento, Observacao)
VALUES
    (1, 1,'Experimento realizado com sucesso'),
    (2, 2,'Experimento apresentou resultados promissores'),
    (3, 1,'Experimento precisa de ajustes'),
    (4, 3,'Experimento concluído com êxito'),
    (5, 2,'Experimento em andamento');

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
	
	

--Triggers
--1
CREATE OR REPLACE FUNCTION atualizar_numero_aulas()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE Professor
        SET Num_aulas = Num_aulas + 1
        WHERE fk_Usuario_CPF = NEW.fk_Professor_fk_Usuario_CPF;
    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE Professor
        SET Num_aulas = Num_aulas - 1
        WHERE fk_Usuario_CPF = OLD.fk_Professor_fk_Usuario_CPF;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_numero_aulas_trigger
AFTER INSERT OR DELETE ON Reserva
FOR EACH ROW
EXECUTE FUNCTION atualizar_numero_aulas();


--Triggers
--2

CREATE OR REPLACE FUNCTION decrementar_quantidade_quimico()
RETURNS TRIGGER AS $$
DECLARE 
	ID_produto INTEGER;
	Vezes_Realizadas1 INTEGER;
	Quantidade_Quimico1 REAL;
	
BEGIN

	SELECT ID_Prod INTO ID_produto FROM Produto 
	WHERE fk_Prateleiras_Numero_Prateleira = NEW.fk_Prateleiras_Numero_Prateleira LIMIT 1;
	RAISE NOTICE 'ID %', ID_produto;
	
	SELECT Vezes_Realizadas INTO Vezes_Realizadas1 FROM Experimento
	WHERE Numero_Experimento = NEW.fk_Experimento_Numero_Experimento LIMIT 1;
	
	RAISE NOTICE 'VZ %', Vezes_Realizadas1;
	
	
	SELECT Quantidade_Quimico INTO Quantidade_Quimico1 FROM Quimico
	WHERE fk_Produto_ID_Prod = ID_produto;
	
	RAISE NOTICE 'Quantidade %', Quantidade_Quimico1;



	IF Quantidade_Quimico1 - (NEW.Quantidade * Vezes_Realizadas1) >= 0 THEN 
		
		UPDATE Quimico
		SET Quantidade_Quimico = Quantidade_Quimico - (NEW.Quantidade * Vezes_Realizadas1)
		WHERE fk_Produto_ID_Prod = ID_produto;

	ELSE
		RAISE EXCEPTION 'Quantidade de produto não disponível';
	
	END IF;
	

	RETURN NULL;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER decrementar_quantidade_quimico_trigger
AFTER INSERT ON Prepara_Prateleiras_Experimento_Tecnico
FOR EACH ROW
EXECUTE FUNCTION decrementar_quantidade_quimico();


--Triggers
--3

CREATE OR REPLACE FUNCTION atualizar_produto_prateleira()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Capacidade_de_armazenamento = 0 THEN
        UPDATE produto SET fk_Prateleiras_Numero_Prateleira = NULL 
        WHERE fk_Prateleiras_Numero_Prateleira = NEW.numero_prateleira;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER atualizar_prateleira 
AFTER UPDATE ON prateleiras
FOR EACH ROW
EXECUTE FUNCTION atualizar_produto_prateleira();






--Procedures
--1

CREATE OR REPLACE FUNCTION VerificarDisponibilidadeLaboratorio(p_Data DATE, p_Hora TIME)
RETURNS int AS $$
DECLARE
    v_Disponivel BOOLEAN;
BEGIN
    -- Verifica se o laboratório está disponível na data e hora especificadas
    SELECT NOT EXISTS (
        SELECT 1
        FROM Reserva
        WHERE DATA_RESERVA = p_Data
        AND HORARIO_RESERVA = p_Hora
    ) INTO v_Disponivel;
    
    -- Retorna o resultado da disponibilidade
    IF v_Disponivel THEN
        RAISE NOTICE 'O laboratório está disponível na data % e hora %.', p_Data, p_Hora;
		RETURN 1;
    ELSE
        RAISE NOTICE 'O laboratório não está disponível na data % e hora %.', p_Data, p_Hora;
		RETURN 2;
    END IF;
END;
$$ LANGUAGE plpgsql;


--Procedure2
CREATE OR REPLACE FUNCTION ObterInformacoesUsuario(p_CPF TEXT)
RETURNS TABLE (
    CPF TEXT,
    Email TEXT,
    Nome TEXT,
    Telefone TEXT,
    Funcao TEXT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        U.CPF,
        U.Email,
        U.Nome,
        U.Telefone,
        CASE
            WHEN P.fk_Usuario_CPF IS NOT NULL THEN 'Professor'
            WHEN T.fk_Usuario_CPF IS NOT NULL THEN 'Tecnico'
            ELSE 'N/A'
        END AS Funcao
    FROM
        Usuario U
    LEFT JOIN Professor P ON U.CPF = P.fk_Usuario_CPF
    LEFT JOIN Tecnico T ON U.CPF = T.fk_Usuario_CPF
    WHERE
        U.CPF = p_CPF;
END;
$$ LANGUAGE plpgsql;


--Procedure 3
CREATE OR REPLACE FUNCTION verificaTurno()
RETURNS INT AS $$
DECLARE 
	auxTurno RECORD;
BEGIN 
	FOR auxTurno IN SELECT ID_RESERVA, HORARIO_RESERVA FROM Reserva LOOP
	
 		IF auxTurno.HORARIO_RESERVA >= '06:00:00' AND auxTurno.HORARIO_RESERVA <= '12:00:00' THEN
			UPDATE Reserva SET TURNO = 'Matutino' WHERE ID_RESERVA = auxTurno.ID_RESERVA;
		
		ELSIF auxTurno.HORARIO_RESERVA >= '12:00:00' AND auxTurno.HORARIO_RESERVA <= '18:00:00' THEN 
				UPDATE Reserva SET TURNO = 'Vespertino' WHERE ID_RESERVA = auxTurno.ID_RESERVA;
		
		ELSE
			UPDATE Reserva SET TURNO = 'Noturno' WHERE ID_RESERVA = auxTurno.ID_RESERVA;
	END IF;	
	
	END LOOP;

RETURN 1;
END;

$$ LANGUAGE plpgsql;

-- VISÕES
CREATE VIEW INFO_AULAS AS
SELECT U.Nome,A.Topico,R.HORARIO_RESERVA
FROM Professor AS P,Aula AS A,Reserva AS R, Usuario AS U 
WHERE R.fk_Professor_fk_Usuario_CPF = P.fk_Usuario_CPF 
AND A.fk_Professor_fk_Usuario_CPF = P.fk_Usuario_CPF 
AND P.fk_Usuario_CPF = U.CPF;
	

CREATE VIEW INFO_PREPARA AS 
SELECT U.Nome AS NomeUsuario, E.Nome AS NomeExperimento, P.Nome AS NomePrateleira
FROM Usuario AS U, Experimento AS E, Prateleiras AS P, Tecnico AS T, Prepara_Prateleiras_Experimento_Tecnico AS Prepara
WHERE Prepara.fk_Prateleiras_Numero_Prateleira = P.Numero_Prateleira
AND Prepara.fk_Experimento_Numero_Experimento = E.Numero_Experimento
AND Prepara.fk_Tecnico_fk_Usuario_CPF = T.fk_Usuario_CPF
AND U.CPF = T.fk_Usuario_CPF;


BEGIN;

-- Operação 1: Inserir um novo experimento na tabela Experimento
INSERT INTO Experimento (Objetivo, Nome, Numero_Experimento, Arquivo_PDF, Discussao, Arquivo_IMG, Vezes_Realizadas)
VALUES ('Determinação da Concentração', 'Experimento 5', 545, NULL, 'Discussão do experimento 5', NULL, 3);

INSERT INTO Usuario (CPF, Email, Nome, Telefone)
VALUES('77777778', 'usuario1@email.com', 'Usuário 1', '111111111');

-- Operação 3: Atualizar a quantidade de químico na tabela Quimico
UPDATE Quimico
SET Quantidade_Quimico = Quantidade_Quimico + 100
WHERE fk_Produto_ID_Prod = 1001;

ROLLBACK;



BEGIN;

-- Operação 1: Atualizar o preço do produto na tabela Produto
UPDATE Produto
SET Preco = Preco * 1.1
WHERE ID_Prod = 28;

INSERT INTO Usuario (CPF,senha,Email, Nome, Telefone)
VALUES('77777778','123','usuario1@email.com', 'Usuário 1', '111111111');

-- Operação 3: Excluir um experimento da tabela Experimento
DELETE FROM Experimento
WHERE Numero_Experimento = 4456;

COMMIT;

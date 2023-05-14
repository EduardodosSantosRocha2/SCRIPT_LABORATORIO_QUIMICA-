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
    Num_aulas INTEGER,
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
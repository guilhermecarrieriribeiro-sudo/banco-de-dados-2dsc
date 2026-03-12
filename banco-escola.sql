-- Criação do banco de dados
CREATE DATABASE escola;

-- Selecionar o banco de dados a ser utilizado
USE escola;

-- Tabela de Alunos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do aluno
    nome VARCHAR(100) NOT NULL,         -- Nome do aluno
    data_nascimento DATE,               -- Data de nascimento do aluno
    cpf VARCHAR(14) UNIQUE NOT NULL,    -- CPF do aluno, único
    email VARCHAR(100),                 -- E-mail do aluno
    telefone VARCHAR(15)                -- Telefone do aluno
);

-- Tabela de Professores
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único do professor
    nome VARCHAR(100) NOT NULL,          -- Nome do professor
    data_nascimento DATE,                -- Data de nascimento do professor
    cpf VARCHAR(14) UNIQUE NOT NULL,     -- CPF do professor, único
    email VARCHAR(100),                  -- E-mail do professor
    telefone VARCHAR(15),                -- Telefone do professor
    departamento VARCHAR(50)             -- Departamento ou área de atuação
);

-- Tabela de Disciplinas
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único da disciplina
    nome VARCHAR(100) NOT NULL,          -- Nome da disciplina
    descricao TEXT                       -- Descrição da disciplina
);

-- Tabela de Matrículas
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único da matrícula
    aluno_id INT NOT NULL,               -- ID do aluno (chave estrangeira)
    disciplina_id INT NOT NULL,          -- ID da disciplina (chave estrangeira)
    data_matricula DATE NOT NULL,        -- Data da matrícula
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),   -- Relacionamento com a tabela alunos
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) -- Relacionamento com a tabela disciplinas
);

-- Tabela de Aulas
CREATE TABLE aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único da aula
    professor_id INT NOT NULL,           -- ID do professor (chave estrangeira)
    disciplina_id INT NOT NULL,          -- ID da disciplina (chave estrangeira)
    data_aula DATETIME NOT NULL,         -- Data e hora da aula
    sala VARCHAR(50),                    -- Sala onde a aula será ministrada
    FOREIGN KEY (professor_id) REFERENCES professores(id), -- Relacionamento com a tabela professores
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)  -- Relacionamento com a tabela disciplinas
);

-- Tabela de Notas
CREATE TABLE notas (
    id INT AUTO_INCREMENT PRIMARY KEY,    -- Identificador único da nota
    matricula_id INT NOT NULL,            -- ID da matrícula (chave estrangeira)
    nota DECIMAL(5,2) NOT NULL,           -- Nota do aluno
    data_avaliacao DATE NOT NULL,         -- Data da avaliação
    FOREIGN KEY (matricula_id) REFERENCES matriculas(id) -- Relacionamento com a tabela matriculas
);

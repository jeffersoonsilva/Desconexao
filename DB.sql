CREATE DATABASE IF NOT EXISTS desconexao;
USE desconexao;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('aluno', 'populacao', 'instrutor', 'admin') DEFAULT 'populacao',
    pontos INT DEFAULT 0,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE atividades (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    local VARCHAR(150) NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    vagas INT DEFAULT 20,
    pontos INT DEFAULT 10,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inscricoes (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_atividade INT NOT NULL,
    presenca TINYINT(1) DEFAULT 0,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_atividade) REFERENCES atividades(id_atividade)
);

CREATE TABLE recompensas (
    id_recompensa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    pontos_necessarios INT NOT NULL
);

CREATE TABLE resgates (
    id_resgate INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_recompensa INT NOT NULL,
    data_resgate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_recompensa) REFERENCES recompensas(id_recompensa)
);

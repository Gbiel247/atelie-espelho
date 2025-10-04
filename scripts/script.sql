CREATE DATABASE raphietro_atelier;

USE raphietro_atelier;

CREATE TABLE Usuarios (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Email VARCHAR(100) NOT NULL UNIQUE,
    Sexo ENUM('Masculino', 'Feminino', 'Outro'),
    Telefone VARCHAR(20)
);

CREATE TABLE Clientes (
    Cliente_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Email VARCHAR(100) NOT NULL UNIQUE,
    Sexo ENUM('Masculino', 'Feminino', 'Outro'),
    Telefone VARCHAR(20)
);

CREATE TABLE Servicos (
    Servico_ID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(150) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedido (
    Pedido_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Cliente_ID INT NOT NULL,
    Status ENUM('Pendente', 'Em Andamento', 'Concluido', 'Cancelado') NOT NULL DEFAULT 'Pendente',
    Valor_Total DECIMAL(10, 2),
    Data_Pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (User_ID) REFERENCES Usuarios(User_ID),
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID)
);

CREATE TABLE ItensPedido (
    Itens_ID INT PRIMARY KEY AUTO_INCREMENT,
    Pedido_ID INT NOT NULL,
    Servico_ID INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    
    FOREIGN KEY (Pedido_ID) REFERENCES Pedido(Pedido_ID) ON DELETE CASCADE,
    FOREIGN KEY (Servico_ID) REFERENCES Servicos(Servico_ID) ON DELETE RESTRICT
);
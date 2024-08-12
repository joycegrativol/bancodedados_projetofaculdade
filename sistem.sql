-- Criando o banco de dados
CREATE DATABASE SistemaReservasHotel;

-- Usando o banco de dados
USE SistemaReservasHotel;

-- Criando a tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    documento_identidade VARCHAR(50) UNIQUE,
    data_nascimento DATE
);

-- Criando a tabela Quartos
CREATE TABLE Quartos (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero_quarto VARCHAR(10) UNIQUE NOT NULL,
    tipo_quarto VARCHAR(50) NOT NULL,
    preco_diaria DECIMAL(10, 2) NOT NULL,
    descricao TEXT,
    status VARCHAR(20) DEFAULT 'disponível' -- status pode ser 'disponível', 'reservado', 'manutenção'
);

-- Criando a tabela Reservas
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_quarto INT,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'reservado', -- status pode ser 'reservado', 'cancelado', 'concluído'
    data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_quarto) REFERENCES Quartos(id_quarto)
);

-- Criando a tabela Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    valor_pagamento DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50), -- pode ser 'cartão', 'dinheiro', 'transferência', etc.
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pendente', -- status pode ser 'pendente', 'pago', 'cancelado'
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

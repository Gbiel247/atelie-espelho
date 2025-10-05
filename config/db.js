// config/db.js

// Recomendação: use 'mysql2' para melhor performance. Se o tiver instalado,
// mude a linha abaixo para: const mysql = require('mysql2');
const mysql = require('mysql2');

// Defina suas credenciais em um único lugar para evitar inconsistências
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '1234', // <-- ATENÇÃO: Confirme se esta é a sua senha correta do MySQL. Se não tiver senha, deixe ''
    database: 'raphietro_atelier'
};

const conn = () => {
    console.log("Tentando estabelecer conexão com o banco de dados...");
    
    // Agora, usamos o objeto de configuração diretamente.
    // Qualquer mudança nas credenciais só precisa ser feita em um lugar.
    return mysql.createConnection(dbConfig);
};

module.exports = conn;
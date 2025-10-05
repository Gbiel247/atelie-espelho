// Arquivo: /models/homeModel.js
module.exports = {
    getClientes: (db, callback) => {
        console.log("Model: getClientes");
        const sql = 'SELECT * FROM Clientes'; // A tabela se chama 'Clientes'
        db.query(sql, callback);
    }
};
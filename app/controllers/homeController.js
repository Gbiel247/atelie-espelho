// Importa a função de conexão com o banco
const dbConn = require('../../config/db');

// Importa o seu model. Note que pegamos o objeto inteiro.
const homeModel = require('../models/homeModel');

// Esta é a ÚNICA função que você precisa para a sua página principal
module.exports.home = (app, req, res) => {
    console.log('Controller da home executado');
    
    // 1. Pega a conexão com o banco de dados
    const db = dbConn();

    // 2. Chama a função do model para buscar TODOS os clientes
    // A função 'getClientes' está dentro de 'homeModel'
    homeModel.getClientes(db, (error, result) => {
        
        // 3. Trata um possível erro da consulta
        if (error) {
            console.log("Erro ao buscar clientes:", error);
            // Em caso de erro, avise o usuário e pare a execução
            res.send("Ocorreu um erro ao consultar os dados.");
            return; // ESSENCIAL: para a execução para não tentar renderizar a página
        }
        
        // 4. Se tudo deu certo, renderiza a página EJS
        // e passa o array de clientes para a view com o nome 'clientes'
        console.log("Clientes encontrados:", result);
        res.render('home.ejs', { clientes: result });
    });
};

// Você não precisa mais da função getClientesController,
// pois a lógica dela foi incorporada na função 'home' acima.
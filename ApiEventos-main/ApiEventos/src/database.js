const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root', 
    password: '',
    database: 'apideparche',
    dialect: 'mysql',
    port: 3306,
});

mysqlConnection.connect(function (err) {
    if (err) {
        console.log(err);
        return;
    } else {
        console.log('Db is created successfully!');
    }
});

module.exports = mysqlConnection;
const mysql = require('mysql2');

// CONNECTION STRING
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'frame_dummy'
})

module.exports = connection;
var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'localhost',
  user            : 'root',
  password        : 'root123',
  database        : 'Pawsitive'
});

module.exports.pool = pool;

const mysql = require('mysql');

var mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'addition'
})

const connectToSql = ()=>{
    mysqlConnection.connect((err)=>{
        if(!err){
            console.log("db connected");
        }else{
            console.log('error occured '+JSON.stringify(err,undefined, 2));
        }
    })
}

module.exports = {connectToSql, mysqlConnection};
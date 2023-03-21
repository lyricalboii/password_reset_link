const {connectToSql, mysqlConnection} = require('./db');
const express = require("express");
const bodyParser = require('body-parser')
const cors = require('cors');
const jwt = require('jsonwebtoken');

connectToSql()
const app = express();
app.use(bodyParser.json())
app.use(express.urlencoded({extended: false}))
app.use(cors())

let users = {
    id: 2,
    first_name: 'meet',
    last_name: 'dobariya',
    password: 'renidh',
    url_to_reset: null,
  };
  function makeid(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}
const JWT_SECRET = 'shhh!';
const insertUrl = ()=>{
    mysqlConnection.query('SELECT * FROM users', (err, rows, fields)=>{
        if(!err){
            rows.forEach(user => {
                const secret = JWT_SECRET + user.password;
                let random_id = makeid(5)
                const payload = {
                    id: user.id,
                    rand_id: random_id
                }
                const token = jwt.sign(payload, secret);
                const link = `http://localhost:5050/reset_password/${random_id}/${token}`;
                var sql = `UPDATE users SET rand_id = '${random_id}', url_to_reset = '${link}' WHERE id = ${user.id}`;

                mysqlConnection.query(sql, (err, rows, fields)=>{
                    if(!err){
                       console.log('inserted')
                    }else{
                        console.log(err);
                    }
                })
                
            });
        }else{
            console.log(err);
        }
    })
    
}

const fetchData = async(id) =>{
    mysqlConnection.query(`SELECT * FROM users WHERE id = ${id}`, (err, rows, fields)=>{
        if(!err){
            users = rows[0];
        }else{
            console.log(err);
        }
    })
}

app.get('/',(req, res)=>{
    // fetchData(2)
    res.send("hey")
})


app.get('/getdata/:id', (req,res)=>{
    mysqlConnection.query('SELECT * FROM users WHERE id = ?', [req.params.id], (err, rows, fields)=>{
        if(!err){
            res.status(200).send(rows)
        }else{
            console.log(err);
        }
    })
})

app.post('/register', (req,res)=>{
    mysqlConnection.query(`SELECT * FROM users WHERE email = '${req.body.email}'`, (err, rows, fields)=>{
        if(!err){
           if(!rows[0]){
            var sql = `INSERT INTO users (name, email, password) VALUES ('${req.body.name}', '${req.body.email}', '${req.body.password}')`;

            mysqlConnection.query(sql, (err, rows, fields)=>{
                if(!err){
                   mysqlConnection.query('SELECT * FROM users WHERE id = ?', [rows.insertId], (err, rows, fields)=>{
                    if(!err){
                        res.status(200).send({success: false, user: rows[0]}) 
                    }else{
                        console.log(err);
                    }
                })
                }else{
                    console.log(err);
                }
            })
           }else{
            res.status(200).send({success: false, msg: "Email Already Taken"}) 
           }
        }else{
            console.log(err);
        }
    })

    
})


app.get('/reset_password/:id/:token', (req,res)=>{
    const {id, token} = req.params;

    mysqlConnection.query(`SELECT * FROM users WHERE rand_id = '${id}'`, (err, rows, fields)=>{
        if(!err){
            if(rows.length == 0){
                res.send("invalid id")
            }else{
                const secret = JWT_SECRET+rows[0].password
                try {
                    const payload = jwt.verify(token, secret)
                    
                    res.send(payload)
                } catch (error) {
                    res.send(error.message)
                }
                
            }
        }else{
            console.log(err);
        }
    })

    
})

app.listen(5050, ()=>{
    insertUrl();
    console.log('express running on port 5050');
})
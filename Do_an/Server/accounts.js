const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const fs = require('fs');



const app = express();


router.get("/register", (req, res)=>{
    fs.readFile('../Client/E_Accounts/register.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end()
    })   


    
});


router.get("/login", (req, res)=>{
    fs.readFile('../Client/E_Accounts/login.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end()
    })

});


router.post("/process-register", (req,res) => {
    var ac = {
        Username: req.body.username,
        Password: req.body.password,
        Email: req.body.email,
        Phone: req.body.phone,
        Address: req.body.address,
        Fullname: req.body.fullname,
        IsAdmin: req.body.IsAdmin,
        Avatar: req.body.avatar,
        Status: req.body.Status
    };

    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
      
        var sql = `INSERT INTO account( Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('${ac.Username}','${ac.Password}','${ac.Email}','${ac.Phone}','${ac.Address}','${ac.Fullname}',${ac.IsAdmin},'${ac.Avatar}',${ac.Status})`;
        con.query(sql, function (err, result) {
            if (err) throw err;
            console.log(result);
            
            res.redirect('/accounts/login');
        });
        
        
    });
});



router.post("/process-login", (req, res)=>{	
    var ac = {
        Username: req.body.username,
        Password: req.body.password
    }

    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
        // 
        var sql = `SELECT * FROM account WHERE Username = ? AND Password = ?`;
        con.query(sql, [ac.Username, ac.Password], function (err, result) {
            if (err) throw err;

            if(result.length > 0){                             
                res.redirect('/products/');     
            }
            else
            {
                res.redirect('/accounts/login');
                console.log("Tài khoản hoặc mật khâu ko đúng");
            }
            
        });
    });	
});


module.exports = router;

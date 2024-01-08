const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const fs = require('fs');


router.get('/', (req, res) => {
    fs.readFile('../Client/E_Products/products.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end();
    })
});


router.get('/list-products', (req, res) => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
        con.query("SELECT products.Id, `SKU`, products.Name as `NamePr`, `Description`, `Price`, `Stock`, producttypes.Name, `Image`, products.Status FROM `products`, `producttypes` WHERE products.ProductTypeld = producttypes.Id", function (err, result) {
            if (err) throw err;
            console.log(result);
            res.send(result);
        });
    });
});



router.get('/types-products', (req, res) => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
        con.query("select * from `producttypes` ", function (err, result) {
            if (err) throw err;
            res.send(result);
        });
    });

});



var i = 0;
router.post('/types', (req, res) => {
    fs.readFile('../Client/E_products/products-theoloai.html', (err, data) =>{
        if (err) throw err;
        const id = req.body.type;
        i = id;
        res.write(data);
        res.end();
    });
});


router.get('/product-type', (req, res) => {

    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });



    con.connect(err => {
        var sql = "SELECT products.Id, `SKU`, products.Name as `NamePr`, `Description`, `Price`, `Stock`, producttypes.Name, `Image`, products.Status FROM products, producttypes WHERE ProductTypeld = ? AND products.ProductTypeld = producttypes.Id";
        if (err) throw err;
        con.query(sql, [i] ,function (err, result) {
            if (err) throw err;
            res.send(result);
       
        });
    
        });


});






module.exports = router;
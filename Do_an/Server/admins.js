const express = require('express');
const mysql = require('mysql');
const router  = express.Router();
const fs = require('fs');


router.get("/invoices", (req, res)=>{
    fs.readFile('../Client/Admin/admin_invoices.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end()
    })   
});

router.get('/list-invoices', (req, res) => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
        con.query("SELECT `Id`, `Code`, `Accountld`, `IssuedDate`, `ShippingAddress`, `ShippingPhone`, `Total`, IF(`Status`=1, 'Hoạt động', 'Ngưng hoạt động') as 'Status' FROM `invoices`", function (err, result) {
            if (err) throw err;
            res.send(result);
           
        });
    });
});




router.get("/accounts", (req, res)=>{
    fs.readFile('../Client/Admin/admin_accounts.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end()
    })   

});

router.get('/list-accounts', (req, res) => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "eshop"
    });

    con.connect(err => {
        if (err) throw err;
        con.query("SELECT `Id`, `Username`, `Password`, `Email`, `Phone`, `Address`, `FullName`, IF(`IsAdmin` =1, 'admin', 'customer') as 'IsAdmin', `Avatar`, IF(`Status`=1, 'Hoạt động', 'Ngưng hoạt động') as 'Status' FROM `account`", function (err, result) {
            if (err) throw err;
            res.send(result);
            console.log(result);

        });
    });
});
    


router.get("/products", (req, res)=>{
    fs.readFile('../Client/Admin/admin_products.html',(err,data)=>
    {
        if (err) throw err;
        res.write(data)
        res.end()
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
        con.query("SELECT products.Id, `SKU`, products.Name, `Description`, `Price`, `Stock`, producttypes.Name as `Name_type`, `Image`, IF(products.Status=1, 'Hoạt động', 'Ngưng hoạt động') AS Status FROM `products`, `producttypes` WHERE products.ProductTypeld = producttypes.Id", function (err, result) {
            if (err) throw err;
            res.send(result);

        });
    });
});






module.exports = router;
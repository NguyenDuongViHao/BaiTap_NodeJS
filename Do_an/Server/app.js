const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const fs = require('fs');

const port = 3000;


const account = require('./accounts');
const products = require('./products');
const admin = require('./admins');

const app = express();


app.use(express.static(__dirname + "/te"));
app.use(cors());
app.use(express.urlencoded({
    extended: true
}));



app.use("/accounts/", account, products);
app.use("/products/", products);
app.use("/admin/", admin);








app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
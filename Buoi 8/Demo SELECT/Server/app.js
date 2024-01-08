const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

app.get('/', (req, res) => {
    var con = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "qlsinhvien"
    });

    con.connect(function (err) {
        if (err) throw err;
        con.query("SELECT * FROM sinhvien", function (err, result) {
            if (err) throw err;
            res.send(result);
        });
    });
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
});
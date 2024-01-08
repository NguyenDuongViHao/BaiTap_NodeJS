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
        pass: "",
        database: "qlsinhvien"
    });

    con.connect(error => {
        if (error) throw error;
        con.query("SELECT * FROM sinhvien", (error, result) => {
            if (error) throw error;
            res.send(result);
        });
    });
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
const express = require('express');

const account_E = require('./Router/account');


const app = express();

const port = 3000;

app.use('/accounts', account_E);




app.listen(port,()=>{
	console.log(`sussesfull`, port);
});

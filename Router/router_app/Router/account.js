const express = require('express');
const router = express.Router();

router.get("/one", (req, res)=>{
    res.redirect("http://127.0.0.1:5500/index.html");
    
});

module.exports = router;

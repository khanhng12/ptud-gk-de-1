var express = require('express');
var router = express.Router();

router.get('/',(req,res) =>{
    try {
        res.cookie("Authorization","",{maxAge : 0});
    } catch (error) {
        res.send({msg: error});
    }
    console.log('Đã đăng xuất');
    res.redirect('/admin/login');
});

module.exports = router;
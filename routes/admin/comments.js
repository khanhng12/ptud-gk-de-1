var express = require('express');
var router = express.Router();
var config = require('../databaseconfig')
var connection = config.connection;

/* GET users listing. */
router.get('/', function(req, res, next) {
  var getComments = "SELECT * FROM binhluan INNER JOIN thongtindocgia ON binhluan.IdDocGia = thongtindocgia.IdDocGia limit 10";

  connection.query(getComments, (err,rs) => {
    if(err) console.log(err);
    else{
      res.render('admin/ad-comments',{comments : rs});
    }
  });
  
});

module.exports = router;

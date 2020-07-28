var express = require('express');
var router = express.Router();
var config = require('./databaseconfig');
var connection= config.connection;

/* GET home page. */
router.get('/', function(req, res, next) {
  connection.query ('select * from danhmuc', function(error, results){
    if (results){
      res.render('user/index', {text : results});
      console.log(results);
    }
    else{
      console.log(error);
      res.render('error')
    }
 });
});

module.exports = router;

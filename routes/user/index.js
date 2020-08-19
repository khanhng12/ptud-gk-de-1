var express = require('express');
var router = express.Router();
var config = require('../databaseconfig');
var connection = config.connection;


/* GET home page. */
router.get('/', function(req, res, next) { 
  var getListSql = 'select * from baiviet inner join taikhoan on tacgia = taikhoan order by NgayViet asc limit 10;';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select TenDanhMuc from DanhMuc';
  var sql = getListSql+getTopSql+getCategoriesSql;
  connection.query (sql, function(error, results,fields){
    if (results){
      var length = results[0].length;
      console.log(length);
      res.locals.length = length;
      res.render('user/index', {list: results[0],topTopics:results[1],categories:results[2]});
    }
    else{
      console.log(error);
      res.render('error');
    }
 });
});

router.get('/page/:number', (req,res,next) => {
  var getListSql = 'select * from baiviet inner join taikhoan on tacgia = taikhoan order by NgayViet asc limit 10 offset '+ (req.params.number*10 - 10) + ';';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select TenDanhMuc from DanhMuc';
  var sql = getListSql+getTopSql+getCategoriesSql;
  connection.query (sql, function(error, results,fields){
    if (results){
      var length = results[0].length;
      console.log(length);
      res.locals.length = length;
      res.render('user/index', {list: results[0],topTopics:results[1],categories:results[2]});
    }
    else{
      console.log(error);
      res.render('error');
    }
 });
});

router.get('/:item', (req,res) =>{
  var getItemSql = 'SELECT * FROM baiviet where TieuDeURL = ?;';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select TenDanhMuc from DanhMuc;';
  var getCategoriesTopicSql = 'SELECT TenDanhMuc FROM DanhMuc INNER JOIN BaiViet_DanhMuc ON DanhMuc.IdDanhMuc = BaiViet_DanhMuc.IdDanhMuc where BaiViet_DanhMuc.TieuDeURL = ?;';
  var sql = getItemSql+getTopSql+getCategoriesSql+getCategoriesTopicSql;
  connection.query(sql,[req.params.item,req.params.item], (error,results,fields)=>{
    if(results){
      console.log(results[0]);
      res.render('user/read',{topic: results[0],topTopics:results[1],categories:results[2],categoriesTopic:results[3]});
    }
    else {
      console.log(error);
      res.render('error');
    }
  });
});

module.exports = router;

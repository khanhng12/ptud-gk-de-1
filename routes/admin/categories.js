var express = require('express');
var router = express.Router();
var config = require('../databaseconfig');
var connection = config.connection;
var verifyToken = require('../verifyToken');


/* GET users listing. */
router.get('/',verifyToken.checkToken,verifyToken.protectRoute, function(req, res, next) {
  var getCategoryList = "SELECT * FROM danhmuc";

  var sql = getCategoryList;
  connection.query(sql,function (err,rs){
    if(err)
      console.log(err);
    else {
      res.render('admin/ad-categories',{categories:rs});
    }
  })
});
// Thêm danh mục mới
router.post('/addnew',verifyToken.checkToken,verifyToken.protectRoute, (req,res) =>{
  var insertCategory = "INSERT INTO danhmuc(TenDanhMuc) VALUES(?);"

  var sql = insertCategory;
  connection.query(sql,[req.body.categoryName],(err,rs)=>{
    if (err) {
      console.log(err);
    }
    else{
      console.log(rs);
      res.redirect('back');
    }
  });
});
// Chỉnh sửa một danh mục
router.post('/edit',verifyToken.checkToken,verifyToken.protectRoute,(req,res) =>{
  var editCategory = "UPDATE danhmuc SET TenDanhMuc = ? WHERE IdDanhMuc = ?;"

  connection.query(editCategory,[req.body.TenDanhMuc,req.body.IdDanhMuc],(err,rs) =>{
    if(err) console.log(err);
    else{
      console.log('Cap nhat danh muc thanh cong');
      res.redirect('/admin/categories');
    }
  });
});

router.post('/delete/:idDanhMuc',verifyToken.checkToken,verifyToken.protectRoute,(req,res) =>{
  var deleteCategory = "DELETE FROM danhmuc WHERE IdDanhMuc = ?;";

  connection.query(deleteCategory,[req.params.idDanhMuc],function (err,rs) {
    if(err) console.log(err);
    res.redirect('/admin/categories');
  });
});

module.exports = router;

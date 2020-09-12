var express = require('express');
var router = express.Router();
var config = require('../databaseconfig');
const { route } = require('../user');
var connection = config.connection;
var changealias = require('../../changealia');
var verifyToken = require('../verifyToken');
var jwt = require('jsonwebtoken');
const e = require('express');

/* GET topics listing */
router.get('/',verifyToken.checkToken,verifyToken.protectRoute, function(req, res, next) {
  var getListTopics = "SELECT * FROM baiviet INNER JOIN taikhoan ON TacGia =taikhoan ORDER BY NgayViet DESC LIMIT 10";

  var sql = getListTopics;

  connection.query(sql, function(error,results){
    if(error){
      console.log(error);
      res.render('error');
    }
    res.render('admin/ad-topics', {listTopics: results});
  });
});

router.get('/page/:id',verifyToken.checkToken,verifyToken.protectRoute, function(req,res){
  var getListTopics = "SELECT * FROM baiviet INNER JOIN taikhoan ON TacGia =taikhoan ORDER BY NgayViet DESC LIMIT 10 OFFSET ?";

  var sql = getListTopics;

  connection.query(sql,[req.params.id*10 - 10], function(error,results){
    if(error){
      console.log(error);
      res.render('error');
    }
    res.render('admin/ad-topics', {listTopics: results});
  });
});

// Get a topic to edit
router.get('/edit/:id',verifyToken.checkToken,verifyToken.protectRoute,(req,res) =>{
  var getTopic = "SELECT TieuDeURL,TieuDe,NoiDung FROM `baiviet` WHERE baiviet.TieuDeURL = ?;";
  var getCategories = "SELECT TenDanhMuc FROM baiviet_danhmuc INNER JOIN danhmuc ON baiviet_danhmuc.IdDanhMuc = danhmuc.IdDanhMuc INNER JOIN baiviet ON baiviet.TieuDeURL = baiviet_danhmuc.TieuDeURL WHERE baiviet_danhmuc.TieuDeURL = ?;";
  var getCategoryList = "SELECT * FROM danhmuc;";
  var sql = getTopic + getCategories + getCategoryList;
  var token = req.cookies.Authorization; 
  var decoded = jwt.decode(token);

  connection.query(sql,[req.params.id,req.params.id], (err,rs) =>{
    if (err) {
      console.log(err);
    } else {
      res.render('admin/ad-topic-edit',{baiViet: rs[0],danhMuc : rs[1],dsDanhMuc : rs[2]});
    }
  });
});

//Edit a topic 
router.post('/edit/:id',verifyToken.checkToken,verifyToken.protectRoute,(req,res) =>{
 
  var updateTopic = "UPDATE baiviet SET TieuDe = ?,NoiDung = ? WHERE TieuDeURL = ?;";
  var insertTopicAndCategoryItem = "INSERT INTO baiviet_danhmuc VALUES ('"+req.params.id+"',";

  var deleteTopicAndCategory = "DELETE FROM baiviet_danhmuc WHERE TieuDeURL = ?;"
  var insertTopicAndCategory = "";
  var getCategoryList ="SELECT * FROM danhmuc";
  //Cap nhật bài viết và lấy danh sách danh mục
  connection.query(updateTopic + getCategoryList,[req.body.TieuDe,req.body.NoiDung,req.params.id],(err,rs)=>{
    if(err)
      console.log(err)
    else{
      console.log('Cap nhat bai viet thanh cong');
      console.log('-----------------------------------------------');
      connection.query(deleteTopicAndCategory,[req.params.id],(err,rs1) =>{
        if(err)
          console.log(err);
        else {
          console.log('Xoa quan he voi cac danh muc thanh cong');
          console.log('---------------------------------------------');
          //Viết câu lệnh để thêm lại các danh mục mới
        for(let i=0;i<rs[1].length;i++){
          if(req.body['dm'+i]!=undefined){
            insertTopicAndCategory +=insertTopicAndCategoryItem + req.body['dm'+i]+');';
          }
        }
        console.log('insertTopicAndCategory : '+insertTopicAndCategory);
        //Thực hiện thêm danh mục lại
        if(insertTopicAndCategory !==""){
          connection.query(insertTopicAndCategory,(err,rs) =>{
            if(err) console.log(err);
            else{
              console.log('Cap nhat lai danh muc thanh cong');
              console.log('--------------------------------------------');
            }
          });
        }
        }
      });
    }
    //Xóa các danh mục đã được nối với bài viết này trước đó
    
  })
  res.redirect('/admin/topics');
});

// Add a new topic
router.get('/addnew',verifyToken.checkToken,verifyToken.protectRoute, (req,res) =>{
  var getListCategory = "SELECT * FROM danhmuc;";

  var sql = getListCategory;
  connection.query(sql, (err,rs) =>{
    if(err){
      console.log(err);
    }
    else{
      res.render('admin/ad-topic-add',{list: rs});
    }
  });
});

router.post('/addnew',verifyToken.checkToken,verifyToken.protectRoute, (req,res) =>{
  if(req.body.TieuDe === ""){
    return res.redirect('/admin/topics');
  }
  var tacGia = jwt.decode(req.cookies.Authorization).TaiKhoan;
  var TieuDeURL = changealias(req.body.TieuDe);
  var insertTopic = "INSERT INTO baiviet VALUES(?,?,?,?,?,0,0)";
  var getCategoryList = "SELECT * FROM danhmuc";
  var insertCategoryAndTopicItem = "INSERT INTO baiviet_danhmuc VALUES('"+TieuDeURL+"','";
  var insertCategoryAndTopic = "";
  //Thêm bài viết vào DB
  connection.query(insertTopic,[TieuDeURL,req.body.TieuDe,req.body.NoiDung,new Date(),tacGia],(err,rs) =>{
    if(err) console.log(err);
    connection.query(getCategoryList,(err,rs) =>{
      for(var i=0;i<rs.length;i++){
        if(req.body['dm'+i]!=undefined){
          insertCategoryAndTopic += insertCategoryAndTopicItem+req.body['dm'+i]+"');";
        }
      }
      //Thêm liên kết giữa bài viết với danh mục vào DB
      connection.query(insertCategoryAndTopic,(err,rs) =>{
        if(err) {
          console.log('them baiviet_danhmuc that bai');
          console.log(err);
          console.log('--------------------------------------------------');
        }
        console.log('them baiviet_danhmuc thanh cong');
        console.log('--------------------------------------------------');
      });
    });
  });

  res.redirect('/admin/topics');
});
//Delete a topic 
router.post('/delete/:id',verifyToken.checkToken,verifyToken.protectRoute, (req,res) =>{
  var idNeedToDelete = req.params.id;

  var deleteReplies = "DELETE FROM traloi WHERE IdBinhLuan IN (SELECT IdBinhLuan FROM binhluan WHERE TieuDeURL = ?);";
  var deleteComments = "DELETE FROM binhluan WHERE TieuDeURL = ?;";
  var deleteCategoriesLink = "DELETE FROM baiviet_danhmuc WHERE TieuDeURL = ?;"
  var deleteTopic = "DELETE FROM baiviet WHERE TieuDeURL = ?;";
  //Delete replies
  connection.query(deleteReplies,[idNeedToDelete], (err,rs)=>{
    if(err) console.log(err);
    else {
      console.log('Xoa tra loi lien quan thanh cong!')
      // delete comments
      connection.query(deleteComments,[idNeedToDelete],(err,rs) =>{
        if(err) console.log(err);
        else {
          console.log('Xoa binh luan lien quan thanh cong!');
          //delete from baiviet_danhmuc
          connection.query(deleteCategoriesLink,[idNeedToDelete],(err,rs) =>{
            if(err) console.log(err);
            else {
              console.log('Xoa baiviet_danhmuc thanh cong!');
              //delete from topic
              connection.query(deleteTopic,[idNeedToDelete],(err,rs) =>{
                if(err) console.log(err);
                else {
                  console.log('Xoa bai viet thanh cong tot dep!');
                }
              })
            }
          })
        }
      });
    }
  });
  
  connection.query(deleteTopic,[req.params.id],(err,rs) =>{
    if(err) console.log(err);
    else{
      console.log('Xoa thanh cong bai viet : '+ req.params.id);
      console.log('-----------------------------------------------------');
      res.redirect('/admin/topics');
    }
  });
});
module.exports = router;

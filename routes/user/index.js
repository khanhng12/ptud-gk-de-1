var express = require('express');
var router = express.Router();
var config = require('../databaseconfig');
const { moment } = require('moment');
var connection = config.connection;




/* GET home page. */
router.get('/', function (req, res, next) {
  var getListSql = 'select * from baiviet inner join taikhoan on tacgia = taikhoan order by NgayViet desc limit 10;';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select * from DanhMuc';
  var sql = getListSql + getTopSql + getCategoriesSql;
  connection.query(sql, function (error, results, fields) {
    if (results) {
      var length = results[0].length;
      console.log(length);
      res.locals.length = length;
      res.render('user/index', { list: results[0], topTopics: results[1], categories: results[2] });
    }
    else {
      console.log(error);
      res.render('error');
    }
  });
});

router.get('/page/:number', (req, res, next) => {
  var getListSql = 'select * from baiviet inner join taikhoan on tacgia = taikhoan order by NgayViet asc limit 10 offset ' + (req.params.number * 10 - 10) + ';';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select * from DanhMuc';
  var sql = getListSql + getTopSql + getCategoriesSql;
  connection.query(sql, function (error, results, fields) {
    if (results) {
      var length = results[0].length;
      console.log(length);
      res.locals.length = length;
      res.render('user/index', { list: results[0], topTopics: results[1], categories: results[2] });
    }
    else {
      console.log(error);
      res.render('error');
    }
  });
});

//Read one
router.get('/:item', (req, res) => {

  var getItemSql = 'SELECT * FROM baiviet where TieuDeURL = ?;';
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select * from DanhMuc;';
  var getCategoriesTopicSql = 'SELECT TenDanhMuc FROM DanhMuc INNER JOIN BaiViet_DanhMuc ON DanhMuc.IdDanhMuc = BaiViet_DanhMuc.IdDanhMuc where BaiViet_DanhMuc.TieuDeURL = ?;';
  var getCommentsByTopicId = 'SELECT * FROM binhluan INNER JOIN thongtindocgia ON binhluan.IdDocGia = thongtindocgia.IdDocGia  WHERE TieuDeURL = ? ORDER BY IdBinhLuan DESC LIMIT 10;';
  var getReplyList = 'SELECT NoiDung,traloi.IdBinhLuan,NgayViet,Ten,Email FROM traloi INNER JOIN thongtindocgia ON traloi.IdDocGia = thongtindocgia.IdDocGia WHERE IdBinhLuan IN (SELECT IdBinhLuan FROM binhluan WHERE TieuDeURL = ?);'

  var sql = getItemSql + getTopSql + getCategoriesSql + getCategoriesTopicSql + getCommentsByTopicId + getReplyList;
  res.locals.thisId = req.params.item;
  connection.query(sql, [req.params.item, req.params.item, req.params.item,req.params.item], (error, results, fields) => {
    if (results) {
      res.render('user/read', { topic: results[0], topTopics: results[1], categories: results[2], categoriesTopic: results[3], comments: results[4], replyList : results[5] });
    }
    else {
      console.log(error);
      res.render('error');
    }
  });
});

// Comments

router.post('/comment', (req, res) => {
  var time = new Date();
  var nextDirection = '/' + req.body.TieuDeURL;
  //Tạo một tài khoản đọc giả nếu chưa tồn tại tài khoản có địa chỉ email đó
  var getReaderByEmail = "SELECT * FROM thongtindocgia WHERE Email = ?";
  var createReader = "INSERT INTO thongtindocgia(Ten, Email, ThongTinThem) VALUES (?,?,'Thong tin them ne')";
  var createComment = "INSERT INTO binhluan(IdDocGia, NoiDung, TieuDeURL, NgayViet) VALUES (?,?,?,?)";
  connection.query(getReaderByEmail, [req.body.Email], (err, rs) => {
    if (err) console.log(err);
    else {
      if (rs.length > 0) {
        console.log('Gmail da ton tai!');
        console.log('------------------------------------------------');
        //Tao comment
        connection.query(createComment, [rs[0].IdDocGia, req.body.NoiDung, req.body.TieuDeURL, time], (err, rs) => {
          if (err) console.log(err);
          else {
            console.log('Them binh luan vao bai viet thanh cong');
            console.log('------------------------------------------------');
          }
        })
      }
      else {
        console.log('Gmail chua ton tai, tien hanh tao tai khoan');
        console.log('-------------------------------------------------');
        //Tao tai khoan doc gia
        connection.query(createReader, [req.body.HoTen, req.body.Email], (err, rs) => {
          if (err) console.log(err);
          else {
            console.log('Tao tai khoan doc gia thanh cong!');
            console.log('Tao comment...');
            console.log('-----------------------------------------------------');
            connection.query(createComment, [rs.insertId, req.body.NoiDung, req.body.TieuDeURL, time], (err, rs) => {
              if (err) console.log(err);
              else {
                console.log('Them binh luan thanh cong.');
                console.log('-------------------------------------------------');
              }
            })
          }
        })
      }
    }
  });
  res.redirect(nextDirection.trim());
});

//Reply

router.post('/reply', (req, res) => {

  var getReaderInfo = "SELECT * FROM thongtindocgia WHERE Email = ?;";
  var createReader = "INSERT INTO thongtindocgia(Ten, Email, ThongTinThem) VALUES (?,?,'Thong tin them ne')";
  var createReply = "INSERT INTO traloi(NoiDung,IdBinhLuan,IdDocGia,NgayViet) VALUES(?,?,?,?);";

  connection.query(getReaderInfo, [req.body.Email], (err, rs) => {
    if (err) {
      console.log(err);
    }
    else {
      if (rs.length == 0) {
        console.log('Email chua ton tai, tien hanh tao tai khoan');
        console.log('-------------------------------------------------');
        //Tao tai khoan nguoi doc
        connection.query(createReader, [req.body.HoTen, req.body.Email], (err, rs) => {
          if (err)
            console.log(err);
          else {
            console.log('Them tai khoan nguoi doc thanh cong!');
            console.log('-------------------------------------------------001');
            var idNguoiDoc = rs.insertId;
            connection.query(getReaderInfo, [rs.insertId], (err, rs) => {
              if (err)
                console.log(err);
              else {
                console.log('Tien hanh tao tra loi binh luan');
                console.log('-------------------------------------------------');
                connection.query(createReply, [req.body.NoiDung, req.body.IdBinhLuan, idNguoiDoc, new Date()], (err, rs) => {
                  if (err) console.log(err);
                  else {
                    console.log('Tao tra loi thanh cong');
                    console.log('-------------------------------------------------');
                    res.redirect('back');
                  }
                });
              }
            });

          }
        })
      }
      else {
        console.log('Email da ton tai, tien hanh tao reply');
        console.log('-------------------------------------------------');
        var idNguoiDoc = rs[0].IdDocGia;
        connection.query(createReply, [req.body.NoiDung, req.body.IdBinhLuan,idNguoiDoc, new Date()], (err, rs) => {
          if (err) console.log(err);
          else {
            console.log('Tao tra loi thanh cong');
            console.log('-------------------------------------------------');
            res.redirect('back');
          }
        })
      }
    }
  })
})

// search
router.get('/search/:keyword', (req,res) =>{
  var keyword = req.params.keyword;
  keyword = "%"+keyword+"%";
  var getTopicListByKeyWord = "SELECT * FROM baiviet WHERE TieuDeURL LIKE '" +keyword+"';";
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select * from DanhMuc;';

  var sql = getTopicListByKeyWord + getCategoriesSql+getTopSql;
  connection.query(sql, (err,rs) =>{
    if(err) console.log(err);
    else {
      res.locals.keyword = req.params.keyword;
      res.render('user/search',{list : rs[0],categories : rs[1],topTopics : rs[2]});
    }
  })
})

//search by category id
router.get('/categories/:item',(req,res) =>{
  var getTopicListByCategory = "SELECT * FROM baiviet_danhmuc INNER JOIN baiviet ON baiviet_danhmuc.TieuDeURL = baiviet.TieuDeURL WHERE IdDanhMuc = ?;";
  var getTopSql = 'select TieuDeURL,TieuDe from baiviet order by LuotXem desc limit 3;';
  var getCategoriesSql = 'select * from DanhMuc;';
  var getNameThisCategory = "SELECT TenDanhMuc FROM DanhMuc WHERE IdDanhMuc = ?;";

  var sql = getTopicListByCategory+ getCategoriesSql + getTopSql +getNameThisCategory;
  connection.query(sql,[req.params.item,req.params.item],(err,rs) =>{
    if(err) console.log(err);
    else {
      res.locals.thisCategoryName = rs[3][0].TenDanhMuc;
      console.log('Ten danh muc hien tai : '+rs[3]);
      res.render('user/categories',{list : rs[0],categories : rs[1],topTopics : rs[2]});
    }
  })
})

module.exports = router;

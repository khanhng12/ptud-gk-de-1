var express = require('express');
var router = express.Router();
var config = require('../databaseconfig');
const { route } = require('../user');
var connection = config.connection;
var bcrypt = require('bcryptjs');
var jwt = require('jsonwebtoken');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.render('login');
});

router.post('/', (req, res) => {
  console.log("Dang nhap");
  var getAccount = "SELECT * FROM taikhoan WHERE TaiKhoan = ?;"
  connection.query(getAccount, [req.body.TaiKhoan], (err, rs) => {
    if (err) throw (err);
    console.log('Dang lay tai khoan tu DB');
    console.log(rs);
    if (rs.length > 0) {
      //So sánh mật khẩu với mật khẩu đã mã hóa
      bcrypt.compare(req.body.MatKhau, rs[0].MatKhau, (err, validPass) => {
        if (err) throw(err);

        if (!validPass) {
          return res.send('Sai mat khau');
        }
        //Mật khẩu chính xác và tiến hành tạo token xác thực
        console.log("Dang nhap thanh cong.");
        console.log("Tai khoan dang nhap : "+ rs[0].TaiKhoan);
        const token = jwt.sign({ TaiKhoan: rs[0].TaiKhoan, Ten: rs[0].Ten}, process.env.TOKEN_SECRET, { expiresIn: '365d' });
        res.cookie('Authorization', token, { maxAge: "9000000" });
        return res.redirect("/admin");

      });
    }
    else{
      res.send('Dang nhap that bai');
    }

  });
});

router.post('/create', (req, res) => {
  var findAccount = "SELECT * FROM taikhoan WHERE TaiKhoan = ?;";
  var insertAccount = "INSERT INTO taikhoan VALUES(?,?,?);";

  connection.query(findAccount, [req.body.TaiKhoan], (err, rs) => {
    if (err) throw (err);
    else {
      if (rs.length > 0) {
        console.log('Tai khoan da ton tai');
        res.redirect('back');
      }
      else {
        bcrypt.genSalt(10, (err, salt) => {
          if (err) throw (err);
          bcrypt.hash(req.body.MatKhau, salt, (err, hash) => {
            if (err) throw (err);
            connection.query(insertAccount, [req.body.TaiKhoan, hash, req.body.Ten], (err, rs) => {
              console.log('Them tai khoan thanh cong');
            });
          });
        });
      }
    }
  });
});



module.exports = router;

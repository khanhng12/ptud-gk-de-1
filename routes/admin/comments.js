var express = require('express');
var router = express.Router();
var config = require('../databaseconfig')
var connection = config.connection;
var verifyToken = require('../verifyToken');

/* GET users listing. */
router.get('/',verifyToken.checkToken,verifyToken.protectRoute, function(req, res, next) {
  var getComments = "SELECT binhluan.*,thongtindocgia.*,TieuDe FROM binhluan INNER JOIN thongtindocgia ON binhluan.IdDocGia = thongtindocgia.IdDocGia INNER JOIN baiviet ON baiviet.TieuDeURL = binhluan.TieuDeURL ORDER BY binhluan.NgayViet DESC limit 10";

  connection.query(getComments, (err,rs) => {
    if(err) console.log(err);
    else{
      res.render('admin/ad-comments',{comments : rs});
    }
  });
  
});

router.post('/delete/:id',verifyToken.checkToken,verifyToken.protectRoute,(req,res) =>{
  var deleteComment = "DELETE FROM binhluan WHERE IdBinhLuan = ?;";
  var deleteReplyInclude = "DELETE FROM traloi WHERE IdBinhLuan = ?";

  connection.query(deleteReplyInclude,[req.params.id],(err,rs) =>{
    if(err) console.log(err);
    else {
      console.log('The replies were deleted');
      console.log('-------------------------------');
      connection.query(deleteComment,[req.params.id],(err,rs) =>{
        if(err) console.log(err);
        else {
          console.log('The comment has been deleted!');
          console.log('-----------------------')
          res.redirect(req.get('referer'));
        }
      })
    }
  })

})

module.exports = router;

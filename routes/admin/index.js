var express = require('express');
var router = express.Router();
app = express();

var topicsRouter = require('./topics');
var categoriesRouter = require('./categories');
var commentsRouter = require('./comments');
var loginRouter = require('./login');
var logoutRouter = require('./logout');

const { route } = require('./login');
var verifyToken = require('../verifyToken');


/* GET home page. */
router.get('/',verifyToken.checkToken,verifyToken.protectRoute, function(req, res, next) {
  res.render('admin/ad-index');
});

router.use('/topics',verifyToken.checkToken,verifyToken.protectRoute,topicsRouter);
router.use('/categories',verifyToken.checkToken,verifyToken.protectRoute,categoriesRouter);
router.use('/comments',verifyToken.checkToken,verifyToken.protectRoute,commentsRouter);
router.use('/login',loginRouter);
router.use('/logout',logoutRouter);

module.exports = router;

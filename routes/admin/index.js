var express = require('express');
var router = express.Router();
app = express();

var topicsRouter = require('./topics');
var categoriesRouter = require('./categories');
var commentsRouter = require('./comments');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('admin/ad-index');
});

router.use('/topics',topicsRouter);
router.use('/categories',categoriesRouter);
router.use('/comments',commentsRouter);

module.exports = router;

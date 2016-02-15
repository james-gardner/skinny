var passport = require('passport')
  , router = require('express').Router();

router.get('/login', 
	function (req, res) {
  	res.render('login');
	});

router.post('/login', 
  passport.authenticate('local', { failureRedirect: '/login' }),
  function(req, res) {
    res.redirect('/');
  });


module.exports = router;
var passport = require('passport')
  , user = require('../services/user')
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

// TODO: Content negotiation.
router.post('/register', 
  function (req, res) {
    user.create(req.body, function (err) {
      if(err) {
        res.render('login', { registration : {
          errors : err
        }});
      } else {

      }
    })

    
  });

module.exports = router;
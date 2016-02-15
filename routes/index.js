var passport = require('passport')
  , moment = require('moment')
  , resume = require('../services/resume')
  , router = require('express').Router();

router.get('/', 
  function (req, res, next) {
    if (req.isAuthenticated()) {
      resume.get(req.user.resume, function (err, resume) {
        if (err) return next(err);

        resume.work = resume.work.map(function (w) {
          w.started_at = moment(w.started_at).format('MMM Y');
          w.ended_at = (w.ended_at) ? moment(w.ended_at).format('MMM Y') : 'Present';

          return w;
        });

        resume.meta = {};
        resume.meta.age = moment().diff(moment(resume.updated_at, 'YYYY-MM-DD'), 'days');

        res.render('index', resume);
      })
    } else {
      res.redirect('/login');
    }
  });

module.exports = router;
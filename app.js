// Main dependencies.
var express = require('express')
  , passport = require('passport')
  , db = require('./db')
  , user = require('./services/user');


// Create express instance.
app = express();


// Configure passport local strategy.
var LocalStrategy = require('passport-local').Strategy;

passport.use(new LocalStrategy(user.authenticate));

passport.serializeUser(function(user, cb) {
  return cb(null, { id : user.id, resume : user.resume_id, status : user.status });
});

passport.deserializeUser(function(user, cb) {
  return cb(null, user);
});


// Static content folder
// -- Added BEFORE any session middleware so sessions aren't served for static resources.
// -- This will eventually be served by nginx.
app.use(express.static(__dirname + '/public'));


// Core middleware.
app.use(require('body-parser').urlencoded({ extended: false }));

app.use(require('express-session')({
  saveUninitialized : false,
  resave : false,
  secret : 'testing'
}));

app.use(passport.initialize());
app.use(passport.session());


// View engine.
app.set('views', './templates');
app.set('view engine', 'jade');


// Routes.
app.use(require('./routes/index'));
app.use(require('./routes/user'));


// Error handling middleware(s).
app.use(function (err, req, res, next) {
  next(err);
});


// Export the app so that it can used in different contexts (e.g. testing).
module.exports = app;
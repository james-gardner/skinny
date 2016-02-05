// Main dependencies.
var express = require('express')
  , passport = require('passport')
  , swig = require('swig');


// Create express instance.
app = express();


// Core middleware.
app.use(require('body-parser').json());
// app.use(require('express-session')(config.session));


// View engine.
app.engine('html', swig.renderFile);
app.set('view engine', 'html');
app.set('views', __dirname + '/views');


// Routes.
app.use(require('./routes/index'));


// Error handling middleware(s).
app.use(function (err, req, res, next) {
  next(err);
});


// Export the app so that it can used in different contexts (e.g. testing).
module.exports = app;
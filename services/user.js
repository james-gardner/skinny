var db = require('../db')
  , validator = require('validator')
  , bcrypt = require('bcrypt');

var getByUsername = function (username) {
  return db.one({ 
    name : 'find-user',
    text : 'select * from users where username = $1',
    values:  [username]
  })
};

module.exports = {
  create : function (user, cb) {
    var errors = [], types = ['agency', 'direct', 'misc'];

    if(!validator.isEmail(user.email)) {
      errors.push({ error : 'invalid email address', field : 'email' });
    }

    if(!user.type || types.indexOf(user.type) === -1) {
      errors.push({ error : 'invalid type', field : 'type'});
    }

    // This should represent a 400.
    if(errors.length) {
      return cb(errors);
    } else {  
      // User already exists represent a 409.
      
      // Any DB issues represent 500.
    }
  },

  authenticate : function (username, password, cb) {
    getByUsername(username)
    .then(function (user) {
      bcrypt.compare(password, user.password, function(err, res) {
        if(err) return cb(err);

        if(res === false || user.status === 'disabled') {
          return cb(null, false);
        }

        return cb(null, user);
      });
    })
    .catch(cb);
  }
};
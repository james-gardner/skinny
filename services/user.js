var db = require('../db')
  , validator = require('validator')
  , strip = require('striptags')
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
      return cb({ code: 400, messages : errors });
    } else {  
      db.one({
        name : 'user-exists',
        text : 'select exists(select 1 from users where username = $1) AS "exists"',
        values : [user.email.toLowerCase()]
      })
      .then(function (result) {
        if(result.exists === false) {
          db.one({
            name : 'create-user',
            text : 'insert into users (username, reason, type) values ($1, $2, $3)' ,
            values : [
              user.email.toLowerCase(),
              strip(user.reason),
              user.type
            ]
          })
          .then(function (id) {
            console.log(id);
            return cb(null, id);
          })
        } else {
          return cb({ code: 409, messages : ['User already exists'] });
        }
      })
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
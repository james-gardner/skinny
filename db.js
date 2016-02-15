var pgp = require('pg-promise')({
	promiseLib: require('bluebird')
});

var db = pgp('postgres://postgres:james@localhost/skinny');

module.exports = db;
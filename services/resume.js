var db = require('../db');

module.exports = {
  get : function (id, cb) {
    db.one('select * from resumes where id = $1', id)
      .then(function (resume) {
        return [resume, db.query('select * from work where resume_id = $1 order by started_at desc', resume.id)];
      })
      .spread(function (resume, work) {
        resume.work = work;

        cb(null, resume);
      })
      .catch(cb);
  }
};
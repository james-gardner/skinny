
(function(tagger) {
  if (typeof define === 'function' && define.amd) {
    define(function(require, exports, module) { tagger(require('riot'), require, exports, module)})
  } else if (typeof module !== 'undefined' && typeof module.exports !== 'undefined') {
    tagger(require('riot'), require, exports, module)
  } else {
    tagger(window.riot)
  }
})(function(riot, require, exports, module) {
riot.tag2('registration', '<form action="register" method="post" onsubmit="{register}"> <fieldset> <legend>Register</legend> <label for="type">What do you do?</label> <select id="type" name="type"> <option value="">Please select</option> <option value="agency">I work for an agency</option> <option value="direct">I\'m recruiting for my company</option> <option value="misc">Other</option> </select> <label for="reason">Reason for access</label> <textarea id="reason" name="reason"></textarea> <label for="email">Email Address</label> <input id="email" name="email" placeholder="user@example.com"> <input type="submit" value="submit"> </fieldset> </form>', '', '', function(opts) {
    this.register = function (e) {
      e.preventDefault();

      console.log('happy times');
    }.bind(this)
}, '{ }');
});
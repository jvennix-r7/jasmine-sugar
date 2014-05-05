//
// jasmine-sugar 0.1.0
//
// Adds some syntactic niceness to the Jasmine testing framework.
//
// Works in both node.js and a browser environment.
//
// Requires jasmine.js
//
// @author Joe Vennix
// @copyright Rapid7 2014
// @see https://github.com/jvennix-r7/jasmine-sugar
//
// Released under the MIT License.
//

(function() {
  var context, install, jasmine;

  install = function(_, jasmine) {
    var globalPatches;
    globalPatches = {
      describe: _.wrap(this.describe, function(it, description, suite) {
        var _this = this;
        if (suite) {
          return it.call(this, description, suite);
        } else {
          return function(suite) {
            return it.call(_this, description, suite);
          };
        }
      }),
      it: _.wrap(this.it, function(it, description, spec) {
        var _this = this;
        if (spec) {
          return it.call(this, description, spec);
        } else {
          return function(spec) {
            return it.call(_this, description, spec);
          };
        }
      })
    };
    return _.extend(this, globalPatches);
  };

  context = (typeof window === "object" && window) || (typeof global === "object" && global) || this;

  jasmine = context.jasmine || require("jasmine");

  if (jasmine == null) {
    console.error("jasmine-beforeSuite: Jasmine must be required first. Aborting.");
  } else {
    install.call(context, context._ || require("underscore"), jasmine);
  }

}).call(this);

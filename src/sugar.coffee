#
# jasmine-sugar 0.1.0
#
# Adds some syntactic niceness to the Jasmine testing framework.
#
# Works in both node.js and a browser environment.
#
# Requires jasmine.js
#
# @author Joe Vennix
# @copyright Rapid7 2014
# @see https://github.com/jvennix-r7/jasmine-sugar
#
# Released under the MIT License.
#

install = (_, jasmine) ->

  globalPatches =

    # Patch describe so, that, I, don't, have, to, write, code, like, -> @.
    describe: _.wrap(@describe, (it, description, suite) ->
      if suite
        it.call(@, description, suite)
      else # we are passing spec in as a function argument
        (suite) =>
          it.call(@, description, suite)
    )

    # Patch it so, that, I, don't, have, to, write, code, like, -> @.
    it: _.wrap(@it, (it, description, spec) ->
      if spec
        it.call(@, description, spec)
      else # we are passing spec in as a function argument
        (spec) =>
          it.call(@, description, spec)
    )

  # Install the global patches
  _.extend @, globalPatches

# Install the added and patched functions in the correct context
context = (typeof window == "object" && window) || (typeof global == "object" && global) || @
jasmine = context.jasmine || require("jasmine")

unless jasmine? # the user forgot to include jasmine in the environment
  console.error "jasmine-beforeSuite: Jasmine must be required first. Aborting."
else
  install.call(context, context._ || require("underscore"), jasmine)

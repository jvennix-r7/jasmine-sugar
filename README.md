[![Build Status](https://travis-ci.org/jvennix-r7/jasmine-sugar.svg?branch=master)](https://travis-ci.org/jvennix-r7/jasmine-sugar)

jasmine-sugar adds some syntactic niceness to the [Jasmine](http://jasmine.github.io/) behavior-driven development framework for testing JavaScript code. More specifically, it allows for the passing of suite and spec definitions as a parameter to a returned function, instead of as a second parameter (which is of course still supported). This is especially handy with Coffeescript, where you will end up with:

    describe("Foo") ->
      it("is red") -> expect(foo).toBeRed()

As opposed to vanilla Jasmine:

    describe "Foo", ->
      it "is red", -> expect(foo).toBeRed()

### Building from source

    $ npm i
    $ ./jake build

### Running specs

    $ ./jake spec [DEBUG=1] [SPEC=./spec/set.coffee]

### Dependencies

- underscore (~1.6)

### License

[MIT](http://en.wikipedia.org/wiki/MIT_License)

### Copyright

Rapid7 2014

require '../src/sugar'

describe('A suite with the new syntax') ->

  it('works just fine') -> expect(true).toBe(true)

  describe('A nested spec') ->

    it('also works just fine') -> expect(true).toBe(true)

describe 'A suite with the old syntax', ->

  it 'works just fine', -> expect(true).toBe(true)

  describe 'A nested spec', ->

    it 'also works just fine', -> expect(true).toBe(true)

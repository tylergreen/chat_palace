describe "Meteor", ->
  it 'tests chai.assertions', ->
    chai.assert.equal(3, 1 + 2)

  it 'has underscore', ->
    list = _.map([1,2,3], (x) -> x * 10)
    chai.assert.deepEqual([10,20,30], list)

  it 'can test objects', ->
    msg = {'message' : 'hi', 'username': 'tyler'}
    chai.assert.equal('tyler', msg.username)

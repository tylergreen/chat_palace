describe 'Chatroom', ->

  before ->
    @room = new Chatroom('gossip')

  it 'works', ->
    chai.assert.equal(3, 5-2)

  it 'can count messages', ->
    messages = [
      {'message' : 'hi', 'username': 'tyler'},
      {'message' : 'hello', 'username': 'eric'},
      {'message' : 'yes', 'username': 'tyler'}
      ]
    msg_count =  _.countBy(messages, (x) -> x.username)
    chai.assert.deepEqual({'tyler' : 2, 'eric': 1}, msg_count)

  it 'has a name', ->
    chai.assert.equal('gossip', @room.name)
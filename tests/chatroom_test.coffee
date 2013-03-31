describe 'Chatroom', ->

  before ->
    @room = new Chatroom 'gossip'

  it 'has a name', ->
    chai.assert.equal('gossip', @room.name)

  it 'maintains a count of messages', ->
    chai.assert.equal(0,@room.message_count())

  it 'can have messages added to it', ->
    count = @room.message_count()
    @room.add_message('jorge', 'hello everyone!')
    chai.assert.equal(count + 1, @room.message_count())

  it 'can list all messages', ->
    test_room = new Chatroom('test room')
    messages = [ 'hi', 'hello!' ]
    _.each(messages, (msg) -> test_room.add_message('jorge', msg))
    expected_messages = [ {username: 'jorge', text: 'hi'}, {username: 'jorge', text: 'hello!'} ]
    chai.assert.deepEqual(expected_messages, test_room.all_messages())

  it 'can list a given number of messages', ->
    test_room = new Chatroom('test room 2')
    messages = [ 'hi', 'hello!', 'greetings', 'farewell' ]
    _.each(messages, (msg) -> test_room.add_message('jorge', msg))
    expected_messages = [ {username: 'jorge', text: 'hi'},
        {username: 'jorge', text: 'hello!'}
      ]
    chai.assert.deepEqual(expected_messages, test_room.latest_messages(2))

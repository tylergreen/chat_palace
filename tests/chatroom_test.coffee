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
    expected_messages = [ {username: 'jorge', text: 'hi'},
      {username: 'jorge', text: 'hello!'} ]
    chai.assert.deepEqual(expected_messages, test_room.all_messages())

  it 'can list a given number of messages', ->
    test_room = new Chatroom('test room 2')
    messages = [ 'hi', 'hello!', 'greetings', 'farewell' ]
    _.each(messages, (msg) -> test_room.add_message('jorge', msg))
    expected_messages = [ {username: 'jorge', text: 'hi'},
        {username: 'jorge', text: 'hello!'}
      ]
    chai.assert.deepEqual(expected_messages, test_room.latest_messages(2))

  it 'keeps stats on user messages', ->
    test_room = new Chatroom('test room 3')
    jorge_messages = [ 'hi', 'hello!', 'greetings', 'farewell' ]
    _.each(jorge_messages, (msg) -> test_room.add_message('jorge', msg))
    billy_messages = [ 'yes', 'no']
    _.each(billy_messages, (msg) -> test_room.add_message('billy', msg))
    expected_stats = [{username: 'jorge', count: 4},
        {username: 'billy', count: 2} ]
    chai.assert.deepEqual(expected_stats, test_room.stats())

  it 'has deep equals', ->
    a1 = [1,[2],3]
    chai.assert.deepEqual(a1, [1,[2],3])
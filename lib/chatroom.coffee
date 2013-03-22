class Chatroom
  constructor: (@name) ->
    @Messages = new Meteor.Collection(@name)

  add_message: (username, message) ->
    @Messages.insert({'username': username, text: message})

  message_count: ->
    @Messages.find({}).count()

  all_messages: ->
    @Messages.find({}).fetch()

  latest_messages: (n) ->
    count = @message_count()
    if count < n
      message_to_skip = 0
    else
      message_to_skip = count - n
    @Messages.find({}, {skip: message_to_skip }).fetch()

root = global ? window
M = root.Meteor

Messages = new M.Collection("messages")

if M.is_client

  root.Template.message_display.message_count = ->
    Messages.find({}).count()

  messages_to_show = 10

  root.Template.message_display.message_list = ->
    n = Messages.find({}).count()
    if n < messages_to_show
      n = 0
    else
      n = n - messages_to_show
    Messages.find({}, {skip: n })

  root.Template.chatarea.events = "click input": ->
    console.log "You pressed the button"
    message = $('#chatbox').val()
    console.log "msg #{message}"
    Messages.insert({'message' : message})

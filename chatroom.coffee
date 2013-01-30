root = global ? window
M = root.Meteor

Messages = new M.Collection("messages")

if M.is_client

  root.Template.chatarea.message = ->
    n = Messages.find({}).count() - 10
    Messages.find({}, {skip: n }).map((m) -> m.message)

  root.Template.chatarea.events = "click input": ->
    console.log "You pressed the button"
    message = $('#chatbox').val()
    console.log "msg #{message}"
    Messages.insert({'message' : message})

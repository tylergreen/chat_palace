root = global ? window
M = root.Meteor

chatroom = new Chatroom('general')

if M.is_client

  Deps.autorun( () ->
    chatroom.all_message_cursor()
    .observeChanges({ added: () -> chatroom.draw_chart('#barchart') } ))

  root.Template.chat_console.message_count = ->
    chatroom.message_count()

  messages_to_show = 10

  root.Template.chat_console.message_list = ->
    chatroom.latest_messages(10)

  # this is a so called "event map"
  root.Template.chat_console.events = "click input#send_button": ->
    console.log "You pressed the button"
    message = $('#chatbox').val()
    $('#chatbox').val('')
    console.log "msg #{message}"
    chatroom.add_message(Meteor.user().username, message)

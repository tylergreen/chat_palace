root = global ? window
M = root.Meteor

Messages = new M.Collection("messages_old")

if M.is_client

  Template.stats.rendered = ->
    # figure out why this isn't getting displayed'
    #user_messages = _.filter(Messages.find({}), (msg) -> msg.username)
    #message_count = _.countBy(user_messages, (msg) -> msg.username)
    message_count = {'tyler': 10, 'eric': 4, 'jorge': 8}
    chart_height = 100
    chart = d3.select("#barchart").append("svg")
        .attr("width", "90%")
        .attr("height", "90%")
    chart.selectAll("rect").data(_.values(message_count)).enter().append("rect")
      .attr("y", (d,i) -> chart_height - (d * 10))
      .attr("x", (d,i) -> i * 20)
      .attr("width", 15)
      .attr("height", (d) -> d * 10)

  root.Template.chat_console.message_count = ->
    Messages.find({}).count()

  messages_to_show = 10

  root.Template.chat_console.message_list = ->
    n = Messages.find({}).count()
    if n < messages_to_show
      n = 0
    else
      n = n - messages_to_show
    Messages.find({}, {skip: n })

  # this is a so called "event map"
  root.Template.chat_console.events = "click input#send_button": ->
    console.log "You pressed the button"
    message = $('#chatbox').val()
    $('#chatbox').val('')
    console.log "msg #{message}"
    Messages.insert({'message' : message, 'username': Meteor.user().username})

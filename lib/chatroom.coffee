class Chatroom
  constructor: (@name) ->
    @Messages = new Meteor.Collection(@name)

  add_message: (username, message) ->
    @Messages.insert({'username': username, text: message})

  message_count: ->
    @Messages.find({}).count()

  all_messages: ->
    @Messages.find({}).fetch()

  all_message_cursor: ->
    @Messages.find({})

  latest_messages: (n) ->
    count = @message_count()
    if count < n
      message_to_skip = 0
    else
      message_to_skip = count - n
    @Messages.find({}, {skip: message_to_skip }).fetch()

  stats: () ->
    totals = _.countBy(@all_messages(), 'username')
    totals = ({name:k, count:v} for k,v of totals)
    _.sortBy(totals, 'count').reverse()

  draw_chart: (div) ->
    console.log('drawing stats:')
    console.log(@stats())
    chart = d3.select(div).select('svg').select('g')
    rect = chart.selectAll("rect").data(@stats())

    rect.enter()
      .append("rect")

    rect
      .attr("x", 0 )
      .attr("y", (d,i) -> i * 20) # bad coupling here y
      .attr("width", (d,i) -> d.count * 10) # bad coupling here x
      .attr("height", (d) -> 19)

    rect.exit().remove()

    labels = chart.selectAll('.label').data(@stats())

    labels.enter()
      .append('text')
      .attr('class', 'label')

    labels
      .attr("x", (d) -> (d.count * 10) + 5) # bad coupling here x
      .attr("y", (d,i) -> (i * 20) + 15) # bad coupling y
      .text((d) -> "#{d.name} #{d.count}")

    labels.exit().remove()

Template.stats.rendered = ->
  # figure out why this isn't getting displayed'
  #user_messages = _.filter(Messages.find({}), (msg) -> msg.username)
  #message_count = _.countBy(user_messages, (msg) -> msg.username)
  message_count = {'tyler': 10, 'eric': 4, 'jorge': 8, 'gomez' : 2}
  chart_height = 100
  #chart_width = 300
  #max = d3.max(message_count)

  #x = d3.scale.linear.domain([0, message_count.length - 1]).range([0,w])
  #y = d3.scale.linear.domain([0, max]).range([h,0])

  chart = d3.select("#barchart")
    .append("svg")
    .attr("width", "90%")
    .attr("height", "90%")

  chart.selectAll("rect")
    .data(_.values(message_count))
    .enter()
    .append("rect")
    .attr("x", 100 )
    .attr("y", (d,i) -> i * 20)
    .attr("width", (d,i) -> d * 10)
    .attr("height", (d) -> 19)

  chart.selectAll("p")
    .data(_.keys(message_count))
    .enter()
    .append("text")
    .attr("x", 0)
    #.attr("x", ((k,v),i) -> v * 10)
    .attr("y", (d,i) -> (i * 20) + 20)
    .text((d) -> d)

Template.stats.rendered = ->
  message_count = chatroom.stats()
  chart_height = 100

  chart = d3.select("#barchart")
    .append("svg")
    .attr("width", "90%")
    .attr("height", "90%")

  chart.selectAll("rect")
    .data(i.count for i in message_count) # should be tested, no logic here
    .enter()
    .append("rect")
    .attr("x", 0 )
    .attr("y", (d,i) -> i * 20) # bad coupling here y
    .attr("width", (d,i) -> d * 10) # bad coupling here x
    .attr("height", (d) -> 19)

  chart.selectAll("p") # probably a bad selector to use
    .data(message_count)
    .enter()
    .append("text")
    .attr("x", (d) -> (d.count * 10) + 5) # bad coupling here x
    .attr("y", (d,i) -> (i * 20) + 15) # bad coupling y
    .text((d) -> "#{d.name} #{d.count}")

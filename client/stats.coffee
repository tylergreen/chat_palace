Template.stats.rendered = ->
  message_count = chatroom.stats()
  chart_height = 100

  xchart = d3.select("#testarea").append("svg")
      .attr("width", "100%")
      .attr("height", "80%")
      .append('g')
      .attr("transform", "translate(200,40)")

  xchart.append('rect')
        .attr('x',0)
        .attr('y', 0)
        .attr('width', 200)
        .attr('height', 100)
        .attr('fill', d3.rgb('#0a0'))

  line = d3.svg.line()
      .x((d) -> d[0])
      .y((d) -> d[1])

  xchart.append('path')
    .attr('d', line([[0,0],[100,200], [70, 20]]))

  # chart = d3.select("#barchart")
  #   .append("svg")
  #   .attr("width", "100%")
  #   .attr("height", "50%")

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

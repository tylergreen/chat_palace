c = chai.assert

describe 'D3', ->
  it 'has map and ranges', ->
    c.deepEqual([0,10,20,30], d3.range(4).map((x) -> x * 10))

  it 'has linear scales', ->
    x = d3.scale.linear()
      .domain([0,2])
      .range([0,10])
    c.equal(0,x(0))
    c.equal(5,x(1))
    c.equal(10,x(2))
    c.equal(15,x(3))

  it 'has quadratic scales', ->
    square = d3.scale.pow()
      .exponent(2)
      .domain([0,10])
      .range([0,100])
    values1 = d3.range(5).map((i) -> square(i))
    values2 = d3.range(5).map((i) -> i * i)
    c.deepEqual(values1, values2)

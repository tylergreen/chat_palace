assert = require('chai').assert
_ = require('underscore')
{Chatroom} = require '../lib/chatroom'

it 'tests assertions', ->
  assert.equal(3, 1 + 2)

it 'has underscore', ->
  list = _.map([1,2,3], (x) -> x * 10)
  assert.deepEqual([10,20,30], list)

it 'can test objects', ->
  msg = {'message' : 'hi', 'username': 'tyler'}
  assert.equal('tyler', msg.username)

it 'can count messages', ->
  messages = [
      {'message' : 'hi', 'username': 'tyler'},
      {'message' : 'hello', 'username': 'eric'},
      {'message' : 'yes', 'username': 'tyler'}
      ]
  msg_count =  _.countBy(messages, (x) -> x.username)
  assert.deepEqual({'tyler' : 2, 'eric': 1}, msg_count)

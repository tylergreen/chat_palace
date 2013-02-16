assert = require('chai').assert
{Chatroom} = require '../lib/chatroom'

it 'has a name', ->
  room = new Chatroom('coffee-talk')
  assert.equal(room.name, 'coffee-talk')

it ''
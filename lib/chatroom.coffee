class Chatroom
  constructor: (@name) ->
    @Messages = new Meteor.Collection('messages')

  record: (message) ->
    @Messages.insert({text: message})

exports.Chatroom = Chatroom unless Meteor?
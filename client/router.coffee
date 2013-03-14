Meteor.Router.add({
  '/chat' : 'chat_console',
  '/stats' : 'stats',
  '*' : 'not_found'
  }
)

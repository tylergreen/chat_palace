Meteor.Router.add({
  '/chat' : 'chat_console',
  '/stats' : 'stats',
  '/tests' : 'tests',
  '*' : 'not_found',
  }
)

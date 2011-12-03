Request = require('./request').Request
Account = require('./reddit/account').Account
Comment = require('./reddit/comment').Comment
User = require('./reddit/user').User
Vote = require('./reddit/vote').Vote

class Reddit
  
  @login: (username, password, callback) ->
    user = new User username, password
    content = user.requestString()
    path = "/api/login/#{user.user}"
    Request.post path, content, null, (error, response) =>
      if error? then console.warn error.message
      if response?
        user.signIn response.json.data
        if callback? then return callback user
        return user

  @logout: (callback) ->
    # Logout stuff here.

  @about: (name, callback) ->
    if name?
      path = "/user/#{name}/about.json"
      Request.get path, null, (error, response) ->
        if error? then console.warn error.message
        userDetails = new Account response
        if callback? then return callback userDetails
        return userDetails

  @me: (user, callback) ->
    if user? and user.isSignedIn
      path = '/api/me.json'
      Request.get path, user.session, (errors, results) ->
        if errors? then console.warn errors.message
        userDetails = new Account results
        if callback? then return callback userDetails
        return userDetails

  @comment: (comment) ->
    # TODO: Comment post.
    # http://www.reddit.com/api/comment

  @upvote: (thing, modhash) ->
    upvote = new Vote(1)
    upvote.id = thing
    upvote.uh = modhash
    # send vote

  @downvote: (thing, modhash) ->
    downvote = new Vote(-1)
    downvote.id = thing
    downvote.uh = modhash
    # send vote

  ###
  # TODO: Visit 
  # Visit the following section to code the following
  # https://github.com/reddit/reddit/wiki/API%3A-submit
  ###
  @submitLink: (link, modhash) ->
    # Link code here
  @submitText: (text, modhash) ->
    # Text code here

  @save: (post, modhash) ->
    # save code here
  @unsave: (post, modhash) ->
    # unsave code here

  @hide: (post, modhash) ->
    # hide code ehre
  @unhide: (post, modhash) ->
    # unhide code here



root = exports ? this
root.Reddit = Reddit

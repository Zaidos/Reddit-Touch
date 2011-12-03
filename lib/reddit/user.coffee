###
# Filename: user.coffee
# Represents user login credentials.
###

class User

  api_type: 'json'
  
  constructor: (@user, @passwd) ->
    @modhash = null
    @session = null
    @isSignedIn = false
  
  user: ->
    @user

  passwd: ->
    @passwd

  isSignedIn: ->
    @isSignedIn

  signIn: (data) ->
    @modhash = data.modhash
    @session = data.cookie
    @isSignedIn = true

  requestString: ->
    if @user? and @passwd?
      return "api_type=#{@api_type}&passwd=#{@passwd}&user=#{@user}"
    throw new Error 'No user or password set.'

root = exports ? this
root.User = User

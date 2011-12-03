Thing = require('./thing').Thing

###
# POST DATA:
#
# field         example         explanation
# user          bob             username to sign in
# passwd        qwerty          user password
# api_type      json            should always be json
###
class Account extends Thing
  # Type of thing.
  kind: 't2'

  ###
  # Constructor by logged in username
  # Initializes instance variables.
  ###
  constructor: (json) ->
    # Says whether the user has unread mail from messaging/comments/posts
    @hasMail = json.data.has_mail ? null
    # User name
    @name = json.data.name ? ""
    # Unix time that user account was created.
    @created = json.data.created ? 0
    # User's modhash
    @modhash = json.data.modhash ? 0
    # Unix time that user account was created in UTC.
    @created_utc = json.data.created_utc ? 0
    # User's link karma.
    @linkKarma = json.data.link_karma ? 0
    # User's comment karma
    @commentKarma = json.data.comment_karma ? 0
    # Is user gold member? or goldfinger?
    @isGold = json.data.is_gold ? false
    # Is user mod? ROFL. NO.
    @isMod = json.data.is_mod ? false
    # User Id.
    @id = json.data.id ? "0ffff"
    # User has mod mail? Nope.
    @hasModMail = json.data.has_mod_mail ? false

root = exports ? this
root.Account = Account

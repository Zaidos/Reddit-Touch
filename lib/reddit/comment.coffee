Thing = require('./thing').Thing
###
# TODO:
# Post data
#
# field:        sample value:       explanation:
# thing_id      t3_hazko5,          the FULLname of the thing or comment you are
# or parent                         commenting
#
# text          hey, you~           the markdown of the comment you are posting
#
# uh            f0f0f0f0            my modhash
###
class Comment extends Thing

  # Type of thing
  type: 't1'

  constructor: ->
    # Holds the HTML markup to insert into the site.
    @content
    # Holds the HTML markup of the comment
    @contentHTML
    # Holds the original source (in markdown) of the comment
    @contentText
    # The FULLNAME of the comment
    @id
    # The FULLNAME of the link the comment belongs to
    @link
    ###
    # If the comment was a reply, this is FULLNAME of reply comment
    # If comment is root comment, this is the FULLNAME of the link.
    ###
    @parent
    # Brand new string, since no replies yet
    @replies = 0

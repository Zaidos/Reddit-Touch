Request = require('./../request').Request
###
# TODO: 
# Post data
#
# field:        example:        explanation:
# id            t3_6nw57        fullname of thing being voted on
#
# dir           1               direction of vote (1, 0, -1). not additive
#
# uh            f0f0f0f0        user modhash
###
class Vote

  constructor: (direction) ->
    # The FULLNAME of the THING the vote is for
    @id = ""
    ###
    # The vote direction
    #  1    - Upvote!
    #  0    - Novote
    # -1    - Downvote!!
    ###
    @dir = direction ? 0
    # User's modhash
    @uh = ""

###
# Filename: utility.coffee
# Module: -
# - Contains various utility functions
#
# TODO:
# - Maybe wrap this in a class?
##

merge: (defaults, options) ->
  defaults = defaults || {}
  if options? and typeof options is 'object'
    keys = Object.keys options
    for key in keys
      if key isnt undefined then defaults[key] = options[key]
  return defaults

root = exports ? this
root.merge = merge

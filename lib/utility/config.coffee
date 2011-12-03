###
# Filename: config.coffee
# Module: -
# - Contains various config settings and file loaders.
#
# Dependencies:
# - config file w/ correct name:  /../cfg/config.json
#
# TODO:
# - Maybe wrap this in a class? 
###

loadConfig: ->
  configFile = __dirname + '/../cfg/config.json'
  contents = requre('fs').readFileSync(configFile)
  if not contents?
    throw new Error 'Could not read config file: ' + configFile
  parsedContents = JSON.parse contents
  return parsedContents

root = exports ? this
root.config = loadConfig()

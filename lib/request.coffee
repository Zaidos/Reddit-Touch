###
# Filename: request.coffee
# Module: Request
# - Handles get and posts requests to context.
#
# Module Dependencies
# - http
# 
# TODO:
# - Add support to load config.json file.
###

# Http
_http = require('http')

# Request
class Request

  options =
    host: 'www.reddit.com'
    port: 80

  # Static get request.
  @get: (path, cookie, callback) ->
    if cookie? then options.headers['Cookie'] = "reddit_session=#{cookie}"
    options.path = path
    _http.get options, (response) ->
      data = ""
      response.on 'data', (chunk) ->
        data += chunk
      response.on 'end', () ->
        results = JSON.parse data
        if callback? then return callback null, results
        return results
    .on 'error', (error) ->
      if callback? then return callback error, null
      return error

  # Static post request.
  @post: (path, content, session, callback) ->
    headers =
      'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
      'Content-Length' : content.length

    if session? then headers['Cookie'] = "reddit_session=#{session}"

    options.path = path
    options.method = 'post'

    if content? then options.headers = headers

    request = _http.request options, (response) ->
      if response.statusCode isnt 200 then return callback response.statusCode, null
      response.setEncoding 'utf8'
      data = ""
      response.on 'data', (chunk) ->
        data += chunk
      response.on 'end', () ->
        results = JSON.parse data
        return callback null, results
    request.write content
    request.end

root = exports ? this
root.Request = Request

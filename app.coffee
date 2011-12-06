Request     = require('./lib/request').Request
Reddit      = require('./lib/reddit').Reddit
MemoryStore = require('./node_modules/connect/lib/middleware/session/memory')
connect     = require('connect')
express     = require('express')

process.addListener 'uncaughtException', (err, stack) ->
  console.log "Caught exception: #{err}\n#{stack}"
  console.log "\u0007"

# Session store
# RedisStore  = require('connect-redis')(express)

# TODO: Load from config file.

# Setup
app = module.exports = express.createServer()
app.register '.coffee', require('coffeekup').adapters.express

# Middleware
app.configure () ->
  app.use express.logger()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session ({
    key: 'touchit'
    secret: 'touchitgood'
    store: new MemoryStore({ reapInterval: 60000 * 10})
  })
  app.use app.router

# Settings
app.configure () ->
  app.set 'view engine', 'coffee'
  app.set 'views', __dirname + '/views'

###
# Development
# Show all errors 
###
app.configure 'development', () ->
  app.use express.static __dirname + '/public'
  app.use express.errorHandler({ 'dumpExceptions' : true, 'showStack' : true })

###
# Production
# Suppress errors
###
app.configure 'production', () ->
  app.use express.static __dirname + '/public', { maxAge : 86400000 }
  app.use express.errorHandler()

# Error handling
app.error (err, req, res, next) ->
  # TODO: Write to file, or db, or something...
  if (err instanceof NotFound) then res.render 'errors/404'
  else res.render 'errors/500'

NotFound = (msg) ->
  @name = 'NotFound'
  Error.call this, msg
  Error.captureStackTrace this, arguments.callee

app.all '/', (req, res) ->
  user = req.session.user
  Reddit.reddit "", (response) ->
    res.render 'index', { posts: response, user: user }

app.get '/r/:subreddit', (req, res) ->
  user = req.session.user.name
  subreddit = req.params.subreddit
  path = "/r/#{subreddit}.json"
  Request.get path, null, (error, data) ->
    res.render 'index', { posts: data, user: user }

app.get '/login', (req, res) ->
  res.render 'login', { layout: false }
app.post '/login', (req, res) ->
  userInfo = req.body.user
  Reddit.login userInfo.name, userInfo.passwd, (user) ->
    if user.isSignedIn?
      req.session.user = user
      res.redirect '/'

# Error handling.
app.get '/404', (req, res) ->
  res.render 'errors/404'
app.get '/500', (req, res) ->
  res.render 'errors/500'

app.all '*', (req, res) ->
  throw new NotFound

# Startup
app.listen 1337, null
console.log "Running in #{process.env.NODE_ENV || 'development'}"
console.log "Reddit Touch @ #{app.address().address} : #{app.address().port}"

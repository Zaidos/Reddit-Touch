Request     = require('./lib/request').Request
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
  app.use express.session { secret: 'zaidos',  cookie: { maxAge: 60000 } }
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
  req.session.views++
  Request.get '/.json', null, (error, data) ->
    res.render 'index', { posts: data }

app.get '/r/:subreddit', (req, res) ->
  subreddit = req.params.subreddit
  path = "/r/#{subreddit}.json"
  Request.get path, null, (error, data) ->
    res.render 'index', { posts: data }

app.get '/login', (req, res) ->
  res.render 'login', { layout: false}
app.post '/login', (req, res) ->
  #login user here.
  res.send JSON.stringify req.body.user

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

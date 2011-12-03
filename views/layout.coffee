doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    meta name: 'viewport', content: 'width=device-width; initial-scale=1'
    title "#{@title or 'reddit touch'}"
    meta(name: 'description', content: @description) if @description?
    
    link rel: 'stylesheet', href: 'http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.css'

    script src: 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js'
    script src: 'http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js'

  body ->
    div 'data-role' : 'page', ->
      div 'data-role': 'header', ->
        h1 'reddit touch'
        # Check is user is signed in
        a href:'/login', 'data-rel':'dialog', -> 'Login'
    
      div 'data-role': 'content', ->
        @body
    
      div 'data-role' : 'footer', ->


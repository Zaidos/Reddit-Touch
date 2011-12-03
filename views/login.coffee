div 'data-role': 'page', ->
  div 'data-role': 'header', ->
    h1 'Login'

  div 'data-role': 'content', ->
    form method: 'post', action: 'login', ->
      div ->
        text 'User: '
        input type:'text', name: "user[name]"

      div ->
        text 'Password: '
        input type:'password', name: "user[passwd]"

      input type:'submit', value:'Login'

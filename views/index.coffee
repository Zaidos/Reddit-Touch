ul 'data-role': 'listview', 'data-inset': true, 'data-filter': true, ->
  for post in @posts.data.children
    li ->
      a href: post.data.url, ->
        span class:'ui-li-count', ->
          JSON.stringify post.data.num_comments
        post.data.title


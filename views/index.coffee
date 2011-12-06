ul 'data-role': 'listview', 'data-inset': true, 'data-filter': true, ->
  for post in @posts.data.children
    li class:'link', ->
      a href: post.data.url, ->
        span class:'ui-li-count', ->
          JSON.stringify post.data.num_comments
        h3 "#{post.data.title}"
        
        p "author: #{post.data.author} subreddit: #{post.data.subreddit}"


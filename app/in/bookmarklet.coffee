sassify = ->

  d = document
  b = d.body

  # Remove script element if it already exists
  t = d.getElementById 'sass_inject_js'
  if t then b.removeChild t

  # Create script element to load inject.js, and append to b
  t = d.createElement 'script'
  t.setAttribute 'src', 'http://localhost:8001/inject.js'
  t.setAttribute 'id', 'sass_inject_js'
  # Maybe someday we'll show a note when the bookmarklet is updated
  t.setAttribute 'data-sass-inject-version', '1'
  b.appendChild t
  undefined

sassify()

undefined

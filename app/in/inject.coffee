doc = document
body = doc.body
inject = true

removeIf = (id) ->
  if typeof id != 'string'
    for s in id
      removeIf s
    return true
  tag = doc.getElementById id
  if tag
    inject = false
    body.removeChild tag

removeIf ['sass_inject_lr', 'sass_inject_css']

if inject
  s = doc.createElement 'script'
  s.setAttribute 'src', 'http://localhost:35729/livereload.js'
  s.setAttribute 'id', 'sass_inject_lr'
  body.appendChild s

  l = doc.createElement 'link'
  l.setAttribute 'rel', 'stylesheet'
  l.setAttribute 'href', 'http://localhost:8000/styles.css'
  l.setAttribute 'id', 'sass_inject_css'
  body.appendChild l

doc = document
body = doc.body

# Remove script element if it already exists
tag = doc.getElementById 'sass_inject_js'
if tag then body.removeChild tag

# Create script element to load inject.js, and append to body
tag = doc.createElement 'script'
tag.setAttribute 'src', 'http://127.0.0.1:8000/inject.js'
tag.setAttribute 'id', 'sass_inject_js'
# Maybe someday we'll show a note when the bookmarklet is updated
tag.setAttribute 'data-sass-inject-version', '1'
body.appendChild tag

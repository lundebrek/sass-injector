(function() {
  var body, doc, inject, l, removeIf, s;

  doc = document;

  body = doc.body;

  inject = true;

  removeIf = function(id) {
    var i, len, s, tag;
    if (typeof id !== 'string') {
      for (i = 0, len = id.length; i < len; i++) {
        s = id[i];
        removeIf(s);
      }
      return true;
    }
    tag = doc.getElementById(id);
    if (tag) {
      inject = false;
      return body.removeChild(tag);
    }
  };

  removeIf(['sass_inject_lr', 'sass_inject_css']);

  if (inject) {
    s = doc.createElement('script');
    s.setAttribute('src', 'http://localhost:35729/livereload.js');
    s.setAttribute('id', 'sass_inject_lr');
    body.appendChild(s);
    l = doc.createElement('link');
    l.setAttribute('rel', 'stylesheet');
    l.setAttribute('href', 'http://localhost:8000/styles.css');
    l.setAttribute('id', 'sass_inject_css');
    body.appendChild(l);
  }

}).call(this);

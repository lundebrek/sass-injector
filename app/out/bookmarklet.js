javascript:var sassify;

sassify = function() {
  var b, d, t;
  d = document;
  b = d.body;
  t = d.getElementById('sass_inject_js');
  if (t) {
    b.removeChild(t);
  }
  t = d.createElement('script');
  t.setAttribute('src', 'http://localhost:8001/inject.js');
  t.setAttribute('id', 'sass_inject_js');
  t.setAttribute('data-sass-inject-version', '1');
  b.appendChild(t);
  return void 0;
};

sassify();

void 0;

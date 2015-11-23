gulp = require 'gulp'
sass = require 'gulp-sass'
livereload = require 'gulp-livereload'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
insert = require 'gulp-insert'
serve = require 'gulp-webserver'
filter = require 'gulp-filter'
jade = require 'gulp-jade'
open = require 'gulp-open'


# Main Tasks

# default - compiles user Sass
# build - for updating bookmarklet & homepage


# Default

gulp.task 'default', ['css', 'default_in', 'serve', 'build_serve'], ->
  livereload.listen()
  gulp.watch 'in/*.scss', ['css']
  gulp.watch 'out/*.css'
    .on 'change', livereload.changed

# Create styles.scss if necessary
gulp.task 'default_in', ->
  fs = require('fs')
  styles_file = 'in/styles.scss'
  if !fs.existsSync styles_file
    !fs.writeFile styles_file, '* { color: red; }', (err) ->
      if err then return console.log err
      console.log "Created #{styles_file}"
      gulp.start ['css', 'build_open']

gulp.task 'css', ->
  filter_is_styles = filter ['*styles.scss'], {restore: true}

  gulp.src 'in/*.scss'

    .pipe filter_is_styles
    .pipe insert.prepend "@import '../app/in/flag';\n" # insert styles for "Injected" flag
    .pipe filter_is_styles.restore

    .pipe sass().on 'error', sass.logError
    .pipe gulp.dest 'out'

gulp.task 'serve', ->
  gulp.src 'out'
    .pipe serve()


# Build

gulp.task 'build',
    [ 'default',
      'bookmarklet',
      'build_html',
      'build_css',
      'build_js',
      'build_serve',
      'serve',
      'build_open' ],
    ->
  gulp.watch 'app/in/*.jade', ['build_html']
  gulp.watch 'app/in/*.scss', ['build_css']
  gulp.watch ['app/in/*.coffee', '!app/in/bookmarklet.coffee'], ['build_js']
  livereload.listen()
  gulp.watch 'app/out/*.css'
    .on 'change', livereload.changed
  gulp.watch 'app/out/*.html'
    .on 'change', livereload.changed

gulp.task 'build_html', ['bookmarklet'], ->
  gulp.src 'app/in/*.jade'
    .pipe jade pretty: true
    .pipe gulp.dest 'app/out'

gulp.task 'build_css', ->
  gulp.src 'app/in/*.scss'
    .pipe sass().on 'error', sass.logError
    .pipe gulp.dest 'app/out'

gulp.task 'build_js', ->
  gulp.src ['app/in/*.coffee', '!app/in/bookmarklet.coffee']
    .pipe coffee()
    .pipe gulp.dest 'app/out'

gulp.task 'build_serve', ->
  gulp.src 'app/out'
    .pipe serve port: 8001

gulp.task 'build_open', ->
  gulp.src ''
    .pipe open uri: 'http://localhost:8001/'

# Bookmarklet

gulp.task 'bookmarklet', ->
  gulp.src 'app/in/bookmarklet.coffee'
    .pipe coffee bare: true
    # .pipe uglify()
    .pipe insert.prepend 'javascript:'
    .pipe gulp.dest 'app/out'

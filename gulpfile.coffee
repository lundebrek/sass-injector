gulp = require 'gulp'
sass = require 'gulp-sass'
livereload = require 'gulp-livereload'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
insert = require 'gulp-insert'
serve = require 'gulp-webserver'

gulp.task 'default', ->
  gulp.start 'watch', 'serve', 'sass', 'coffee', 'bookmarklet'

gulp.task 'watch', ->
  livereload.listen()
  gulp.watch 'in/*.scss', ['sass']
  gulp.watch ['in/*.coffee','!in/bookmarklet.coffee'], ['coffee']
  gulp.watch 'in/bookmarklet.coffee', ['bookmarklet']
  gulp.watch 'out/*.css'
    .on 'change', livereload.changed

gulp.task 'serve', ->
  gulp.src 'out'
    .pipe serve()

gulp.task 'sass', ->
  gulp.src 'in/*.scss'
    .pipe insert.prepend "@import 'flag';\n"
    .pipe sass().on 'error', sass.logError
    .pipe gulp.dest 'out'

gulp.task 'coffee', ->
  gulp.src ['in/*.coffee','!in/bookmarklet.coffee']
    .pipe coffee()
    .pipe gulp.dest 'out'

gulp.task 'bookmarklet', ->
  gulp.src 'in/bookmarklet.coffee'
    .pipe coffee()
    .pipe uglify()
    .pipe insert.prepend 'javascript:'
    .pipe gulp.dest 'out'

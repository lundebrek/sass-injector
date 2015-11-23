# Sass Injector

Compile Sass and inject it into a website.

## Setup

1. Install [Node](https://nodejs.org/)
1. Install [Gulp](http://gulpjs.com)
2. Install NPM package dependencies: `npm install`
3. Run Gulp: `gulp`
4. [Install the bookmarklet](http://localhost:8001/)

## Use

1. Run Gulp, if it isn't already running: `gulp`
2. Navigate your browser to a website
3. Click the bookmarklet
4. Write styles in `in/styles.scss` and save

Your styles will appear on the webpage, and update with each save.

Watch the console for Sass errors.

To toggle style injection off, click the bookmarklet again.

_Won't work on sites protected from XSS._

## Contribute

Run `gulp build` to update the app files, including the bookmarklet file.

## Why?

I first created this tool when a client asked to have their CSS updated but couldn't give me access to their codebase (…yeah).

It also came in handy for a project with a slow front end build system.

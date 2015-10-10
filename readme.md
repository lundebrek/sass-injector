# Sass Injector

Compile Sass and inject it into a website.

- super fast
- compiles CSS on SCSS file save
- styles update when CSS changes
- no page refresh

Doesn't work on sites that protect against XSS.

## Dependencies

1. Node. To install with Homebrew: `brew install node`

## Setup

1. Install NPM package dependencies: `npm install`
2. Run Gulp: `gulp`
3. Install a **bookmarklet** based on [bookmarklet.js](http://localhost:8000/bookmarklet.js)

## Use

1. Run Gulp, if it isn't already running: `gulp`
2. Navigate your browser to a website
3. Click the bookmarklet
4. Write styles in `in/styles.scss` and save

Your styles will appear on the webpage, and update with each save.

Watch the console for Sass errors.

To toggle style injection off, click the bookmarklet again.

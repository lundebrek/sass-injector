# Sass Injector

Compile Sass and inject it into a website.

- super fast
- styles update when Sass changes
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

To toggle style injection off, click the bookmarklet again.

## Roadmap

- Create index page for webserver to show bookmarklet code as a link
- Separate "Injected" flag CSS from styles.css
- Alert user when server isn't running
  - if user clicks bookmarklet
  - if server stops after clicking bookmarklet
- Add configs to
	- import external partials
	- include Compass
	- apply Autoprefixer
- Alert user when the installed bookmarklet is out of date

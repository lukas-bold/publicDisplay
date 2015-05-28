#LMU Media Informatics Public Display :tv:

by [Lukas Rambold](http://lukasrambold.com), May `15

## Make it work:

- Install nodejs on your system and make sure that it's accesible from your global command scope
- Install the LiveReload Extension for the default web browser of your System either [Firefox](https://addons.mozilla.org/de/firefox/addon/livereload/) or [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
- execute exe/install.bat in the main directory (or run
```
npm i
npm i bower -g
bower i
```
in your console)
- use the dropbox-client to sync your slide images and markdown-files with the `slides` folder (https://www.dropbox.com/de/help/175)

*(**Side Note:** images in the `image partials` folder wont be rendered as slides)*

- to start the presentation execute exe/install.bat from the main directory (or run
```
grunt serve
```
in your console)


## Credits
- [reveal.js](http://lab.hakim.se/reveal-js)
- [YO-Generator generator-reveal](https://github.com/slara/generator-reveal)
- Grunt, Yeoman, Bower

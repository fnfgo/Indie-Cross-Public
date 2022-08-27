<!-- <p align="center">
	<img width="600" height="600" src="art/iconOG.png"> 
</p> -->

# Friday Night Funkin': Indie Cross with html5 support (No video cutscenes, sorry)
## About
FNF: Indie Cross is a massive community collaboration with the goal of bringing together an ultimate rhythm gaming experience

# Credits
### Team Credits in-game

### Friday Night Funkin'
 - [ninjamuffin99](https://twitter.com/ninja_muffin99) - Programming
 - [PhantomArcade3K](https://twitter.com/phantomarcade3k) and [Evilsk8r](https://twitter.com/evilsk8r) - Art
 - [Kawai Sprite](https://twitter.com/kawaisprite) - Music

This game was made with love to Newgrounds and its community. Extra love to Tom Fulp.'

### Bendy and the Ink Machine
 - [Joey Drew Studios](https://twitter.com/joeydrewstu)

### Cuphead
 - [Studio MDHR](https://twitter.com/studiomdhr)

### Undertale
 - [Toby Fox](https://twitter.com/tobyfox)

### Untitled Goose Game
 - [House House](https://twitter.com/house_house_)

### Adobe Animate CC - Texture Atlas for OpenFL
 - [mathieuanthoine](https://github.com/mathieuanthoine) 
 
### Indie cross HTML - Indie cross html support
 - [Memehoovy](https://github.com/MemeHoovy)
 - [LeviXDD](https://github.com/LEVIXDDLMAO)


# Installation
WE DID IT THANK GOD!!! MEMEHOOVY DID MOST OF IT LETS FLIPIN GOOOOOOO

# Node.js Instructions. (THX STACKOVERFLOW: https://stackoverflow.com/questions/10752055/cross-origin-requests-are-only-supported-for-http-error-when-loading-a-local)

First you will need Node.js installed: https://nodejs.org/

Then, make sure you have the latest npm.
```
npm install -g npm
```

After you have the latest npm install the http server.
```
npm install -g http-server
```
download from Github Actions, or in the releases. TODO: Add releases in there.
Then open command prompt, change to your game's directory, with index.html
Now, start your http server.
```
http-server -c-1
```
This spins up a Node.js httpd which serves the files in your directory as
static files accessible from http://localhost:8080

Go to your web browser, paste in http://localhost:8080 into your search bar, press enter, and enjoy playing Indie Cross.
And also once your done, press CTRL+C to close the web server.

Note that if you get an error: http-server is not recognized as a command or external command or if the same thing happens with npm, do the following.
add
```
C:\Users\username\AppData\Roaming\npm
```
and after you installed http-server
```
C:\Users\username\AppData\Roaming\npm\node_modules\http-server
```
to environment variable 'PATH'

dm me on discord if you have any issues with the server, 
or if you have any problems with figuring out how to use environment variables (remember, google is your friend)
```
MemeHoovy#8234
```
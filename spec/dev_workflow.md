# Goal
Make an acceptable build process using npm scripts that meets our preferences for using external CSS, composed and managed by LESS.

as of 3-DEC-2018

## Reference
https://css-tricks.com/why-npm-scripts/

## NPM packages installed
[ x ] npm i -D onchange

[ x ] npm i -G npm-run-all

## Component processes

### 1. Watch less and recreate CSS
On a change to any less file, rerun _lessc_ and output css to **/dist/css**. It is best to "@import" the application css into **app.css** as that's the file that gets generated. The 'watching' process will trap a change to any less file.

### 2. Watch Elm source and recreate JS
On a change, rerun run _elm make_ with cli arguments. A change to _any_ elm file will triggered the change. The elm script must be named **main.js** as that is what is referenced in the **index.html** file located in **/dist**. The script is outputted to **/dist/js/main.js**

### 3. Run a DEV SERVER watching /dist files 
On any change to files in **/dist**, reload the dev server.  This sort of works, we're still trying to isolate the cases (CSS reloads do not seem to reload automatically?)

## Starting a new dev session

a. Open a hyper terminal and cd into the project root folder.  (ie, materialistic-elm)

b. From hyper, open a new tab [ Cmd+T ].

c. In one hyper: ```npm start``` - this launches the dev server, the dev files watcher and the less watcher.

b. In the other hyper: ```npm run dev``` - this launches the elm watcher.

---

**Note**: We want the Elm watcher/compiler to be in its own terminal window so that we can see the feedback it gives back to us directly.

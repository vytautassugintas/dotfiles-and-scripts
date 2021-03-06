# CLI utilities

### Useful commands
kill process which runs on given port
```
lsof -ti:5200 | xargs kill
```
### Check Current Weather

simply curl [wttr.in](https://github.com/chubin/wttr.in)

```
curl wttr.in
```

### Interned Speed Test

install [speedtest-cli](https://github.com/sivel/speedtest-cli) utility

```
pip install speedtest-cli
```

and run `speedtest-cli` which will show donwload / upload speeds

```
speedtest-cli
```

### Check CPU Temperature

Install `iStats`

```
gem install iStats
```

then run `istats` and it will show CPU temp and fan speed

```
istats
```

# Linux aliases

#### Scroll lock controlls

```bash
alias scroll-on="xset led named \"Scroll Lock\""
alias scroll-off="xset -led named \"Scroll Lock\""
```

# Dev

#### TS and SCSS compilation with npm scripts only

install modules (includes live reload)
```bash
yarn add autoprefixer live-server node-sass nodemon npm-run-all postcss-cli typescript --dev
```

add to `package.json` scripts
```json
  "scripts": {
    "live-server": "live-server --watch=dist,index.html --port=1337",
    "build-task:scss-compile": "node-sass *.scss -o dist",
    "build-task:autoprefixer": "postcss dist/*.css --use autoprefixer -d dist",
    "ts:build": "tsc",
    "ts:watch": "nodemon -e ts --exec 'yarn ts:build'",
    "sass:build": "npm-run-all -p build-task:*",
    "sass:watch": "nodemon -e scss --exec 'yarn sass:build'",
    "dev": "npm-run-all -p live-server sass:* ts:*"
  }
```

A zsh function to get Chrome's current url:

```bash
getURL(){
  url=$(osascript -e 'tell application "Google Chrome" to return URL of active tab of front window')

  echo $url
}
```

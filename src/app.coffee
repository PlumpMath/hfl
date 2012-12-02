http = require "http"
path = require "path"
express = require "express"
i18n = require "i18n"

app = express();

app.configure () ->
    app.set "port", process.env.PORT || 3000
    i18n.configure locales: ["en"]
    app.locals.__i = (s) -> i18n.__ s
    app.set "views", __dirname + "/views"
    app.set "view engine", "html"
    app.set "layout", "layout"
    app.set "partials", header: "header", footer: "footer"
    app.engine "html", require("hogan-express")
    app.use express.favicon()
    app.use express.logger("dev")
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    app.use require("less-middleware")(src: __dirname + "/public")
    app.use express.static(path.join(__dirname, "public"))

app.configure "development", () -> app.use express.errorHandler()

app.get "/", (req, res) ->
    res.render "index"

http.createServer(app).listen app.get("port"), () ->
    console.log "Express server listening on port #{ app.get('port') }"
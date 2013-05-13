local wibox = require("wibox")
local awful = require("awful")
local vicious = require("vicious")


--cpuwidget =wibox.widget.textbox()
--vicious.register(cpuwidget, vicious.widgets.cpu, " $1%) ")

memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, " $1% ($2MB/$3MB) ", 13)


cpuwdg = awful.widget.graph()
cpuwdg:set_width(50)
cpuwdg:set_background_color("#494B4F")
cpuwdg:set_color("#FF5656")
--cpuwdg.set_color({type = "linear", from = {0, 0}, to = {10,0}, stops = {{0,"#FF5656"},{0.5, "#88A175"},{1, "#AECF96"}}})
--cpuwdg:set_gradient_colors({"#FF5656", "#88A175", "#AECF96"})
vicious.register(cpuwdg, vicious.widgets.cpu, "$1", 3)

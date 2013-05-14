local wibox = require("wibox")


--Create battery widget
battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

function batteryInfo(adapter)
    local fcur = io.open("/sys/class/power_supply/"..adapter.."/charge_now")
    local fcap = io.open("/sys/class/power_supply/"..adapter.."/charge_full")
    local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
    local cur = fcur:read()
    local cap = fcap:read()
	local sta = fsta:read()
	local battery = math.floor(cur * 100 / cap)
	if sta:match("Charging") then
           dir = "^"
           battery = "A/C ("..battery..")"	
	elseif sta:match("Discharging") then
		dir="v"
           	battery = "BTA1 ("..battery..")"	
	else
		dir = "="
		battery = "A/C ("..battery..")"
	end
	battery_widget:set_markup(" Bat: "..dir..battery..dir.." ")
	fcur:close()
end

battery_timer = timer({timeout = 20})
battery_timer:connect_signal("timeout", function() batteryInfo("BAT1") end )

battery_timer:start()

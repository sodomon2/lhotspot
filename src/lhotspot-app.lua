--[[--
 @package   LHotspot
 @filename  lhotspot-app.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Diego Alejandro <sodomon2@gmail.com>
 @date      17.06.2021 20:10:54 -04
]]

function make_random()
	math.randomseed(os.time())
	random_id = tostring(math.random(1, 100))
	return random_id
end

ssid = ("LHotspot%s%s"):format(make_random(), math.random(1, 100)) or ui.entry_ssid.text
ui.entry_ssid.text = ssid

function ui.btn_hotspot:on_clicked()
	password = ui.entry_password.text
	os.execute("lnxrouter --ap wlan0 " .. ssid .. " -p " .. password .. " &")
	self.sensitive = false
	ui.btn_stop.sensitive = true
	ui.headerbar.subtitle = 'Status: Running'
end

function ui.btn_stop:on_clicked()
	ui.btn_hotspot.sensitive = true
	self.sensitive = false
	os.execute("lnxrouter --stop wlan0")
	ui.headerbar.subtitle = 'Status: Not Running'
end

function ui.main_window:on_destroy()
	Gtk.main_quit()
	os.execute("lnxrouter --stop wlan0")
end

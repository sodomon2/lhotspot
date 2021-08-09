--[[--
 @package   LHotspot
 @filename  lhotspot-tray.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Diego Alejandro <sodomon2@gmail.com>
 @date      09.08.2021 12:26:38 -04
]]

function statusicon()
	visible = not visible
	if visible then
		ui.main_window:run()
	else
		ui.main_window:hide()
	end
end

function ui.tray:on_activate()
	statusicon()
end

function create_menu(event_button, event_time)
	local menu = Gtk.Menu {
		Gtk.ImageMenuItem {
			label = "Quit",
			image = Gtk.Image {
				stock = "gtk-quit"
			},
			on_activate = function()
			Gtk.main_quit()
		end
		}
	}
	menu:show_all()
	menu:popup(nil, nil, nil, event_button, event_time)
end

function ui.tray:on_popup_menu(ev, time)
	create_menu(ev, time)
end

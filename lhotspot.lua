--[[--
 @package   LHotspot
 @filename  lhotspot.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      17.06.2021 20:06:59 -04
]]

lgi       = require('lgi')
GObject   = lgi.require('GObject','2.0')
GLib      = lgi.require('GLib','2.0')
Gdk       = lgi.require('Gdk', '3.0')
Gtk       = lgi.require('Gtk', '3.0')

builder   = Gtk.Builder()

assert(builder:add_from_file('data/ui/lhotspot.ui'))
ui = builder.objects

-- Hotspot
require('src.lhotspot-app')

ui.main_window:show_all()
Gtk.main()

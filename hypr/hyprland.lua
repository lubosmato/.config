-- Hyprland Lua config
-- Migrated from hyprland.conf

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "3840x2160@120",
	position = "0x0",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "vicinae toggle"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("udiskie -t &")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Layouts
hl.config({
	dwindle = {
		-- pseudotile    = true,
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "cz",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		numlock_by_default = true,

		repeat_delay = 170,
		repeat_rate = 30,

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},

		accel_profile = "custom 0.1523707701 0.000 0.056 0.111 0.167 0.222 0.299 0.383 0.467 0.550 0.634 0.717 0.801 0.885 0.998 1.125 1.252 1.379 1.506 1.633 1.760 1.887 2.014 2.141 2.268 2.395 2.522 2.649 2.776 2.903 3.030 3.157 3.284 3.411 3.538 3.665 3.792 3.919 4.046 4.173 4.435",
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.window.center())
-- hl.bind(mainMod .. " + O", hl.dsp.window.resize({ exact = "1200 800" }))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Resize active window with mainMod + arrows (up/left increase, down/right decrease)
local resizeStep = 30
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }), { repeating = true })
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true })
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true })

-- Switch workspaces with mainMod + Czech number row keys
hl.bind(mainMod .. " + plus", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + ecaron", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + scaron", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + ccaron", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + rcaron", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + zcaron", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + yacute", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + aacute", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + iacute", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + eacute", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + keys
hl.bind(mainMod .. " + SHIFT + plus", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + ecaron", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + scaron", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + ccaron", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + rcaron", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + zcaron", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + yacute", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + aacute", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + iacute", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + eacute", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Cycle workspaces with mainMod + CTRL + h/l
hl.bind(mainMod .. " + CTRL + l", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + h", hl.dsp.focus({ workspace = "-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Vicinae launcher
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vicinae deeplink vicinae://launch/clipboard/history"))

-- Screenshots (hyprshot)
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Steam window rule
hl.window_rule({
	name = "fix-steam-float",
	match = {
		class = "steam",
		initial_title = "Steam",
		float = true,
	},
	float = false,
	maximize = true,
})

-- Suppress maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run window rule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

-- Vicinae blur layer rule
hl.layer_rule({
	name = "vicinae-blur",
	match = { namespace = "vicinae" },
	blur = true,
	ignore_alpha = 0,
})

-- Dunst notifications blur layer rule
hl.layer_rule({
	name = "dunst-blur",
	match = { namespace = "notifications" },
	blur = true,
	ignore_alpha = 0.2,
})

-- Float windows on workspace 2
hl.window_rule({
	name = "float-on-workspace-2",
	match = { workspace = "2" },
	float = true,
	size = "1200 800",
	center = true,
})
